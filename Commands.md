# List of commands 
## Conda activation
```
eval "$(/home/niccolorighetti/anaconda3/bin/conda shell.bash hook)" 
conda init
conda activate phylocon
```
## Needed programs
- Iqtree
- Mafft
- TrimAl
- Paml (for MCMCtree)
## Sequence preparation
Remotion of gaps:
```
sed -i 's/-//g' *
```
Alignment with mafft (MAFFT v7.505):
```
for i in *.fa; do mafft --thread 10 --reorder --adjustdirection "$i" > ../mafft_na/"${i::-3}"mafft.fa; done 
```
Trimming with trimAl (v1.4.rev15 build[2013-12-17]):
```
for i in *mafft.fa; do trimal -in "$i" -out ../trimm_na/"${i::-8}".trim.faa -gt 0.4; done
```
Additional check by hand of the sequences. No sequence has been modified by hand.
## Phylogeny with iqtree (version 2.0.3 for Linux 64-bit built Dec 20 2020):
```
iqtree -p ../../data/trimm_na/ -m TESTNEW -bb 1000 -T AUTO --prefix na.with --seqtype DNA # with Embioptera and Zoraptera
iqtree -p ../../data/trimm_na/ -m TESTNEW -bb 1000 -T AUTO --prefix na.wout --seqtype DNA # without Embioptera and Zoraptera
```
