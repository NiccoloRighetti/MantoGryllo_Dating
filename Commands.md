# List of commands 
## Conda activation
```
eval "$(/home/niccolorighetti/anaconda3/bin/conda shell.bash hook)" 
conda init
conda activate phylocon
```
## Needed programs
- Mafft
- TrimAl
- Paml (for MCMCtree)
- Raxml-ng
- Modeltest-ng
- Amas
## Sequence preparation
Remotion of gaps:
```
sed -i 's/-//g' *
```
Alignment with mafft (MAFFT v7.505):
```
for i in *.fa; do mafft --thread 10 --reorder --adjustdirection "$i" > ../mafft_na/"${i::-3}"mafft.fa; done 
```
Additional check by hand of the sequences, some were reversed complemented (almost always just the outgroups).
Trimming with trimAl (v1.4.rev15 build[2013-12-17]):
```
for i in *mafft.fa; do trimal -in "$i" -out ../trimm_na/"${i::-8}".trim.faa -gappyout -resoverlap 0.80 -seqoverlap 80; done
```
Trimmed fasta to oneline:
```
for i in *; do awk '/^>/ {printf("\n%s\n",$0);next; } { printf("%s",$0);}  END {printf("\n");}' < "$i" > ../../trimm_na_ol/with/"$i".ol; done
```
ID adjustment:
```
sed -i 's/;//' *
sed -i 's/_R_//' *
sed -i 's/bifralecta/bifratrilecta/' *
sed -i 's/tanzaniophasma/Tanzaniophasma/' *
```
Concatenate all fasta for phylogenetic inference with RAxML:
```
AMAS.py concat -i ../../trimm_na_ol/with/* -f fasta -d dna --concat-out ./concat_with.fa --part-format raxml
```
## Ultrametric tree generation
Model selection with modeltest-ng (modeltest x.y.z; Copyright (C) 2017 Diego Darriba, David Posada, Alexandros Stamatakis):
```
modeltest-ng -d nt -i ../../../../../data/trimmed_concat_na/with/concat_with.fa -q ../../../../../data/trimmed_concat_na/with/partitions.txt -o ./modeltest_with
```
I use the file modeltest_with.part.aicc.  
Maximum Likelihood phylogeny with RAxML (version 8.2.12 released by Alexandros Stamatakis on May 2018):
```
raxml-ng -msa ../../../../data/trimmed_concat_na/with/concat_with.fa --prefix ./phylo_with.tree --all --bs-trees 100 --model ../../modeltest/aa/modeltest_with.part.aicc -tree-constraint ../../../../data/topology_constraint/with_group.tree
```
For the moment I do everything with the problematic species (always "with" directories).  
## MCMCtree file preparation
### Nucleotides
Fasta to Phylip through Aliview: ```concat_with_phy```.  
Tree is already in Newick format: ```ultrametric_na.tree```.  


### Amino acids
Fasta to Phylip through Aliview: ```concat_with_phy```.  
