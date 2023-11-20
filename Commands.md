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
## MCMCtree with Embiottera, Zoraptera and Dermaptera 
### Nucleotides
Fasta to Phylip through Aliview: ```concat_with_phy```.  
Tree is already in Newick format: ```ultrametric_na.tree```.  
1. CALCULATE RATE PRIOR IN R
```
# Needed libraries:
library( rstudioapi )
library( phytools )
# Ultrametric tree import:
raw_tt <- ape::read.tree( file = "fna_tree.new" )
# Rate estimation:
tree_height <- max( phytools::nodeHeights( raw_tt ) )  # 2.547035
root_age <- 5.21  # from Wolfe et al., 2014 (crown Neoptera)
mean_rate <- tree_height / root_age # 0.4888743 subst/site per time unit
alpha <- 2
beta <- alpha/mean_rate  # 4.091031
```
2. BASEML FOR HESSIAN ESTIMATION
```prebaseml.ctl``` file:
```
          seed = -1
       seqfile = concat_with.phy
      treefile = tree_uncalib.tree
      mcmcfile = mcmc.txt
       outfile = out.txt

         ndata = 1
       seqtype = 0    * 0: nucleotides; 1:codons; 2:AAs
       usedata = 3    * 0: no data (prior); 1:exact likelihood;
                      * 2:approximate likelihood; 3:out.BV (in.BV)
         clock = 1    * 1: global clock; 2: independent rates; 3: correlated rates

         model = 4    * 0:JC69, 1:K80, 2:F81, 3:F84, 4:HKY85
         alpha = 2  * alpha for gamma rates at sites
         ncatG = 5    * No. categories in discrete gamma

     cleandata = 0    * remove sites with ambiguity data (1:yes, 0:no)?

       BDparas = 1 1 0.1    * birth, death, sampling

   rgene_gamma = 2 409   * gammaDir prior for rate for genes
  sigma2_gamma = 1 10  * gammaDir prior for sigma^2     (for clock=2 or 3)

         print = 1       * 0: no mcmc sample; 1: everything except branch rates 2: everything
        burnin = 100000
      sampfreq = 1000
       nsample = 20000
```
From ultrametric tree to uncalibrated tree (also add by hand n° of sequences and number of trees in the first row):
```
sed 's/:[0-9.]*//g' ultrametric_na.tree.new > tree_uncalib.tree
```
Now i run mcmctree to create the input file for baseml:
```
mcmctree prepbaseml.ctl
```
I stop it as I see “counting frequencies…”.  
I change method to 1 and alpha to 2.  
I run baseml:
```
sed -i 's/method = 0/method = 1/; s/alpha = 0.5/alpha = 2/' tmp0001.ctl 
baseml tmp0001.ctl
mv rst2 in.BV
```
I modify the .ctl file (uncalib_tree -> calib_tree) and create input files for the three clock model (1,2,3).
```
sed 's/usedata = 3/usedata = 2 in.BV 1/; s/tree_uncalib.tree/tree_calib.tree/' prepbaseml.ctl > truemcmctree.ctl
sed -i 's/concat_with.phy/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/with\/na\/input_data\/concat_with.phy/' truemcmctree.ctl
sed -i 's/tree_calib.tree/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/with\/na\/input_data\/tree_calib.tree/' truemcmctree.ctl
sed -i 's/in.BV/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/with\/na\/input_data\/in.BV/' truemcmctree.ctl
```
I decide to keep the calibration prior with a skew-normal distribution. The calibrated tree is as following:
```
(Anax_imperator,((Zorotypus_medoensis,(Challia_fletcheri,Euborellia_arcanum)),(((Mesocapnia_arizonensis,Pteronarcys_princeps),(Zelandoperla_fenestrata,Acroneuria_hainana))'B(2.683,4.11)',(((Gryllotalpa_unispina,Teleogryllus_emma),(Atractomorpha_sinensis,(Acrida_cinerea,(Xyleus_modestus,Tristira_magellanica))))'B(2.718,4.11)',(((Leptomantella_albella,((Creobroter_gemmatus,Anaxarcha_zhengi),(Mantis_religiosa,(Rhombodera_valida,Tenodera_sinesi)))),((Gromphadorhina_portentosa,Blattella_bisignata),(Eupolyphaga_sinensis,(Periplaneta_americana,(Cryptocercus_kyebangensis,(Mastotermes_darwiniensis,(Zootermopsis_nevadensis,(Cryptotermes_secundus,(Nasutitermes_corniger,(Reticulitermes_flavipes,(Coptotermes_formosanus,Heterotermes_validus))))))'B(1.303,3.25)')))))'B(1.45,3,16)',(((Galloisiana_yusai,(Grylloblatta_sculleni,Grylloblatta_bifratrilecta)),(Tanzaniophasma_sp,(Mantophasma_sp,Sclerophasma_paresisensis))),((Aposthonia_japonica,(Aposthonia_borneensis,Eosembia_sp)),(Timema_californicum,(Carausius_morosus,(((Nanhuaphasma_hamicercum,Orthomeria_smaragdinum),(Phyllium_tibetense,Cryptophyllium_westwoodi)),(Peruphasma_schultei,((Bacillus_rossius,Sipyloidea_sipylus),(Heteropteryx_dilatata,(Extatosoma_tiaratum,Ramulus_irregulariterdentatus)))))))'B(0.982,4.11)')))))))'B(3.199,5.21)';
```

## MCMCtree without Embiottera, Zoraptera and Dermaptera 
### Nucleotides
Fasta to Phylip through Aliview: ```concat_wout_phy```.  
Tree is already in Newick format: ```ultrametric_na.tree```.  
1. CALCULATE RATE PRIOR IN R
```
# Needed libraries:
library( rstudioapi )
library( phytools )
# Ultrametric tree import:
raw_tt <- ape::read.tree( file = "fna_tree.new" )
# Rate estimation:
tree_height <- max( phytools::nodeHeights( raw_tt ) )  # 1.696109
root_age <- 5.21  # from Wolfe et al., 2014 (crown Neoptera)
mean_rate <- tree_height / root_age # 0.3255488 subst/site per time unit
alpha <- 2
beta <- alpha/mean_rate  # 6.143473
```
2. BASEML FOR HESSIAN ESTIMATION
```prebaseml.ctl``` file:
```
          seed = -1
       seqfile = concat_wout.phy
      treefile = tree_uncalib.tree
      mcmcfile = mcmc.txt
       outfile = out.txt

         ndata = 1
       seqtype = 0    * 0: nucleotides; 1:codons; 2:AAs
       usedata = 3    * 0: no data (prior); 1:exact likelihood;
                      * 2:approximate likelihood; 3:out.BV (in.BV)
         clock = 1    * 1: global clock; 2: independent rates; 3: correlated rates

         model = 4    * 0:JC69, 1:K80, 2:F81, 3:F84, 4:HKY85
         alpha = 2  * alpha for gamma rates at sites
         ncatG = 5    * No. categories in discrete gamma

     cleandata = 0    * remove sites wout ambiguity data (1:yes, 0:no)?

       BDparas = 1 1 0.1    * birth, death, sampling

   rgene_gamma = 2 409   * gammaDir prior for rate for genes
  sigma2_gamma = 1 10  * gammaDir prior for sigma^2     (for clock=2 or 3)

         print = 1       * 0: no mcmc sample; 1: everything except branch rates 2: everything
        burnin = 100000
      sampfreq = 1000
       nsample = 20000
```
From ultrametric tree to uncalibrated tree (also add by hand n° of sequences and number of trees in the first row):
```
sed 's/:[0-9.]*//g' ultrametric_na.tree.new > tree_uncalib.tree
```
Now i run mcmctree to create the input file for baseml:
```
mcmctree prepbaseml.ctl
```
I stop it as I see “counting frequencies…”.  
I change method to 1 and alpha to 2.  
I run baseml:
```
sed -i 's/method = 0/method = 1/; s/alpha = 0.5/alpha = 2/' tmp0001.ctl 
baseml tmp0001.ctl
mv rst2 in.BV
```
I modify the .ctl file (uncalib_tree -> calib_tree) and create input files for the three clock model (1,2,3).
```
sed 's/usedata = 3/usedata = 2 in.BV 1/; s/tree_uncalib.tree/tree_calib.tree/' prepbaseml.ctl > truemcmctree.ctl
sed -i 's/concat_wout.phy/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/wout\/na\/input_data\/concat_wout.phy/' truemcmctree.ctl
sed -i 's/tree_calib.tree/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/wout\/na\/input_data\/tree_calib.tree/' truemcmctree.ctl
sed -i 's/in.BV/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/wout\/na\/input_data\/in.BV/' truemcmctree.ctl
```
I decide to keep the calibration prior wout a **uniform** distribution to reduce personal bias in the modelization of the distributions. The calibrated tree is as following:
```
(Anax_imperator,(((Mesocapnia_arizonensis,Pteronarcys_princeps),(Zelandoperla_fenestrata,Acroneuria_hainana))'B(2.683,4.11)',(((Gryllotalpa_unispina,Teleogryllus_emma),(Atractomorpha_sinensis,(Acrida_cinerea,(Xyleus_modestus,Tristira_magellanica))))'B(2.718,4.11)',(((Leptomantella_albella,((Creobroter_gemmatus,Anaxarcha_zhengi),(Mantis_religiosa,(Rhombodera_valida,Tenodera_sinesi)))),((Gromphadorhina_portentosa,Blattella_bisignata),(Eupolyphaga_sinensis,(Periplaneta_americana,(Cryptocercus_kyebangensis,(Mastotermes_darwiniensis,(Zootermopsis_nevadensis,(Cryptotermes_secundus,(Nasutitermes_corniger,(Reticulitermes_flavipes,(Coptotermes_formosanus,Heterotermes_validus))))))'B(1.303,3.25)')))))'B(1.45,3,16)',(((Galloisiana_yusai,(Grylloblatta_sculleni,Grylloblatta_bifratrilecta)),(Tanzaniophasma_sp,(Mantophasma_sp,Sclerophasma_paresisensis))),(Timema_californicum,(Carausius_morosus,(((Nanhuaphasma_hamicercum,Orthomeria_smaragdinum),(Phyllium_tibetense,Cryptophyllium_westwoodi)),(Peruphasma_schultei,((Bacillus_rossius,Sipyloidea_sipylus),(Heteropteryx_dilatata,(Extatosoma_tiaratum,Ramulus_irregulariterdentatus))))))'B(0.982,4.11)'))))))'B(3.199,5.21)';
```
Create the folders for 3 clock models and 10 run each:
```
#!/bin/bash

# Loop through the clock values (1, 2, 3)
for clock in {1..3}; do
    # Loop through the 10 runs
    for run in {1..5}; do
        # Define the folder name for the current run and clock
        folder="run${run}_clock${clock}"

        # Create the directory if it doesn't exist
        mkdir -p "$folder"
    done
done
```



### Amino acids
Fasta to Phylip through Aliview: ```concat_wout_phy```.  
