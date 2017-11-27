#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <string.h>

#include "slurpfile.h"
#include "crypto.h"

void handleErrors(){
    printf("ERROR\n");
}

int encrypt(unsigned char *plaintext, int plaintext_len, unsigned char *key,
            unsigned char *iv, unsigned char *ciphertext)
{
    EVP_CIPHER_CTX *ctx;

    int len;

    int ciphertext_len;

    /* Create and initialise the context */
    if(!(ctx = EVP_CIPHER_CTX_new())) handleErrors();

    /* Initialise the encryption operation. IMPORTANT - ensure you use a key
     * and IV size appropriate for your cipher
     * In this example we are using 256 bit AES (i.e. a 256 bit key). The
     * IV size for *most* modes is the same as the block size. For AES this
     * is 128 bits */
    if(1 != EVP_EncryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv))
        handleErrors();

    /* Provide the message to be encrypted, and obtain the encrypted output.
     * EVP_EncryptUpdate can be called multiple times if necessary
     */
    if(1 != EVP_EncryptUpdate(ctx, ciphertext, &len, plaintext, plaintext_len))
        handleErrors();
    ciphertext_len = len;

    /* Finalise the encryption. Further ciphertext bytes may be written at
     * this stage.
     */
    if(1 != EVP_EncryptFinal_ex(ctx, ciphertext + len, &len)) handleErrors();
    ciphertext_len += len;

    /* Clean up */
    EVP_CIPHER_CTX_free(ctx);

    return ciphertext_len;
}



int decrypt(unsigned char *ciphertext, int ciphertext_len, unsigned char *key,
            unsigned char *iv, unsigned char *plaintext)
{
    EVP_CIPHER_CTX *ctx;

    int len;

    int plaintext_len;

    /* Create and initialise the context */
    if(!(ctx = EVP_CIPHER_CTX_new())) handleErrors();

    /* Initialise the decryption operation. IMPORTANT - ensure you use a key
     * and IV size appropriate for your cipher
     * In this example we are using 256 bit AES (i.e. a 256 bit key). The
     * IV size for *most* modes is the same as the block size. For AES this
     * is 128 bits */
    if(1 != EVP_DecryptInit_ex(ctx, EVP_aes_256_cbc(), NULL, key, iv))
        handleErrors();

    /* Provide the message to be decrypted, and obtain the plaintext output.
     * EVP_DecryptUpdate can be called multiple times if necessary
     */
    if(1 != EVP_DecryptUpdate(ctx, plaintext, &len, ciphertext, ciphertext_len))
        handleErrors();
    plaintext_len = len;

    /* Finalise the decryption. Further plaintext bytes may be written at
     * this stage.
     */
    if(1 != EVP_DecryptFinal_ex(ctx, plaintext + len, &len)) handleErrors();
    plaintext_len += len;

    /* Clean up */
    EVP_CIPHER_CTX_free(ctx);

    return plaintext_len;
}




int main (void)
{
  /* Set up the key and iv. Do I need to say to not hard code these in a
   * real application? :-)
   */
    int npubk = 1; /* number of pub keys used to encrypt blob */
    
    /* allocate memory for encrypted key array*/
    unsigned char **ek = (unsigned char **)malloc(sizeof(unsigned char *) * npubk);
    
    /* allocate mem for key length array */
    int *ekl = (int *)malloc(sizeof(int) * npubk);
    
    /* allocate me for aes initial value (16 bytes) */
    unsigned char iv[16];

    /* buffer to contain PEM encoded pub key once deserialized */
    char *buffer = NULL;
    
    
    /* Message to be encrypted */
    unsigned char *plaintext =
                (unsigned char *)"The quick brown fox jumps over the lazy dog";


    unsigned char ciphertext[1024];

    /* Buffer for the decrypted text */
    unsigned char decryptedtext[1024];

    /* Initialise the library */
    ERR_load_crypto_strings();
    OpenSSL_add_all_algorithms();
    OPENSSL_config(NULL);

    slurpfile("../pubkey.pem", &buffer, 1);
    printf("%s\n", buffer);
    RSA *rsa = getPubKeyFromPemStr(buffer);

    EVP_PKEY *pubkey = EVP_PKEY_new();
    EVP_PKEY_set1_RSA(pubkey, rsa);
    EVP_PKEY **pubk = (EVP_PKEY **)malloc(sizeof(EVP_PKEY *) * npubk);
    pubk[0] = pubkey;
    ek[0] = (unsigned char *)malloc(EVP_PKEY_size(pubk[0]));
    printf("PKEY Created\n");
    //ciphertext_len = envelope_seal(&pubkey, plaintext,(int) strlen(plaintext), &ek, &encrypted_key_len, iv, ciphertext );
    //printf("cypher length: %d\n", ciphertext_len);
    //EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();


    //EVP_SealInit(ctx, EVP_aes_256_cbc(), ek, ekl, iv, pubk, npubk);
    //int retcode = EVP_SealInit(ctx,EVP_aes_256_cbc(), ek, ekl, iv, pubk, 1);
    int ciphertext_len = envelope_seal(pubk,plaintext, (int) strlen(plaintext),ek, ekl, iv, ciphertext);
    printf("\nenvelope_seal (ciphertext_len): %d", ciphertext_len);
    printf("\nenvelope_seal (iv): %s", iv); // aes initial val
    printf("\nenvelope_seal (sizeof(iv)): %d", (int) sizeof(iv));
    printf("\nenvelope_seal (ek0): %s", ek[0]); // should be size 16 -encrypted key
    printf("\nenvelope_seal (ekl0): %d", ekl[0]); // should be 256 - encrypted key length
    printf("\nenvelope_seal (ciphertext): %s\n", ciphertext);
    BIO_dump_fp (stdout, (const char *)ciphertext, ciphertext_len);
    
    
    





    //EVP_CIPHER_CTX_free(ctx);
    EVP_PKEY_free(pubkey);
    free(buffer);
    free(pubk);
    exit(0);
//  /* Encrypt the plaintext */
//  ciphertext_len = encrypt (plaintext, strlen ((char *)plaintext), key, iv,
//                            ciphertext);
//
//  /* Do something useful with the ciphertext here */
//  printf("Ciphertext is:\n");
//  BIO_dump_fp (stdout, (const char *)ciphertext, ciphertext_len);
//
//  /* Decrypt the ciphertext */
//  decryptedtext_len = decrypt(ciphertext, ciphertext_len, key, iv,
//    decryptedtext);
//
//  /* Add a NULL terminator. We are expecting printable text */
//  decryptedtext[decryptedtext_len] = '\0';
//
//  /* Show the decrypted text */
//  printf("Decrypted text is:\n");
//  printf("%s\n", decryptedtext);

  /* Clean up */
  EVP_cleanup();
  ERR_free_strings();

  return 0;
}
