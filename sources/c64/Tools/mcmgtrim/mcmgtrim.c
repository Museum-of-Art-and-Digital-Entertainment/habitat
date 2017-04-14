/*
mcmgtrim.c: Trim .prg file built using Habitat standard source "main.m" into an MCMG.prg file suitable for use on Habitat Disk A.
Written by Brataccas, 2017.
*/

#include "global.h"

#define BUFFER_SIZE  1024 * 1024 * 1    /* 1 MB working space. */

/* From "main.m" :                      ; bytes         offset  */
/* $0800:                               ; 00 08         0-1     */     
/*      jmp	start_of_program            ; 4C 16 08      2-4     */
/*      jmp	save_file                   ; 4C 04 6A      5-7     */

#define MCMG_FILE_HEADER    8

/*      byte 0x00, 0x01, 0x00, 0x00, 0x00; File header          */
/*      byte 0x00, 0x00, 0x00, 0x00, 0x00, 0x00         8-18    */
/* ; Record header                                              */
/*      byte	0x01; Encoding byte                     19      */
/*      byte / start_of_program         ; 16            20-21   */
/*      byte ? start_of_program         ; 08                    */

#define MCMG_ADDRESS_END    22

/*      byte / (end_of_program - start_of_program)      22-23   */
/*      byte ? (end_of_program - start_of_program)              */

#define MCMG_END_PAD        48

void file_print_error(char *name)
{
    printf("Unable to open file %s\n", name);
}

int main(int argc, char *argv[])
{
    FILE *currentfile = NULL;
    unsigned long insize, outsize = 0, offset, end;
    unsigned char *inbuffer = NULL, *outbuffer;
    int rval = SYS_ERROR;

    /* Basic argument checking. */
    if (argc < 3)
    {
        printf("Usage: mcmgtrim inputprg outputprg\n");
        printf("Example: mcmgtrim all.prg mcmg.prg\n");
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

    /* Open output file for writing. */
    if ((currentfile = fopen(argv[2], "wb")) == NULL)
    {
        file_print_error(argv[2]);
        goto main_cleanup;
    }

    /* Set .prg load address $0806. */
    outbuffer[outsize++] = 0x06;
    outbuffer[outsize++] = 0x08;

    end = (unsigned long)inbuffer[MCMG_ADDRESS_END];
    end |= (((unsigned long)inbuffer[MCMG_ADDRESS_END+1]) << 8);
    end += MCMG_END_PAD;
    if (end > insize)
    {
        printf("Out of memory\n");
        goto main_cleanup;
    }

    /* Skip 8 bytes and copy until end marker. */
    for (offset = MCMG_FILE_HEADER; offset < end; offset++)
    {
        /* Copy character to output. */
        outbuffer[outsize++] = inbuffer[offset];
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

