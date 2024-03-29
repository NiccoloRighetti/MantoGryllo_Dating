# Phylogenetic Inference through RAxML
This pipeline has been applied to all 4 datasets (nucleotides and amino acids, with and without LBA groups).  
The constraint topology was taken from [Misof et al 2014](https://www.researchgate.net/profile/Guillem-Ylla/publication/322698687/figure/fig1/AS:614339941761024@1523481464078/Phylogenetic-tree-of-insects-modified-from-Misof-et-al-2014-The-Blattodea-branch.png).  

## Needed programs
- Raxml-ng
- Modeltest-ng

## Commands
Model selection with modeltest-ng (v0.1.6):
```sh
modeltest-ng -d nt -i ../../../../../data/trimmed_concat_na/with/concat_with.fa -q ../../../../../data/trimmed_concat_na/with/partitions.txt -o ./modeltest_with
```
I use the file modeltest_with.part.aicc.  
Maximum Likelihood phylogeny with RAxML (v8.2.12):
```sh
raxml-ng -msa ../../../../data/trimmed_concat_na/with/concat_with.fa --prefix ./phylo_with.tree --all --bs-trees 100 --model ../../modeltest/aa/modeltest_with.part.aicc -tree-constraint ../../../../data/topology_constraint/with_group.tree
```



---
[Main](../README.md)/[1](Data_preparation.md)/[2](Phylogenetic_inference.md)/[3](MCMCtree.md)/[4](Plots.R)
