/*% cc -o # % -O -s
*/
/***************************************************************************\
* 									    *
*	Program to convert cel data files to macross source code.	    *
* 									    *
* 	(modified version of the "hdm" program by David Fox)		    *
* 									    *
\***************************************************************************/

#include <stdio.h>

#define	n_cels		69	/* 68 cels, plus cel 0 (null object) */



int	old_address	[256];
int	old_cel_id	[256];
int	cel_address	[n_cels];
int	cel_length	[n_cels];
int	cel_data	[n_cels][262];
int	cel_state	[8][16];
int	cel_time	[8][16];
int	cel_cleanup	[256];
/* int	color_table	[4] = { 1,3,2,0 }; */
int	color_table	[4] = { 2,3,1,0 };

int	cel_pixel	[128][128];		/* width, height */
int	cel_width, cel_height, byte_data;
int	tb_border, lr_border;
int	center_solid, lr_center_solid, tb_center_solid;

int	i, j, k, m, n, x, count, cel_count, length, address, x_offset, y_offset, object_width;
int	box;

char	byte; 
char	cel_letter;
char	*name;


char	cels_to_draw [9];
int	cel_pointer;
int	num_of_frames;
int	base_args;
char	how_held [20];
char	object_name [20];
char	animation_type [40];
char	cels_to_color [9];
char	x_y_chore [40];
char	container_data [40];

int	total_savings, total_usage;
int	run_length, last_byte;
int	pattern_use	[256];
int	longest_run;
int	highest_cel_to_draw;
int	cels_in_object;


main	(argc,argv)
int	argc;
char	*argv[];

{
    name = argv[1];
    if (name[0]==0)
	error();

	sscanf(argv[1],"%s",object_name);
	sscanf(argv[2],"%d",&x_offset);
	sscanf(argv[3],"%d",&y_offset);
	sscanf(argv[4],"%s",how_held);
	sscanf(argv[5],"%s",cels_to_color);

	sscanf(argv[6],"%d",&object_width);

	sscanf(argv[7],"%s",x_y_chore);
	sscanf(argv[8],"%s",container_data);
	base_args = 9;		/* minimum number of parameters passed */


    discard (2);		/* cel data length	*/

    for (i=0; i<256; i++) {
	old_cel_id[i] = 0;
    }
    for (i=0; i<127; i++) {
	old_address[i] = read_byte();
    }
    for (i=0; i<127; i++) {
	old_address[i] = read_byte() * 256 + old_address[i];
	n = old_address[i] - 518;
	if (n>=0) {
		n /= 262;
		old_cel_id[i] = n + 1;
	}
    }

/*    discard (32);		cel_time and state	*/

    for (i=0; i<16; i++) {
	cel_time[0][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[0][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[1][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[1][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[2][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[2][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[3][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[3][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[4][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[4][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[5][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[5][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[6][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[6][i] = old_cel_id[read_byte()];
    }

    for (i=0; i<16; i++) {
	cel_time[7][i] = read_byte();
    }
    for (i=0; i<16; i++) {
	cel_state[7][i] = old_cel_id[read_byte()];
    }


    discard (6);		/* cel 0 data		*/

	for (i=0; i<127; i++)
		cel_cleanup[i] = 0;
	for (i=0; i<=7; i++)
		for (j=0; j<16; j++) {
			m = cel_state[i][j];
			if (m > 0)
				cel_cleanup[m] = 1;
		}
	for (i=1; i<127; i++)
		if (cel_cleanup[i]==0)
			old_address[i] = 0x0200;

    address = 250;
    for (i=0; i<n_cels; i++) {
	cel_address [i] = address;
	cel_length  [i] = 0;
    }

    address = 256;
    cel_count = 0;
    while ((byte=getchar()) != EOF) {		/* get cel data */
	cel_count++;
	for (i=0; i<261; i++) {
		cel_data [cel_count][i] = byte;
		byte=getchar();
	}
	cel_data [cel_count][261] = byte;
	if (cel_cleanup[cel_count] > 0) {
		length = cel_data[cel_count][0] * cel_data[cel_count][1];
		cel_length [cel_count] = length;
		if (length==0)
			cel_address [cel_count] = 250;
		else {
			cel_address [cel_count] = address;
			address += length + 6;
		}
	}
    }

	strcpy (cels_to_draw,"00000000");
	cel_pointer = 0;
	for (n=1; n<=cel_count; n++)
	   if (cel_length[n] > 0) {
		cels_to_draw[cel_pointer] = '1';
		cel_pointer++;
	   }

	num_of_frames = 0;
	if (argc > base_args)
	    num_of_frames = argc - base_args - 2;


	printf (";---------------------------------------\n");
	printf (";\n;\tanimation cel data\n;\n");

	printf ("\tinclude \"../equates.m\"\n\n");


	printf ("%s_data::\n",object_name);

	printf ("	byte	%s	+ %d\n",how_held,num_of_frames);
	printf ("	byte	0b%s\n",cels_to_color);

	if (argc == base_args) {
		printf ("\tbyte\tno_animation\n");
	} else {
		printf ("\tbyte\t%s_start_end - %s_data\n",object_name,object_name);
	}


	if (container_data[0] == 'n') {
		printf("\tbyte\t%s\n",container_data);
	} else {
		printf("\tbyte\t%s_contents_xy - %s_data\n",object_name,object_name);
	}

	printf("\n");
	printf("\tbyte\t%s\n",x_y_chore);
	printf("\n");

	if (num_of_frames == 0)
	    printf ("	byte	0b%s\n",cels_to_draw);

	if (num_of_frames > 0)
	    for (n=base_args+1; n<=argc-1; n++)
		printf ("	byte	0b%s\n",argv[n]);

	printf ("\n");



	cels_in_object = 0;
	for (n=1; n<=cel_count; n++)
	   if (cel_length[n] > 0)
		cels_in_object++;

	if (num_of_frames > 0) {
	    for (n=base_args+1; n<=argc-1; n++)
		for (j = 0 ; j < 8 ; j++) {
		    if (argv[n][j] == '1' &&  highest_cel_to_draw < j+1)
			highest_cel_to_draw = j+1;
		}

	    if (cels_in_object != highest_cel_to_draw)
		printf("ERROR in number of cels");
	}




	cel_letter = 'a';
	for (n=1; n<=cel_count; n++)
	   if (cel_length[n] > 0) {
		printf ("\tword	%s_data_%c - %s_data\n",object_name,cel_letter,object_name);
		cel_letter++;
	   }


	if (argc >=base_args+1) {
		printf ("\n%s_start_end:\n",object_name);
		printf ("\tbyte\t%s\n",argv[base_args]);
	}


	if (container_data[0] != 'n') {
		printf("\n%s_contents_xy:",object_name);
		printf("\n\tbyte\t%s\n",container_data);
	}

	cel_letter = 'a';
	for (n=1; n<=cel_count; n++)
		if (cel_length[n] > 0) {

			cel_data[n][2] /= 4;	 /* pixels into bytes*/

			printf ("\n\n%s_data_%c:\n",object_name,cel_letter);
			cel_letter++;


			cel_data[n][2] += x_offset;
			cel_data[n][3] -= y_offset;

			printf("\tbyte\t");
			detect_box();

			if (box == 0) {
				printf("0x%02x",cel_data[n][0]);
			}

			for (i=1; i<6; i++) {
				count = 1;
				write_byte (cel_data[n][i]);
				count = 0;
			}
			printf ("\n");

			if (box == 1) {
				write_color_byte (cel_data[n][0+6]);
			} else {
			    if (box == 2) {
				m = cel_pixel[1][1];
				printf("\tbyte\t0q%d%d%d%d",m,m,m,m);
			    } else {
				detect_runs();
/*				for (i=0; i<cel_length[n]; i++) {
					write_color_byte (cel_data[n][i+6]);
				}		*/
			    }
			}
		}
	printf ("\n\n");

}


int read_byte ()
{
	int	n;

	n = getchar();
	if (n<0)	n += 256;
	return (n);
}


write_color_byte (n)
int n;
{
	write_byte(pixel_convert(n));
}

pixel_convert(n)
int n;
{

	int	q0,q1,q2,q3;

	if (n<0)	n += 256;	/* divide n into four pixels */
	q0 = color_table [n % 4];
	n /= 4;
	q1 = color_table [n % 4];
	n /= 4;
	q2 = color_table [n % 4];
	n /= 4;
	q3 = color_table [n];

	n = (q3*64 + q2*16 + q1*4 + q0);
	return(n);
}



write_byte (n)
int n;
{
	if (n<0)	n += 256;
	if (count==0)
		printf ("\tbyte\t");
	if ((count%8)!=0)
		printf (", ");
	else if (count!=0)
		printf (",\n\t\t");
	printf ("0x%02x",n);
	count++;
}


label (s)
char *s;
{
	printf ("\n\n%s:\n",s);
	count = 0;
}


discard (n)
int n;
{
	while ((n-->0) && (getchar()!=EOF)) { }	/* discard n bytes */
}


error()
{
    printf("USE: comp.action NAME < input_file > output_file\n");
    exit(1);
}


detect_box() {
	box = 1;
	for (i=0; i<cel_length[n]; i++) {
		if (cel_data[n][i+6] != cel_data[n][0+6]) {
			box = 0;
			break;
		}
	}

	if (box == 1) {
		printf("cel_box + 0x%02x",cel_data[n][0]);
	} else {
		detect_border();
	}
}

detect_border() {
	cel_width = cel_data[n][0]*4;
	cel_height = cel_data[n][1];

	x = 0;
	for (i=0; i<cel_height; i++) {
		for (j=0; j<cel_width/4; j++) {

			byte_data = cel_data[n][6+x];
			if (byte_data<0) byte_data += 256;
			x++;

			for (m=0; m<4; m++) {
			    cel_pixel[i][j*4+3-m] = color_table[byte_data%4];
			    byte_data /=4;
			}
		}
	}

/*
	printf ("\n");
	for (i=0; i<cel_height; i++) {
		for (j=0; j<cel_width; j++) {
			printf("%d",cel_pixel[i][j]);
		}
		printf("\n");
	}
	printf("\n\n");
*/

	tb_border = 1;
	for (j=0; j<cel_width; j++) {
		if ((cel_pixel[0][j] != cel_pixel[cel_height-1][j]) ||
		     (cel_pixel[0][j] !=2)) {
			tb_border = 0;
			break;
		}
	}

	lr_border = 1;
	for (i=0; i<cel_height; i++) {
		if ((cel_pixel[i][0] != cel_pixel[i][cel_width-1]) ||
		     (cel_pixel[i][0] !=2)) {
			lr_border = 0;
			break;
		}
	}

	center_solid = 1;
	for (i=1; i<cel_height-1; i++) {
		for (j=1; j<cel_width-1; j++) {
			if (cel_pixel[i][j] != cel_pixel[1][1]) {
				center_solid = 0;
				break;
			}
		}
	}

	lr_center_solid = 1;
	for (i=0; i<cel_height; i++) {
		for (j=1; j<cel_width-1; j++) {
			if (cel_pixel[i][j] != cel_pixel[1][1]) {
				lr_center_solid = 0;
				break;
			}
		}
	}

	tb_center_solid = 1;
	for (i=1; i<cel_height-1; i++) {
		for (j=0; j<cel_width; j++) {
			if (cel_pixel[i][j] != cel_pixel[1][1]) {
				tb_center_solid = 0;
				break;
			}
		}
	}


	if ((center_solid == 1) && (lr_border == 1) &&
	   (tb_border == 1)) {
		printf("cel_box + both_bord + 0x%02x",cel_data[n][0]);
		box = 2;
	}
	if ((lr_center_solid == 1) && (lr_border)) {
		printf("cel_box + lr_bord + 0x%02x",cel_data[n][0]);
		box = 2;
	}
	if ((tb_center_solid == 1) && (tb_border == 1)) {
		printf("cel_box + tb_bord + 0x%02x",cel_data[n][0]);
		box = 2;
	}
}



detect_runs() {

	cel_width  = cel_data[n][0];
	cel_height = cel_data[n][1];

	x = 0;
	for (i=0; i<cel_height; i++) {
		for (j=0; j<cel_width; j++) {

			byte_data = cel_data[n][6+x];
			if (byte_data<0) byte_data += 256;
			x++;

		        cel_pixel[i][j] = pixel_convert(byte_data);
		}
	}


/*	printf ("\n\n");
	for (i=(cel_height-1); i>=0; i--) {
		for (j=0; j<cel_width; j++) {
			printf("%d\t",cel_pixel[i][j]);
		}
		printf("\n");
	}
	printf("\n\n");		*/


	run_length = 1;
	last_byte = -1;
	for (j=0; j<cel_width; j++) {
		for (i=(cel_height-1); i>=0; i--) {

			if ( cel_pixel[i][j] == last_byte ) {
				run_length ++;
			} else {
				run_test();
				run_length = 1;
			}
			last_byte = cel_pixel[i][j];
		}
	}
	run_test();			/* last section a run? */
	printf("\n\n");

}


run_test() {
    if (last_byte != -1) {
	if (last_byte == 0) {
	    printf("\tbyte\trun,0x80+%d\n",run_length);
	    return;
	}

	if (run_length > 2) {
	    printf("\tbyte\trun,%d,%d\n",run_length,last_byte);

	    total_savings += run_length - 3;
	    pattern_use[last_byte]++;

	    if (run_length > longest_run)
		longest_run = run_length;
	} else {
	    for (k=0; k<run_length; k++) {
		printf("\tbyte\t%d\n",last_byte);
	    }
	}
    }
}
