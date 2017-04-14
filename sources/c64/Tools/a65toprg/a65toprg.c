/*
    a65toprg.c: Convert an A65 (Atari 8-bit 6502 OBJ file format) to C64 .prg file (binary with 16-bit address header).
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
    unsigned long insize, outsize = 0, offset, base, start, end, diff, i;
    unsigned char *inbuffer = NULL, *outbuffer, c;
    int rval = SYS_ERROR;

    /* Basic argument checking. */
    if (argc < 3)
    {
        printf("Usage: a65toprg a65objfile outputprg\n");
        printf("Example: a65toprg all.out mcmg.prg\n");
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

    /* Check for A65 file format. */
    if ((inbuffer[0] != 0xFF) || (inbuffer[1] != 0xFF) || (inbuffer[2] != inbuffer[4]) || (inbuffer[3] != inbuffer[5]))
    {
        printf("Invalid .A65 file.\n");
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

    /* Copy start address to .prg file. */
    offset = 2;
    c = inbuffer[offset++];
    outbuffer[outsize++] = c;
    base = (unsigned long) c;
    c = inbuffer[offset++];
    outbuffer[outsize++] = c;
    base |= (((unsigned long) c) << 8);
    offset += 3;
    end = base;

    while (offset < insize)
    {
        /* Read next start address. */
        start = (unsigned long)inbuffer[offset++];
        start |= (((unsigned long)inbuffer[offset++]) << 8);
        printf("Section: $%x - ", start);

        /* Space between previous end and next start filled with 0x0. */
        diff = start - end;
        outsize += diff;

        /* Read end address. */
        end = (unsigned long)inbuffer[offset++];
        end |= (((unsigned long)inbuffer[offset++]) << 8);
        printf("$%x\n", end);
        end++;

        /* Copy segment from source to destination memory address. */
        diff = end - start;
        if (((diff + outsize) > BUFFER_SIZE) || ((diff + offset) > insize))
        {
            printf("Out of memory\n");
            goto main_cleanup;
        }
        for (i = 0; i < diff; i++)
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

