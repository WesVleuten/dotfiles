
qenc() {
	infile=$1
	outfile=$infile.enc
	openssl enc -aes256 -e -in $infile -out $outfile
}

qdec() {
	infile=$1
	openssl enc -aes256 -d -in $infile
}

