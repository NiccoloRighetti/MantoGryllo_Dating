# MCMCtree + Convergence Check
This file presents the commands to run MCMCtree on the nucleotidic alignment with LBA groups and with all calibration points.  
To run the analyses on a different dataset or with a different set of calibrations, you need to modify respectively the ```concat.phy``` file (with the correspondent ```ultrametric_na.tree``` generated through RAxML) and the ```tree_calib.tree``` with the desired set of fossils priors.  

## 0. Data Preparation
### Calibration Points
List of the calibration points used in the dating analysis:
| Species                    | Min age (Mya) | Max age (Mya) | Group  | Reference              | Id in Jackknife analysis
|-----------------------------|-------------------|-------------------|---------------------|------------------------|-----|
| _Palaeotaeniopteryx elegans_  | 268.3             | 411               | crown Plecoptera    | Sharov, 1961           | 1
| _Raphogla rubra_              | 271.8             | 411               | crown Orthoptera    | Bethoux et al., 2002  | 2
| _Juramantis initialis_        | 145               | 316               | crown Dictyoptera   | Vrsansky, 2002         | 4
| _Valditermes brennenae_      | 130.3             | 325               | crown Isoptera      | Krishna et al., 2013   | 3
| _Echinosomiscus primoticus_   | 98.2              | 411               | crown Phasmatodea   | Engel et al., 2016     | 5
| _Protoprosbole straeleni_           | 319.9             | 521               | crown Neoptera      | Wolfe et al., 2014     | root
### Input files
Fasta to Phylip through Aliview --> ```concat_with_phy```.  
Tree is already in Newick format --> ```ultrametric_na.tree```.  

## 1. Calculate Rate Prior in R
To calculate the beta parameter for the subsequent MCMCtree analysis, the ultrametric tree has been imported in R and the following commands have been launched:
```R
# Needed libraries:
library(rstudioapi)
library(phytools)

# Ultrametric tree import:
raw_tt <- ape::read.tree(file = "fna_tree.new")

# Rate estimation:
tree_height <- max(phytools::nodeHeights(raw_tt))  # 2.547035
root_age <- 5.21  # from Wolfe et al., 2014 (crown Neoptera)
mean_rate <- tree_height / root_age  # 0.4888743 subst/site per time unit
alpha <- 2
beta <- alpha / mean_rate  # 4.091031
```

## 2. BASEML for Hessian Estimation
The following control file is needed to estimate the Hessian with MCMCtree.  
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
```sh
sed 's/:[0-9.]*//g' ultrametric_na.tree.new > tree_uncalib.tree
```
Now i run mcmctree to create the input file for baseml:
```sh
mcmctree prepbaseml.ctl
```
I stop it as I see “counting frequencies…”.  
I change method to 1 and alpha to 2.  
I run baseml to obtain the input files for MCMCtree:
```sh
sed -i 's/method = 0/method = 1/; s/alpha = 0.5/alpha = 2/' tmp0001.ctl 
baseml tmp0001.ctl
mv rst2 in.BV
```
## 3. MCMCtree run
I modify the .ctl file (uncalib_tree -> calib_tree) and the paths to the alingment and the calibrated tree.
```sh
sed 's/usedata = 3/usedata = 2 in.BV 1/; s/tree_uncalib.tree/tree_calib.tree/' prepbaseml.ctl > truemcmctree.ctl
sed -i 's/concat_with.phy/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/with\/na\/input_data\/concat_with.phy/' truemcmctree.ctl
sed -i 's/tree_calib.tree/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/with\/na\/input_data\/tree_calib.tree/' truemcmctree.ctl
sed -i 's/in.BV/\/home\/STUDENTI\/niccolo.righetti\/MantoGryllo\/analyses\/mcmctree\/with\/na\/input_data\/in.BV/' truemcmctree.ctl
```
The calibrated tree is as following. A skew-normal distribution on the fossils priors has been kept, with the exeption of a normal distribution on the root prior.  
```
(Anax_imperator,((Zorotypus_medoensis,(Challia_fletcheri,Euborellia_arcanum)),(((Mesocapnia_arizonensis,Pteronarcys_princeps),(Zelandoperla_fenestrata,Acroneuria_hainana))'SN(3.3965,0.2,50)',(((Gryllotalpa_unispina,Teleogryllus_emma),(Atractomorpha_sinensis,(Acrida_cinerea,(Xyleus_modestus,Tristira_magellanica))))'SN(3.414,0.2,50)',(((Leptomantella_albella,((Creobroter_gemmatus,Anaxarcha_zhengi),(Mantis_religiosa,(Rhombodera_valida,Tenodera_sinesi)))),((Gromphadorhina_portentosa,Blattella_bisignata),(Eupolyphaga_sinensis,(Periplaneta_americana,(Cryptocercus_kyebangensis,(Mastotermes_darwiniensis,(Zootermopsis_nevadensis,(Cryptotermes_secundus,(Nasutitermes_corniger,(Reticulitermes_flavipes,(Coptotermes_formosanus,Heterotermes_validus))))))'SN(2.276,0.2,50)')))))'SN(2.305,0.2,50)',(((Galloisiana_yusai,(Grylloblatta_sculleni,Grylloblatta_bifratrilecta)),(Tanzaniophasma_sp,(Mantophasma_sp,Sclerophasma_paresisensis))),((Aposthonia_japonica,(Aposthonia_borneensis,Eosembia_sp)),(Timema_californicum,(Carausius_morosus,(((Nanhuaphasma_hamicercum,Orthomeria_smaragdinum),(Phyllium_tibetense,Cryptophyllium_westwoodi)),(Peruphasma_schultei,((Bacillus_rossius,Sipyloidea_sipylus),(Heteropteryx_dilatata,(Extatosoma_tiaratum,Ramulus_irregulariterdentatus)))))))'SN(2.546,0.2,50)')))))))'B(3.199,5.21)';
```
Script to create the folders for 3 clock models and 5 run each:
```sh
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
Then I move the control file for each clock model inside the respective directories and launch mcmctree inside each of them with the following script:
 ```sh
#!/bin/bash

# Define the number of runs and clocks
num_runs=5
num_clocks=3

# Loop through each run
for run in $(seq 1 $num_runs); do
    # Loop through each clock
    for clock in $(seq 1 $num_clocks); do
        # Create the folder name
        folder="run${run}_clock${clock}"

        # Change directory to the current folder
        cd "$folder"

        # Start the mcmctree process for the corresponding clock
        mcmctree "clock${clock}.ctl" &

        # Change back to the parent directory
        cd ..
    done
done
```
## 4. Convergence check
To extract the ```mcmc.txt``` files from each directory to access convergence:
```sh
#!/bin/bash

# Create the directory for txt files if it doesn't exist
mkdir -p txt_files

# Loop through each folder matching the pattern run*_clock*/
for folder in run*_clock*/; do
    # Extract run and clock numbers from the folder name
    run=$(echo "$folder" | grep -oP 'run\K\d+')
    clock=$(echo "$folder" | grep -oP 'clock\K\d+')

    # Define the source and destination paths
    source_file="${folder}mcmc.txt"
    destination_file="txt_files/run${run}_clock${clock}_mcmc.txt"

    # Copy and rename the file
    cp "$source_file" "$destination_file"
done

# Make three subdirectories inside txt_files and move runs with same clock model inside each directory
cd txt_files
for i in {1..3}; do
    mkdir clock_"$i"
    for j in {1..5}; do
        mv run"$j"_clock"$i"_mcmc.txt clock_"$i"/
    done
done
```
Convergence for the 5 runs of each model with and without the two groups has been checked through Tracer v1.7.2.