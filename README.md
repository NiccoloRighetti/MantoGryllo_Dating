# MantoGryllo_Dating
Dated Phylogeny of Mantophasmatodea and Grylloblattodea
## Workflow
1) Dating through 5 runs of MCMCtree.
2) 5 runs with Embioptera and Zoraptera, 5 runs without them. List of species to be removed:
  - Aposthonia borneensis
  - Aposthonia japonica
  - Eosembia sp.
  - Zorotypus medoensis
  - Challia fletcheri
  - Euborellia arcanum
3) Jacknife of fossils, they are 5. Every time I remove one of them, 5 runs each. I do this with the three clock models implemented in MCMCtree.
4) Total number of MCMCtree runs is 6x5x3 with Embioptera and Zoraptera and 6x5x3 without them.  
The results for the runs with all the fossils are store in [All_Fossils](All_Fossils), there you can find:
- the [lnL stats](All_Fossils/lnL) for convergence of 5 runs for each model with and wout Embioptera and Zoraptera (20x10^6 gen with 10% burnin);
- the trees in .pdf for each model with and without Embioptera and Zoraptera are in [this](All_Fossils/Trees.pdf) directory;
- radarcharts for each clock model comparing the dating with/without Embioptera/Zoraptera are in [this](All_Fossils/Radarcharts.pdf) directory.
# Paper draft
[Link](https://docs.google.com/document/d/1J3gq3wQtmarodkV0guRLSztjU48_idVBuGVGOqmFKoQ/edit?hl=it&pli=1#heading=h.kyh1jjl3h2e2) to the draft.  
- abstract: 200
- intro: 500
- mat/met: 700 (at the moment 479 words by Nick, needed ~150 words by Giobbe for mt-assembly and data collection)
- res/disc: 800
[Link](https://resjournals.onlinelibrary.wiley.com/journal/13653113) to Systematic Entomology online page.
## Introduction
- Grylloblattoidea and Mantophasmatoidea (what, where)
- Gap of knowledge (timing unknown)  
Topology reference: [Misof et al 2014](https://www.researchgate.net/profile/Guillem-Ylla/publication/322698687/figure/fig1/AS:614339941761024@1523481464078/Phylogenetic-tree-of-insects-modified-from-Misof-et-al-2014-The-Blattodea-branch.png).
