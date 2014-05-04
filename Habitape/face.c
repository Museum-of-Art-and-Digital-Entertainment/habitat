#include <stdio.h>
#include "prot.h"
extern char *getenv();

/* flags */
#define NCARDS 3
int card=0, port=0;

static char reg[4];
static FILE *ffile;
static char imagename[80];
static char sequencename[80];
static char tempstr[80];
static char tempstr1[80];
static char tempstr2[80];
static unsigned char buf[65000];

#define	max_sequences		128
#define	sequence_length		32
static unsigned char sequence_flag[max_sequences];
static unsigned char sequence_data[max_sequences][8][sequence_length];
static unsigned char visible_flag[max_sequences][8];

static unsigned char *p;
static int xmax,ymax,i,oldxoffset,oldyoffset;
static int xoffset,yoffset,firsttime,ysize;
static int nxmax,nymax,xstart,ystart;
static char *portstr;
static char c;
static int getflag;

typedef enum { WORD, BYTE } dataModeType;

getimagename() {

	printf("File name (RETURN for \"%s\") >",imagename);
	fflush(stdin);
	gets(tempstr);
	if(tempstr[0] != '\0') {
	    strcpy(imagename,tempstr);
	    strcat(imagename,".cel");
	    strcpy(sequencename,tempstr);
	    strcat(sequencename,".seq");
	} 
}

getsequencename() {

	printf("Sequence File name (RETURN for \"%s\") >",sequencename);
	fflush(stdin);
	gets(tempstr);
	if(tempstr[0] != '\0') {
	    strcpy(sequencename,tempstr);
	    strcat(sequencename,".seq");
	} 
}

newcel() {
	strcpy(imagename,"/u1/gg/bin/empty.cel");
	loadcel();
	strcpy(imagename,"image.cel");
}

int
savecel()
{
unsigned int i,len,ptr;

	ffile = fopen(imagename,"w");
	if(ffile == NULL) {
	    printf("%s does not exist\n",imagename);
	    return (NULL);
	} else {
	    printf("saving image \"%s\"\n",imagename);
	    up(buf,(word)2,(word)0x10);
	    ptr = buf[0]+buf[1]*256;
	    up(buf,(word)2,(word)ptr);
	    len = buf[0]+buf[1]*256;
	    printf("%d",len);
	    up(buf,(word)len,(word)ptr);
	    for(i=0;i<len;i++) 
	         putc(buf[i],ffile);
	    fclose(ffile);
	    Cont();
	}
}


int
loadcel()
{
unsigned int j,i,len,ptr;

	ffile = fopen(imagename,"r");
	if(ffile == NULL) {
	    printf("%s does not exist\n",imagename);
	    return (NULL);
	} else {
	    up(buf,(word)2,(word)0x10);
	    ptr = buf[0]+buf[1]*256;
	    i = getc(ffile);
	    j = getc(ffile);
	    len = i+j*256;
	    buf[0] = i;
	    buf[1] = j;
	    for(i=2;i<(len-2);i++) 
		buf[i] = getc(ffile);	    
	    fclose(ffile);
	    printf("%d\n",len);
	    down(buf,(word)len,(word)ptr);
	    buf[0] = 1;
	    down(buf,(word)1,(word)0x12);
	    Cont();
	}
}


int
read_sequence_file()
{
unsigned int i,j,k,l,sequences,flag,data;

	ffile = fopen(sequencename,"r");
	if(ffile == NULL) {
	    printf("sequnce file does not exist for this image\n");
	    return (NULL);
	} else {

	    for(i=0;i<max_sequences;i++) {
		sequence_flag[i] = 0;
	    }

	    fscanf(ffile,"%3d\n",&sequences);
	    for(l=0;l<sequences;l++) {
		fscanf(ffile,"%3d,%3d\n",&i,&flag);
		sequence_flag[i] = flag;
		for(j=0;j<8;j++) {

		    fscanf(ffile,"%3d)  ",&data);
		    visible_flag[i][j] = data;

		    for(k=0;k<sequence_length;k++) {
			fscanf(ffile,"%3d,",&data);
			sequence_data[i][j][k] = data;
		    fscanf(ffile,"\n");
		    }
		}
	    }
	    fclose(ffile);
	    display_existing_sequences();
	}
}


int
write_sequence_file()
{
unsigned int i,j,k,sequences;

	printf("Saving file >%s\n",sequencename);

	ffile = fopen(sequencename,"w");
	if(ffile == NULL) {
	    printf("creating new sequence file\n");
	}

	sequences = 0;
	for(i=0;i<max_sequences;i++) {
		if (sequence_flag[i] != 0)
		    sequences++;
	}

	fprintf(ffile,"%3d\n",sequences);

	for(i=0;i<max_sequences;i++)
	    if (sequence_flag[i] != 0) {
		fprintf(ffile,"%3d,%3d\n",i,sequence_flag[i]);
		for(j=0;j<8;j++) {

		    fprintf(ffile,"%3d)  ",visible_flag[i][j]);

		    for(k=0;k<sequence_length;k++)
			fprintf(ffile,"%3d,",sequence_data[i][j][k]);
		    fprintf(ffile,"\n");
		}
	    }
	fclose(ffile);
}

int
display_existing_sequences()
{
unsigned int i;

    printf("valid sequences loaded are\n");
	for(i=0;i<max_sequences;i++)
	    if (sequence_flag[i] !=0) {
		printf("%d,",i);
	    }
	printf("\n");
}


int
get_a_sequence()
{
unsigned int get_sequence,ptr,j,k;

	display_existing_sequences();

        printf("\nSequence # to get >");
	fflush(stdin);
	gets(tempstr1);
	sscanf(tempstr1,"%d",&get_sequence);

	if (get_sequence<0 || get_sequence > max_sequences) {
	    printf("\nYou have selected an illegal sequence number\n");
	    return;
	}

	up(buf,(word)2,(word)0x13);
	ptr = buf[0]+buf[1]*256;
	up(buf,(word)8*sequence_length+8,(word)ptr);
	Cont();

	for(j=0;j<8;j++)
	    for(k=0;k<sequence_length;k++)
		sequence_data[get_sequence][j][k] = buf[j*sequence_length+k];

	for(j=0;j<8;j++)
		visible_flag[get_sequence][j] = buf[8*sequence_length+j];

	sequence_flag[get_sequence] = 1;
}

int
put_a_sequence()
{
unsigned int put_sequence,ptr,j,k;

	display_existing_sequences();

        printf("\nSequence # to put >");
	fflush(stdin);
	gets(tempstr1);
	sscanf(tempstr1,"%d",&put_sequence);

	if (sequence_flag[put_sequence]==0) {
	    printf("\nThat sequence does not exist\n");
	    return;
	}

	up(buf,(word)2,(word)0x13);
	ptr = buf[0]+buf[1]*256;

	for(j=0;j<8;j++)
	    for(k=0;k<sequence_length;k++)
		buf[j*sequence_length+k] = sequence_data[put_sequence][j][k];

	for(j=0;j<8;j++)
		buf[8*sequence_length+j] = visible_flag[put_sequence][j];

	buf[8*sequence_length+8] = 1;		/* sequencer on */
	buf[8*sequence_length+9] = 255;		/* working cel = none */

	down(buf,(word)8*sequence_length+8+1+1,(word)ptr);

	Cont();
}


printmenu() {
	printf("\n");
	printf("face - (c) LFL 1986\n");
	printf("\n");
	printf("Current image name: \"%s\"\n",imagename);
	printf("\n");
	printf("i) Initialize cel editor\n");
	printf("n) New image\n");
	printf("l) Load an image\n");
	printf("s) Save an image\n");

	printf("g) Get sequence from C64\n");
	printf("p) Put sequence to C64\n");
	printf("r) Read sequence file\n");
	printf("w) Write Sequence file\n");

	printf("d) Directory of *.cel files\n");
	printf("P) Print out screen\n");
	printf("h) Help with editor commands\n");
	printf("!) Execute unix command\n");
	printf("q) Quit face\n");
	printf("");
	printf("                                    >");
	fflush(stdout);
}



main() {

	portstr = getenv("FASTPORT");
	if(portstr!=NULL) {
	    if(strlen(portstr)<3) {
		fprintf(stderr, "FASTPORT environment variable must be");
		fprintf(stderr, " form: c;p. c and p are numerals for card");
		fprintf(stderr, " and port respectively\n");
		return -1;
	    } else {
		card = portstr[0] - '0';
		port = portstr[2] - '0';
	    }
	}
	if(card<0 || card>=NCARDS) {
	    fprintf(stderr, "card number out of range\n");
            return -1;
	}
	if(port<0 || port>2) {
	    fprintf(stderr, "port number out of range\n");
	    return -1;
	}
	if(!Init(card, port)) {
	    fprintf(stderr, "Unable to access device\n");
	    Finish();
	    exit(-1);
	}

	getflag = 0;
	oldxoffset = 0;
	oldyoffset = 0;
	strcpy(imagename,"image.cel");
	xmax = 40;
	ymax = 25;
	while(1) {
	    printmenu();
	    gets(tempstr);
	    c = tempstr[0];
	    printf("\n");
	    if(c == 'i') {
		system("down -S < /u1/gg/bin/face64.out");
		newcel();
	    }
	    if(c == 'd') {
		system("ls -C *.cel | more");
	    }
	    if(c == '!') {
	        printf("Unix command >");
	 	fflush(stdin) ;
		gets(tempstr);
		printf("\n");
		system(tempstr);
		printf("\nhit return to continue");
		fflush(stdin);
		gets(tempstr);
	    }
	    if(c == 'h') {
		if(fopen("/u1/gg/bin/face.doc","r") == NULL) {
		    printf("\nHelp file not in /u1/gg/bin\n");
		} else {
		    system("more /u1/gg/bin/face.doc");	        
		}
	    }
	    if(c == 'l') {
		getimagename();
		loadcel();
	    }
	    if(c == 's') {
		getimagename();
		savecel();
	    }
	    if(c == 'n') {
		newcel();
	    }



	    if(c == 'r') {
		getsequencename();
		read_sequence_file();
		getflag = 0;
	    }

	    if(c == 'w') {
		getsequencename();
		write_sequence_file();
		getflag = 0;
	    }

	    if(c == 'g') {
		get_a_sequence();
		getflag = 1;
	    }

	    if(c == 'p') {
		put_a_sequence();
	    }


	    if(c == 'P') {
		buf[0] = 1;
		down(buf,(word)1,(word)0x15);
		Cont();
		system("sleep 1");
		ffile = fopen(".ptemp","w");
		putc(40,ffile);
		putc(14,ffile);
		putc(0,ffile);			/* black edges */
		putc(0,ffile);
		putc(0,ffile);
		putc(0,ffile);
		up(buf,(word)4480,(word)0xa000);	/* get bitmap */
		for(i=0;i<4480;i++) putc(buf[i],ffile);
		for(i=0;i<560;i++) putc(0xde,ffile);	/* pink/blue */
		for(i=0;i<560;i++) putc(0x01,ffile);	/* gray bkgrnd */
		fclose(ffile);
		system("pixit < .ptemp | lpr &");
		buf[0] = 0;
		down(buf,(word)1,(word)0x15);
		Cont();	
	    }

	    if(c == 'q') {
		if (getflag) {
		    printf("sequences not written. Quit? (y/n)");
		    gets(tempstr);
		    c = tempstr[0];
		    printf("\n");
		    if (c == 'y') {
	 		exit(0);
		    }
		} else {
		    exit(0);
		}
	    }
	}
}

