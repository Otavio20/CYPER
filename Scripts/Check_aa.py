
import argparse
from Bio import SeqIO
parser = argparse.ArgumentParser(
                    prog = 'AAChecker',
                    description = 'Check AA sequences for valid amino acids computing',
                    epilog = 'Text at the bottom of help')
parser.add_argument('-i', '--input')
args = parser.parse_args()


def check_aminoacids(x):
        removed=list()
        record_dict = SeqIO.to_dict(SeqIO.parse(x, "fasta"))
        for key, value in dict(record_dict).items():
                if 'X' in value:
                  removed.append(key)
                  del record_dict[key]
        with open('checked.fasta', 'w') as handle:
                SeqIO.write(record_dict.values(), handle, 'fasta')
        print("Removed ids: ", removed)

check_aminoacids(args.input)
