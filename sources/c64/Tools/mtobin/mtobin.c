/*
    mtobin.c: Convert position independent macross object file to raw .bin file
    Written by Brataccas, 2017.
*/

#include "global.h"

#define BUFFER_SIZE  1024 * 1024 * 1    /* 1 MB working space. */

void file_print_error(char *name)
{
    printf("Unable to open file %s\n", name);
}

int main(int argc, char *argv[])
{
    FILE *currentfile = NULL;
    unsigned long insize, outsize = 0, offset, start, end;
    unsigned char *inbuffer = NULL, *outbuffer;
    int rval = SYS_ERROR;

    /* Basic argument checking. */
    if (argc < 3)
    {
        printf("Usage: mtobin objfile outputbin\n");
        printf("Example: mtobin file.obj file.bin\n");
        goto main_cleanup;
    }

    /* Allocate memory for working buffer. */
    if ((inbuffer = malloc(BUFFER_SIZE * 2)) == NULL)
    {
        printf("Out of memory\n");
        goto main_cleanup;
    }
    outbuffer = inbuffer + BUFFER_SIZE;

    /* Open file for reading. */
    if ((currentfile = fopen(argv[1], "rb")) == NULL)
    {
        file_print_error(argv[1]);
        goto main_cleanup;
    }

    /* Read file to input buffer and close file. */
    if (!(insize = (unsigned long)fread(inbuffer, 1, BUFFER_SIZE, currentfile)))
    {
        file_print_error(argv[1]);
        goto main_cleanup;
    }
    fclose(currentfile);
    currentfile = NULL;

    /* Check for macross object file format. */
    if ((inbuffer[0] != 0xFF) || (inbuffer[1] != 0xFF))
    {
        printf("Invalid .obj file.\n");
        goto main_cleanup;
    }

    /* Open output file for writing. */
    if ((currentfile = fopen(argv[2], "wb")) == NULL)
    {
        file_print_error(argv[2]);
        goto main_cleanup;
    }

    /* Fill destination with 0x0 (covers any gaps between segments). */
    memset(outbuffer, 0x0, BUFFER_SIZE);

    /* Read start address - should be 0x0 if position independent. */
    offset = 2;
    start = (unsigned long)inbuffer[offset++];
    start |= (((unsigned long)inbuffer[offset++]) << 8);

    /* Read end address. */
    end = (unsigned long)inbuffer[offset++];
    end |= (((unsigned long)inbuffer[offset++]) << 8);
    end = end - start;
    printf("size: $%x\n", end);
    end++;

    for (outsize = 0; ((outsize < end) && (offset < insize)); )
    {
        outbuffer[outsize++] = inbuffer[offset++];
    }

    /* Write buffer to file. */
    if (fwrite(outbuffer, 1, outsize, currentfile) != outsize)
    {
        printf("Error writing to %s\n", argv[2]);
        goto main_cleanup;
    }
    fclose(currentfile);
    currentfile = NULL;

    rval = SYS_OK;

main_cleanup:
    if (currentfile)
        fclose(currentfile);
    if (inbuffer)
        free(inbuffer);

    return rval;
}

