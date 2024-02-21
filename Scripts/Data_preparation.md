# Commands to prepare the Datasets for the Analyses
This pipeline has been applied to the amino acids alignment as well (with the needed changes in input file formats).
## Needed programs
- MAFFT
- TrimAl
- AMAS.py
- Aliview
## Commands
Remotion of gaps:
```sh
sed -i 's/-//g' *
```
Alignment with MAFFT (v7.505):
```sh
for i in *.fa; do mafft --thread 10 --reorder --adjustdirection "$i" > ../mafft_na/"${i::-3}"mafft.fa; done 
```
Additional check by hand of the sequences through Aliview, some were reversed complemented (almost always just the outgroups).  
Trimming with trimAl (v1.4.rev15):
```sh
for i in *mafft.fa; do trimal -in "$i" -out ../trimm_na/"${i::-8}".trim.faa -gappyout -resoverlap 0.80 -seqoverlap 80; done
```
Trimmed fasta to oneline:
```sh
for i in *; do awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < "$i" > ../../trimm_na_ol/with/"$i".ol; done
```
ID adjustment:
```sh
sed -i 's/;//' *
sed -i 's/_R_//' *
sed -i 's/bifralecta/bifratrilecta/' *
sed -i 's/tanzaniophasma/Tanzaniophasma/' *
```
Concatenate all fasta for phylogenetic inference with RAxML:
```sh
AMAS.py concat -i ../../trimm_na_ol/with/* -f fasta -d dna --concat-out ./concat_with.fa --part-format raxml
```

---
[Main](../README.md)/[1](Data_preparation.md)/[2](Phylogenetic_inference.md)/[3](MCMCtree.md)/[4](Plots.R)
