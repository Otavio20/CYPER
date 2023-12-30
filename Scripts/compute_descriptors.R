#Use to process fasta amino acid files according to protein descriptors metrics
library(protr)
library(argparse)

parser = ArgumentParser(description='Calculate descriptor metrics for proteins')
parser$add_argument('-i', '--input', help='input file')
parser$add_argument('-o', '--output', help='output file name (tab file)')
args <- parser$parse_args()




computations<-function(x){
  c(extractAAC(x),extractDC(x),extractTC(x),extractCTDC(x),extractCTDT(x),extractCTDD(x),extractPAAC(x),extractAPAAC(x))
}

resume_descriptors<-function(x,y){
	write.table(t(as.data.frame(sapply(readFASTA(x),computations))),y, sep="\t")
}

cat("input file: ", args$i, "\noutput file: ", args$o)
print("Computing...")
resume_descriptors(args$i,args$o)


