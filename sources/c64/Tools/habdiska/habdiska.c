/*
habdiska.c: Write MCMG.prg file to .d64 disk using Habitat track/sector layout.
Written by Brataccas, 2017.
*/

#include "global.h"
#include "d64.h"
#include "mcmdir.h"

#define BUFFER_SIZE  1024 * 1024 * 1    /* 1 MB working space. */

#define TRACK_START     17
#define SECTOR_START    0

/* Write out disk sector to large-track portion of disk. */
int sector_write(unsigned char *inbuffer, unsigned char *outbuffer, unsigned long insize,
    unsigned long *offset, unsigned long *mark, unsigned long track, unsigned long sector)
{
    /* printf("%d,%d-> ", track, sector); */
    outbuffer[(*mark)++] = (unsigned char)track;
    outbuffer[(*mark)++] = (unsigned char)sector;

    /* Copy sector contents (-2 for linked list header) to destination. */
    memcpy(&outbuffer[*mark], &inbuffer[*offset], (SECTOR_SIZE - 2));

    /* Check for end of file, and mark end of list if found. */
    if (((*offset) += (SECTOR_SIZE - 2)) >= insize)
    {
        outbuffer[*mark - 2] = 0x0;
        outbuffer[*mark - 1] = 0xFF;
        return FALSE;
    }
    *mark = (SECTORS_PER_TRACK_LG * (track - 1) + sector) * SECTOR_SIZE;

    return TRUE;
}

void file_print_error(char *name)
{
    printf("Unable to open file %s\n", name);
}

int main(int argc, char *argv[])
{
    FILE *currentfile = NULL;
    unsigned long insize, outsize, offset, mark, track, sector;
    unsigned char *inbuffer = NULL, *outbuffer;
    int next, rval = SYS_ERROR;

    /* Basic argument checking. */
    if (argc < 3)
    {
        printf("Usage: habdiska inputprg outputd64\n");
        printf("Example: habdiska mcmg.prg habitat-a.d64\n");
        goto main_cleanup;
    }

    /* Allocate memory for working buffer. */
    if ((inbuffer = malloc(BUFFER_SIZE * 2)) == NULL)
    {
        printf("Out of memory\n");
        goto main_cleanup;
    }
    outbuffer = inbuffer + BUFFER_SIZE;
    memset(inbuffer, 0x0, BUFFER_SIZE);

    /* Set .d64 disk image size and clear memory. */
    outsize = SECTORS_PER_DISK * SECTOR_SIZE;
    memset(outbuffer, 0x0, outsize);

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

    /* Test to walk file chain on original disk. */
    /* offset = (SECTORS_PER_TRACK_LG * (TRACK_START - 1) + SECTOR_START) * SECTOR_SIZE;
       printf("  Chain: %d,%d-> ", TRACK_START, SECTOR_START);
       while (inbuffer[offset] != 0x0)
       {
            printf ("%d,%d-> ", inbuffer[offset], inbuffer[offset + 1]);
            offset = (SECTORS_PER_TRACK_LG * (inbuffer[offset] - 1) + inbuffer[offset + 1]) * SECTOR_SIZE;
        }
        printf("End\n\n"); */

    /* Copy directory sector(s) to standard location on track 18. */
    mark = SECTORS_PER_TRACK_LG * (TRACK_DIRECTORY - 1) * SECTOR_SIZE;
    memcpy(&outbuffer[mark], directory, HABDIR_SIZE);

    /* Copy mcm file to start sector (track 17, sector 0). */
    mark = (SECTORS_PER_TRACK_LG * (TRACK_START - 1) + SECTOR_START) * SECTOR_SIZE;
    memcpy(&outbuffer[mark], mcmfile, SECTOR_SIZE);
    mark += SECTOR_SIZE;

    /* Write out first track. Uses a different sector layout formula than rest of disk. */
    for (track = TRACK_START, sector = SECTOR_START + 1, offset = 0; offset < insize; )
    {
        sector += 10;
        sector_write(inbuffer, outbuffer, insize, &offset, &mark, track, sector);
        if ((sector -= 9) >= 11)
            break;
        sector_write(inbuffer, outbuffer, insize, &offset, &mark, track, sector);
    }
    track--;
    sector = 20;

    while (offset < insize)
    {
        do /* Fill one track with file content, using sector layout formula. */
        {
            sector -= 11;
            if (!(next = sector_write(inbuffer, outbuffer, insize, &offset, &mark, track, sector)))
                break;
            sector += 10;
            if (!(next = sector_write(inbuffer, outbuffer, insize, &offset, &mark, track, sector)))
                break;
        } while (sector > 10);
        if (!next)
            break;

        /* Handle final sector of track and decrement to next track. */
        sector += 10;
        if (!(sector_write(inbuffer, outbuffer, insize, &offset, &mark, track, sector)))
            break;
        track--;
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

