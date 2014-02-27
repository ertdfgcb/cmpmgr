#include <stdio.h>
#include <string.h>

int read_d2(FILE*, int);
int read_d4(FILE*, int);
int read_MSAT(FILE*, int int[]);

int main(int argc, char *argv[])
{
	FILE *fp;
	int MSAT_start, MSAT_len, SAT_len;
	int *SAT_chain;
	
	fp = fopen(argv[1], "rb");
	
	SAT_len = read_d4 (fp, 44);
	MSAT_start = read_d4(fp, 68);
	MSAT_len = read_d4(fp, 72);
	SAT_chain = malloc(SAT_len * sizeof(int));

	fclose (fp);
	return 0;
}

// reads a 2-byte int from pos in file
int read_d2(FILE *file, int pos)
{
	char buf[2];
	int num;
	fseek(file, pos, SEEK_SET);
	fread(&buf, 1, 2, file);
	num = (buf[1] << sizeof(buf[0])) | buf[0];
	return num;
}

// reads 4-byte int from pos in file
int read_d4(FILE *file, int pos)
{
	char buf[4];
	int num;
	int s = sizeof(buf[0]);
	fseek(file, pos, SEEK_SET);
	fread(&buf, 1, 4, file);
	num = (buf[3] << s * 3) | (buf[2] << s * 2) | (buf[1] << s) | buf[0];
	return num;
}

// reads the MSAT of length len into chain
void read_MSA(FILE *file, int len, int chain[])
{

