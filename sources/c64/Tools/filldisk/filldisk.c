#include "global.h"
#include "d64.h"

#define BUFFER_SIZE  1024 * 1024 * 1	/* 1 MB working space. */

#define REQUIRED_FILES          8
#define REQUIRED_FILENAME_LEN   20

/* Required filenames. */
#define CLASS_FILENAME   "class.dat"
#define ACTION_FILENAME  "action.dat"
#define SOUND_FILENAME   "sound.dat"
#define IMAGE_FILENAME   "image.dat"
#define HEAD_FILENAME    "head.dat"
#define ID_FILENAME      "id_file.dat"
#define LOADER_FILENAME  "loader.obj"
#define CHARSET_FILENAME "on_disk_charset.dat"

/* Default disk offsets. */
#define CLASS_DISKOFFSET   0  /* 0x0100 */
#define ACTION_DISKOFFSET  (1 * SECTORS_PER_TRACK_LG * SECTOR_SIZE)  /* 0x0200 */
#define SOUND_DISKOFFSET   (5 * SECTORS_PER_TRACK_LG * SECTOR_SIZE)  /* 0x0600 */
#define IMAGE_DISKOFFSET   (6 * SECTORS_PER_TRACK_LG * SECTOR_SIZE)  /* 0x0700 */
#define HEAD_DISKOFFSET    (17 * SECTORS_PER_TRACK_LG * SECTOR_SIZE + (21 - 17) * SECTORS_PER_TRACK_MD * SECTOR_SIZE) /* 0x1600 */
#define ID_DISKOFFSET      (17 * SECTORS_PER_TRACK_LG * SECTOR_SIZE) /* 0x1200 */
#define LOADER_DISKOFFSET  (17 * SECTORS_PER_TRACK_LG * SECTOR_SIZE + 1 * SECTOR_SIZE) /* id_file + 1 */
#define CHARSET_DISKOFFSET (17 * SECTORS_PER_TRACK_LG * SECTOR_SIZE + 8 * SECTOR_SIZE) /* 0x1208 */

/* Required tokens. */
#define CLASS_TOKEN      "class_file"
#define ACTION_TOKEN     "action_file"
#define SOUND_TOKEN      "sound_file"
#define IMAGE_TOKEN      "image_file"
#define HEAD_TOKEN       "head_file"
#define ID_TOKEN         "id_file"
#define LOADER_TOKEN     "loader_file"
#define CHARSET_TOKEN    "charset_file"

typedef struct
{
	unsigned char *buffer_offset;
	unsigned long disk_offset;
} file_descriptor;

void file_print_error(const char *name)
{
	printf ("Unable to open file %s\n", name);
}

/* Advance to first non-white-space character in buffer of max size. */
unsigned long skip_white_space(unsigned char *buffer, unsigned long offset, unsigned long max)
{
	/* Skip white space and carriage return / linefeed. */
	while (((buffer[offset] == ' ') || (buffer[offset] == '\t') ||
		(buffer[offset] == '\r') || (buffer[offset] == '\n')) && (offset < max))
		offset++;

	return offset;
}

/* Return offset of endline marked by a carriage return, linefeed or comment marker. */
unsigned long seek_endline(unsigned char *buffer, const char comment,
	unsigned long offset, unsigned long max)
{
	while ((!((buffer[offset] == comment) || (buffer[offset] == '\r')
		    || (buffer[offset] == '\n'))) && (offset < max))
		offset++;

	return offset;
}

/* Search for token in buffer of max size, with case sensitivity and option to advance to end of match. */
unsigned long seek_token(const char *token, unsigned char *buffer,
	unsigned long offset, unsigned long max, bool case_sensitive, bool advance)
{
	unsigned long len = 0;
	unsigned long(*proc)(const char *, const char *, size_t) = strnicmp;
	char t_upper, t_lower;

	t_upper = t_lower = token[0];

	/* Select string comparison function based on case sensitivity. */
	if (case_sensitive)
		proc = strncmp;
	else
	{
		t_upper = toupper(token[0]);
		t_lower = tolower(token[0]);
	}

	/* Find token length. */
	len = strlen(token);

	/* Reduce search by token length. */
	if (len > max)
		return max;
	else
		max -= len;

	while (offset < max)
	{
		/* Quickly reject all that don't match first token character. */
		while (!((buffer[offset] == t_upper) || (buffer[offset] == t_lower)) && (offset < max))
			offset++;

		/* Compare token string against buffer at offset. */
		if (proc(&buffer[offset], token, len) == 0)
		{
			if (advance)
				offset += len;
			return offset;
		}

		offset++;
	}

	/* If token not matched, return original max value. */
	return (max + len);
}

/* Search for token in buffer using rule that token must exist on a single line with optional comments. */
unsigned long seek_token_lined(const char *token, unsigned char *buffer,
	unsigned long offset, unsigned long max, const char comment, bool case_sensitive, bool advance)
{
	unsigned long endline;

	while (offset < max)
	{
		/* Find the end of the line terminated by newline, carriage return, or start of comment. */
		offset = skip_white_space(buffer, offset, max);
		if ((endline = seek_endline(buffer, comment, offset, max)) < (max - 1))
			endline++;

		/* Seek token on single line. */
		if ((offset = seek_token(token, buffer, offset, endline, case_sensitive, advance)) < endline)
			break;

		/* Advance to true end of line including comments. */
		offset = seek_endline(buffer, '\0', offset, max);
	}

	return offset;
}

/* Search for equate entry of the form "define token = value". */
unsigned long equate_seek_entry(const char *token, unsigned char *buffer, unsigned long offset, unsigned long max)
{
	unsigned long linemax, mark;

	while (offset < max)
	{
		/* Search line-by-line for ini section header, skip past comments marked with a semi-colon. */
		if ((mark = seek_token_lined("define", buffer, offset, max, ';', FALSE, TRUE)) < max)
		{
			linemax = seek_endline(buffer, ';', mark, max);
			if ((mark = seek_token(token, buffer, mark, linemax, FALSE, TRUE)) < linemax)
			{
				mark = skip_white_space(buffer, mark, linemax);
				if (buffer[mark] == '=')
				{
					mark = skip_white_space(buffer, mark + 1, linemax);
					return mark;
				}
			}
		}
		offset = mark;
	}

	return max;
}

/* Convert hex word 0x0000 to byte offset, return -1 if non hex value found. */
long equate_convert_value(unsigned char *buffer, unsigned long offset, unsigned long max)
{
	long value = -1;
	int track;

	if (buffer[offset] == '0')
	{
		if ((buffer[offset+1] == 'x') || (buffer[offset+1] == 'X'))
		{
			/* Convert track to sector offset. */
			track = ((buffer[offset + 2] - '0') * 16 + (buffer[offset + 3] - '1'));
			if (track > TRACK_MAX_LARGE)
			{
				if (track > TRACK_MAX_MEDIUM)
				{
					if (value > TRACK_MAX_SMALL)
						value = (SECTORS_LARGE + SECTORS_MEDIUM + SECTORS_SMALL + (track - TRACK_MAX_SMALL) * SECTORS_PER_TRACK_XS) * SECTOR_SIZE;
					else
						value = (SECTORS_LARGE + SECTORS_MEDIUM + (track - TRACK_MAX_MEDIUM) * SECTORS_PER_TRACK_SM) * SECTOR_SIZE;
				}
				else
					value = (SECTORS_LARGE + (track - TRACK_MAX_LARGE) * SECTORS_PER_TRACK_MD) * SECTOR_SIZE;
			}
			else
				value = track * SECTORS_PER_TRACK_LG * SECTOR_SIZE;

			value += ((buffer[offset + 4] - '0') * 16 + (buffer[offset + 5] - '0')) * SECTOR_SIZE;
		}
	}

	return value;
}

/* Find value of token for use in substitution. */
long equate_token_value(unsigned char *buffer, unsigned long offset, unsigned long max)
{
	char readstring[REQUIRED_FILENAME_LEN];
	unsigned long linemax, mark;
	long value = 0;

	/* Get new token string to lookup. */
	linemax = seek_endline(buffer, ';', offset, max);
	mark = 0;
	while ((!((buffer[offset] == '+') || (buffer[offset] == '-') || (buffer[offset] == ' ')
		|| (buffer[offset] == '\t'))) && (offset < linemax))
	{
		readstring[mark++] = buffer[offset++];
	}
	readstring[mark] = '\0';
	mark = offset;

	/* Find token in file and retrieve value. */
	if ((offset = equate_seek_entry(readstring, buffer, 0, max)) < max)
	{
		if ((value = equate_convert_value(buffer, offset, max)) >= 0)
		{
			offset = mark;
			linemax = seek_endline(buffer, ';', offset, max);
			mark = 0;
			while (((buffer[offset] >= '0') && (buffer[offset] <= '9'))
				|| (buffer[offset] == '+') || (buffer[offset] == '-'))
				readstring[mark++] = buffer[offset++];
			readstring[mark] = '\0';
			value += (atoi(readstring) * SECTOR_SIZE);
		}
	}
}

int main(int argc, char *argv[])
{
	file_descriptor required_files[REQUIRED_FILES];
	const char filename[REQUIRED_FILES][REQUIRED_FILENAME_LEN] =
	{
		CLASS_FILENAME, ACTION_FILENAME, SOUND_FILENAME, IMAGE_FILENAME,
		HEAD_FILENAME, ID_FILENAME, LOADER_FILENAME, CHARSET_FILENAME
	};
	const unsigned long required_default[REQUIRED_FILES] =
	{
		CLASS_DISKOFFSET, ACTION_DISKOFFSET, SOUND_DISKOFFSET, IMAGE_DISKOFFSET,
		HEAD_DISKOFFSET, ID_DISKOFFSET, LOADER_DISKOFFSET, CHARSET_DISKOFFSET
	};
	const char token[REQUIRED_FILES][REQUIRED_FILENAME_LEN] =
	{
		CLASS_TOKEN, ACTION_TOKEN, SOUND_TOKEN, IMAGE_TOKEN,
		HEAD_TOKEN, ID_TOKEN, LOADER_TOKEN, CHARSET_TOKEN
	};
	FILE *currentfile = NULL;
	unsigned long size, offset;
	long value;
	char *inbuffer = NULL, *outbuffer;
	int i, rval = SYS_ERROR;

    /* Basic argument checking. */
    if (argc < 3)
    {
        printf ("Usage: filldisk equates_file output.d64\n");
        printf ("Example: filldisk dataequates.m datadisk.d64\n");
        goto main_cleanup;
    }

	/* Allocate memory for working buffer. */
	if ((inbuffer = malloc(BUFFER_SIZE * 2)) == NULL)
	{
		printf("Out of memory\n");
		goto main_cleanup;
	}
	outbuffer = inbuffer + BUFFER_SIZE;

	/* Open input file. */
	if ((currentfile = fopen(argv[1], "rb")) == NULL)
	{
		file_print_error(argv[1]);
		goto main_cleanup;
	}

	/* Read file to input buffer and close file. */
	if (!(size = (unsigned long)fread(inbuffer, 1, BUFFER_SIZE, currentfile)))
	{
		file_print_error(argv[1]);
		goto main_cleanup;
	}
	fclose(currentfile);
	currentfile = NULL;

	for (i = 0; i < REQUIRED_FILES; i++)
	{
		required_files[i].disk_offset = required_default[i];
		if ((offset = equate_seek_entry(token[i], inbuffer, 0, size)) < size)
		{
			/* Attempt to read disk offset value directly. */
			if ((value = equate_convert_value(inbuffer, offset, size)) < 0)
			{
				/* If direct value not found, try looking up referenced token value. */
				value = equate_token_value(inbuffer, offset, size);
			}
			required_files[i].disk_offset = value;
		}
	}

	/* Set default sector fill with 0xFF. */
	memset(outbuffer, 0xFF, SECTORS_PER_DISK * SECTOR_SIZE);

	for (i = 0; i < REQUIRED_FILES; i++)
	{
		/* Open required file. */
		if ((currentfile = fopen(filename[i], "rb")) == NULL)
		{
			file_print_error(filename[i]);
			goto main_cleanup;
		}

		/* Read file to input buffer and close file. */
		if (!(size = (unsigned long)fread(inbuffer, 1, BUFFER_SIZE, currentfile)))
		{
			file_print_error(filename[i]);
			goto main_cleanup;
		}
		fclose(currentfile);
		currentfile = NULL;

		/* Copy input file to destination location in outbuffer. */
		memcpy((outbuffer + required_files[i].disk_offset), inbuffer, size);
	}

	/* Open output file. */
	if ((currentfile = fopen(argv[2], "wb")) == NULL)
	{
		file_print_error(argv[2]);
		goto main_cleanup;
	}

	/* Write buffer to file. */
	if (fwrite(outbuffer, 1, (SECTORS_PER_DISK * SECTOR_SIZE), currentfile) != (SECTORS_PER_DISK * SECTOR_SIZE))
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

