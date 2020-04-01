// cryptoDemo.cpp : Defines the entry point for the console application.
// Windows: cl cryptoDemo.cpp
// Linux: gcc -o encfile encfile.cpp -lcrypto -std=gnu++0x -U__STRICT_ANSI__

#include <memory.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/stat.h>

#include "openssl/aes.h"

#pragma comment(lib, "libeay32.lib")

void encFileAES(char *sourceFile, FILE *fpIn, long fileSize, char *passwd, int pwdLen)
{
    // create encrypted file
    char destFile[160] = "en_";
    strcat(destFile, sourceFile);
    FILE *fpOut = fopen(destFile, "wb");
    if (fpOut == NULL)
    {
        printf("Cannot create encrypted file.\n");
        return;
    }

    // prepare 32 Bytes (256 bits) AES key buffer
    unsigned char aes_keybuf[32];
    memset(aes_keybuf, 0x13, 32);
    for (int i = 0; i < pwdLen && i < 32; i++)
    {
        aes_keybuf[i] = passwd[i];
    }

    // set encrypt key
    AES_KEY aeskey;
    AES_set_encrypt_key(aes_keybuf, 256, &aeskey);

    // separate input file
    int nLoop, nRes, nPadding;
    nLoop = fileSize / 16 + 1;
    nRes = fileSize % 16;
    nPadding = 16 - nRes;

    // encrypt file
    int row;
    unsigned char buf[16], buf2[16];
    for (row = 0; row < nLoop; row++)
    {
        memset(buf, nPadding, 16);
        fread(buf, sizeof(char), 16, fpIn);
        AES_encrypt(buf, buf2, &aeskey);
        fwrite(buf2, sizeof(char), 16, fpOut);
    }

    fclose(fpIn);
    fclose(fpOut);
    printf("\nSuccessfully encrypt to %s.\n", destFile);
}

void decFileAES(char *sourceFile, FILE *fpIn, long fileSize, char *passwd, int pwdLen)
{
    // create decrypted file
    char destFile[160] = "de_";
    strcat(destFile, sourceFile);
    FILE *fpOut = fopen(destFile, "wb");
    if (fpOut == NULL)
    {
        printf("Cannot create decrypted file.\n");
        return;
    }

    // prepare 32 Bytes (256 bits) AES key buffer
    unsigned char aes_keybuf[32];
    memset(aes_keybuf, 0x13, 32);
    for (int i = 0; i < pwdLen && i < 32; i++)
    {
        aes_keybuf[i] = passwd[i];
    }

    // set decrypt key
    AES_KEY aeskey;
    AES_set_decrypt_key(aes_keybuf, 256, &aeskey);

    // separate input file
    int nLoop;
    nLoop = fileSize / 16;

    // decrypt file
    int row;
    unsigned char buf[16], buf2[16];
    for (row = 0; row < nLoop; row++)
    {
        memset(buf, 0, 16);
        fread(buf, sizeof(char), 16, fpIn);
        AES_decrypt(buf, buf2, &aeskey);
        if (row < nLoop - 1)
        {
            fwrite(buf2, sizeof(char), 16, fpOut);
        }
        else
        {
            int nPadding = (int)buf2[15];
            fwrite(buf2, sizeof(char), 16 - nPadding, fpOut);
        }
    }

    fclose(fpIn);
    fclose(fpOut);
    printf("\nSuccessfully decrypt to %s.\n", destFile);
}

long file_length(char *f)
{
    struct stat st;
    stat(f, &st);
    return st.st_size;
}

int main(int argc, char *argv[]) // encfile enc/dec filename pwd
{
    char *encMode, *filename, *passwd;
    // check argument couter
    if (argc == 4)
    {
        encMode = argv[1];
        filename = argv[2];
        passwd = argv[3];
    }
    else
    {
        printf("usage: encfile enc|dec filename password\n");
        return 0;
    }

    if (strcmp(encMode, "enc") == 0)
    {
        FILE *fp = fopen(filename, "rb");
        if (fp != NULL)
        {
            long fileSize = file_length(filename);
            printf("Encrypting %s (%ld bytes) using %s\n", filename, fileSize, passwd);
            encFileAES(filename, fp, fileSize, passwd, strlen(passwd));
        }
        else
        {
            printf("Error in opening file %s.\n", filename);
        }
    }
    else if (strcmp(encMode, "dec") == 0)
    {
        FILE *fp = fopen(filename, "rb");
        if (fp != NULL)
        {
            long fileSize = file_length(filename);
            printf("Decrypting %s (%ld bytes) using %s\n", filename, fileSize, passwd);
            decFileAES(filename, fp, fileSize, passwd, strlen(passwd));
        }
        else
        {
            printf("Error in opening file %s.\n", filename);
        }
    }
    else
    {
        printf("usage: encfile enc|dec filename password\n");
    }
    return 0;
}
