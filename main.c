#include <openssl/conf.h>
#include <openssl/evp.h>
#include <openssl/err.h>
#include <string.h>
#include <openssl/pem.h>

#include "slurpfile.h"
#include "crypto.h"
#include "util.h"

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



    slurpfile("../pubkey.pem", &buffer, 1);
    printf("%s\n", buffer);
    RSA *rsa = getPubKeyFromPemStr(buffer);

    EVP_PKEY *pubkey = EVP_PKEY_new();
    EVP_PKEY_set1_RSA(pubkey, rsa);
    EVP_PKEY **pubk = (EVP_PKEY **)malloc(sizeof(EVP_PKEY *) * npubk);
    pubk[0] = pubkey;
    ek[0] = (unsigned char *)malloc((size_t) EVP_PKEY_size(pubk[0]));
    printf("RESULTS:\n");
    //ciphertext_len = envelope_seal(&pubkey, plaintext,(int) strlen(plaintext), &ek, &encrypted_key_len, iv, ciphertext );
    //printf("cypher length: %d\n", ciphertext_len);
    //EVP_CIPHER_CTX *ctx = EVP_CIPHER_CTX_new();


    //EVP_SealInit(ctx, EVP_aes_256_cbc(), ek, ekl, iv, pubk, npubk);
    //int retcode = EVP_SealInit(ctx,EVP_aes_256_cbc(), ek, ekl, iv, pubk, 1);
    int ciphertext_len = envelope_seal(pubk,plaintext, (int) strlen(plaintext),ek, ekl, iv, ciphertext);
    printf("envelope_seal (ciphertext_len): %d\n", ciphertext_len);

    hexDump ("envelope_seal (iv)", &iv, sizeof (iv)); // aes initial val
    printf("envelope_seal (sizeof(iv)): %d\n\n", (int) sizeof(iv));


    hexDump ("envelope_seal (ek[0])", ek[0], sizeof (ek[0])); // should be size 16 -encrypted key
    printf("envelope_seal (sizeof(ek[0])): %d\n\n", (int) sizeof(ek[0]));



    printf("envelope_seal (ekl0): %d\n", ekl[0]); // should be 256 - encrypted key length


    hexDump ("envelope_seal (ciphertext)", &ciphertext, ciphertext_len);
    //BIO_dump_fp (stdout, (const char *)ciphertext, ciphertext_len);

    FILE *write_ptr;

    write_ptr = fopen("test.bin","wb");  // w for write, b for binary

    fwrite(ciphertext, (size_t) ciphertext_len,1,write_ptr); // write 10 bytes from our buffer
    fwrite(iv, sizeof(iv), 1, write_ptr);
    fwrite(ek[0], sizeof(iv), 1, write_ptr);
    fclose(write_ptr);


    EVP_PKEY *privkey = EVP_PKEY_new();

    FILE *fp = fopen ("../privkey.pem", "r");

    PEM_read_PrivateKey( fp, &privkey, NULL, NULL);
    fclose(fp);

    if(RSA_check_key(EVP_PKEY_get1_RSA(privkey))) {
        printf("RSA key is valid.\n");
    }

    unsigned char decrypted[1024];
    int plaintext_len = envelope_open(privkey, ciphertext, ciphertext_len, ek[0], ekl[0], iv, decrypted);

    printf("decrypted: %.*s", plaintext_len, (char *) decrypted);

    EVP_PKEY_free(privkey);
    //EVP_CIPHER_CTX_free(ctx);
    EVP_PKEY_free(pubkey);
    free(buffer);
    free(pubk);

    /* Clean up */
    EVP_cleanup();
    ERR_free_strings();

    return 0;
}
