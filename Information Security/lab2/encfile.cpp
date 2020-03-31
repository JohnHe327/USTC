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

long file_length(char *f)
{
    struct stat st;
    stat(f, &st);
    return st.st_size;
}

int main(int argc, char *argv[])
{
    char *encMode, *filename, *passwd;
    // check argument couter
    if (argc != 4)
    {
        printf("usage: encfile enc|dec filename [password]\n");
        return 0;
    }
    else
    {
        encMode = argv[1];
        filename = argv[2];
	passwd = argv[3];
    }

    if(strcmp(encMode, "enc") == 0)
    {
        FILE *fp = fopen(filename, "rb");
	if(fp != NULL)
	{
		long fileSize = file_length(filename);
		printf("Encrypting %s (%ld bytes) using %s\n", filename, fileSize, passwd);
	}
	else
	{
		printf("Error in opening file %s.\n", filename);
	}
    }
    else if (strcmp(encMode, "dec") == 0)
    {
        FILE *fp = fopen(filename, "rb");
	if(fp != NULL)
	{
	    long fileSize = file_length(filename);
	    printf("Decrypting %s (%ld bytes) using %s\n", filename, fileSize, passwd);
	}
	else
	{
	    printf("Error in opening file %s.\n", filename);
	}
    }
    else
    {
        printf("usage: encfile enc|dec filename [password]\n");
    }
    return 0;
}
