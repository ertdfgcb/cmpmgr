#!/bin/bash

source ./conversions.sh
file=$1
bytes() {
	./get_bytes.sh $file $1 $2
}

echo "Identifier: " $(bytes 0 8 | hex)
echo "UID: " $(bytes 8 16 | hex)
echo "Revision number: " $(bytes 24 2 | d2)
echo "Version number: " $(bytes 26 2 | d2)
echo "Byte order ID: " $(bytes 28 2 | d2)
echo "Sector size (ssz): " $(bytes 30 2 | d2)
echo "Short sector size (sssz): " $(bytes 32 2 | d2)
echo "Length in sectors of SAT: " $(bytes 44 4 | d4)
echo "Start sector of dir entries: " $(bytes 48 4 | d4)
echo "Minimum std steam size: " $(bytes 56 4 | d4)
echo "First sector of SSAT: " $(bytes 60 4 | d4)
echo "Length in sectors of SSAT: " $(bytes 64 4 | d4)
echo "First sector of MSAT: " $(bytes 68 4 | d4)
echo "Length in sectors of MSAT: " $(bytes 72 4 | d4)
echo "First 109 entries of MSAT: " 
bytes 76 436 | xxd
echo "Dir entries: "
bytes
