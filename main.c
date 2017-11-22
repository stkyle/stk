/**
 * Crypto Implementation
 *
 * Pre-requisite: RSA Public Key File
 *     - Generating RSA Key Pair:
 *         1. Create Private Key: openssl genrsa -out privkey 2048
 *         2. Use Private Key to create Public Key: openssl rsa -in privkey.pem -pubout pubkey.pem
 */

#include <stdio.h>
#include <string.h>

#include <openssl/rsa.h>
#include <openssl/evp.h>
#include <openssl/pem.h>
#include <openssl/err.h>
#include <openssl/rand.h>


void handle_error(char * msg);
void init_libcrypto(void);

char pub_key_text[] = "-----BEGIN PUBLIC KEY-----\n"\
        "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwT/yK9RJ+gxYhXkwWkSc\n"\
        "Yo4e0g2h/ct9ETcL0YQJDT8v49bmtqZVcg7pNeT2TV3NqrJfYdBAhEkbhY0r+Zg2\n"\
        "paFrkz/e+AtzHf6Farstwt3r6SZ8HVNgq9UrT5U8VeqRMqQclb2wid3f3lpKT312\n"\
        "kPO+Mmee4JOwXpC+8Zc3KgZ43g653Q3ufj4VOHMywQTY5HIiAVl+diPuLwltX8gd\n"\
        "kpRWv+rEbz5zpCMKtNjbgGL4oPJq/oHCdRDOlCpPMqLMnEIDwTmx0x8c9+gQHVMd\n"\
        "sSPKfL+XsrQmLqw/a9GzkDYr00e/8LbEeERHwRmwtkziBJ4Dammy6VTC8H5KEsXS\n"\
        "3QIDAQAB\n"\
        "-----END PUBLIC KEY-----";

RSA * load_pubkey(unsigned char * key)
{
    /* Read PEM Encoded Public Key from memory into an RSA Structure */
    RSA *rsa= NULL;
    BIO *keybio ;
    keybio = BIO_new_mem_buf(key, -1);
    rsa = PEM_read_bio_RSA_PUBKEY(keybio, &rsa,NULL, NULL);
    return rsa;
}

long slurpfile(char const* path, char **buf, int add_nul)
{
    FILE  *fp;
    size_t fsz;
    long   off_end;
    int    rc;

    /* Open the file */
    fp = fopen(path, "rb");
    if( NULL == fp ) {
        return -1L;
    }

    /* Seek to the end of the file */
    rc = fseek(fp, 0L, SEEK_END);
    if( 0 != rc ) {
        return -1L;
    }

    /* Byte offset to the end of the file (size) */
    if( 0 > (off_end = ftell(fp)) ) {
        return -1L;
    }
    fsz = (size_t)off_end;

    /* Allocate a buffer to hold the whole file */
    *buf = malloc( fsz+(int)add_nul );
    if( NULL == *buf ) {
        return -1L;
    }

    /* Rewind file pointer to start of file */
    rewind(fp);

    /* Slurp file into buffer */
    if( fsz != fread(*buf, 1, fsz, fp) ) {
        free(*buf);
        return -1L;
    }

    /* Close the file */
    if( EOF == fclose(fp) ) {
        free(*buf);
        return -1L;
    }

    if( add_nul ) {
        /* Make sure the buffer is NUL-terminated, just in case */
        buf[fsz] = '\0';
    }

    /* Return the file size */
    return (long)fsz;
}


RSA * getPubKeyFromText(unsigned char * key)
{
    RSA *rsa= NULL;
    BIO *keybio ;
    keybio = BIO_new_mem_buf(key, -1);
    if (keybio==NULL)
    {
        printf( "Failed to create key BIO");
        return 0;
    }
    rsa = PEM_read_bio_RSA_PUBKEY(keybio, &rsa,NULL, NULL);
    if(rsa == NULL)
    {
        printf( "Failed to create RSA");
    }

    return rsa;
}

int public_encrypt(unsigned char * data, int data_len, RSA * pubkey, unsigned char *encrypted)
{
    int result = RSA_public_encrypt(data_len,data,encrypted,pubkey,RSA_PKCS1_PADDING);
    return result;
}


int main(){
    printf("Crypto Implementation\n");

    // declarations
    const char * pub_keyfile_name = "../pubkey.pem";
    const EVP_CIPHER* pCipher = NULL;
    FILE*     pFile    = NULL;
    EVP_PKEY* pPubKey  = NULL;
    RSA* pRsaKey = NULL;


    // init crypto lib
    init_libcrypto();

    // load public key from file

    //pFile = fopen( pub_keyfile_name, "r");
    char * buffer;
    long pemSize = slurpfile(pub_keyfile_name, &buffer, 1);
    printf("%s\n", buffer);
    printf("pemSize :%d\n", (int) pemSize);
    printf("strlen :%d\n", (int) strlen(buffer));
    pRsaKey = getPubKeyFromText(buffer);


    char * number_str = BN_bn2hex(pRsaKey->e);

    printf("exponent: %s\n", number_str);
    free(buffer); // free heap space

    unsigned char plainText[2048/8] = "this is some dummy text"; //key length : 2048
    unsigned char  encrypted[4098]={};
    unsigned char decrypted[4098]={};

    int enc_length = public_encrypt(plainText, (int) strlen(plainText), pRsaKey, encrypted);
    printf("length: %d\n", enc_length);
    printf("encrypted data: %s", (const char *) encrypted, enc_length);

    //sprintf("enc  length: %d", enc_length);
    //RSA *PEM_read_RSA_PUBKEY(FILE *fp, RSA **x,
    //                         pem_password_cb *cb, void *u);

    //pub_key = PEM_read_RSA_PUBKEY(pub_keyfile, NULL, NULL, NULL);
    //pub_key = load_pubkey(pub_key_text);
    //printf("modulus: %d\n", (int) pub_key->n);
    //printf("exp: %d\n", (int) pub_key->e);
//    if(RSA_check_key(pub_keyfile_rsa)) {
//        printf("RSA key is valid.\n");
//    }
//    else {
//        printf("Error validating RSA key.\n");
//    }
    //unsigned char * modulus;
    //unsigned char * exp;
    //BN_bn2bin(pub_keyfile_rsa->n, (unsigned char *)modulus);
    //BN_bn2bin(pub_keyfile_rsa->e, (unsigned char *)exp);
    //printf("\n%s\n%s\n", exp, modulus);

    // cleanup
    //fclose(pub_keyfile);
    RSA_free(pRsaKey);
}


void init_libcrypto(void)
{
    if(1)
    {
        //SSL_load_error_strings();
        //OpenSSL_add_all_algorithms();
        RAND_load_file("/dev/urandom", 1024);
    }
    else
        exit(EXIT_FAILURE);
}

void cleanup_openssl(void)
{
    CRYPTO_cleanup_all_ex_data();
    ERR_free_strings();
    ERR_remove_thread_state(0);
    EVP_cleanup();
}

void handle_openssl_error(void)
{
    ERR_print_errors_fp(stderr);
}

void handle_error(char * msg)
{
    perror(msg);
}



//CMakeLists.txt
set(CMAKE_VERBOSE_MAKEFILE OFF)
cmake_minimum_required(VERSION 3.8)
project(mytestproject)

set(CMAKE_C_STANDARD 99)
SET(CMAKE_SYSTEM_NAME Linux)




MESSAGE( STATUS "CMAKE_BINARY_DIR:         " ${CMAKE_BINARY_DIR} )
set(SOURCE_FILES oldmain.c config.h certpubkey.c encrypt.c decrypt.c crypt.c main.c)
add_executable(mytestproject ${SOURCE_FILES})




# OpenSSL/libcrypto (find, include, link)
find_package(OpenSSL REQUIRED)
message(STATUS "OPENSSL_VERSION: ${OPENSSL_VERSION}")
message(STATUS "OPENSSL_CRYPTO_LIBRARIES: ${OPENSSL_CRYPTO_LIBRARIES}")
include_directories(${OPENSSL_INCLUDE_DIR})
target_link_libraries(${PROJECT_NAME} ${OPENSSL_CRYPTO_LIBRARIES})


#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
#    message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
