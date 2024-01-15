# PLOTS
# Here you can find the commands to plot one single tree (the one we displayed in the paper) and to plot the other main figures.

# List of required packages
required_packages <- c(
  "MCMCtreeR", "readr", "ape", "scales", "ggplot2", 
  "tm", "gridExtra", "fmsb", "devtools", "ggradar", "cowplot", "dplyr"
)

# Install and load packages
for (package in required_packages) {
  if (!requireNamespace(package, quietly = TRUE)) {
    install.packages(package, dependencies = TRUE)
  }
  library(package, character.only = TRUE)
}

# Optional: Display a message indicating successful loading of packages
cat("All required packages have been successfully installed and loaded.\n")\


# TREE PLOT
# To plot another tree, just copy and paste the nexus line inside the first row of code
with_all_clock2<-as.character(c("#NEXUS","begin trees","","(Anax_imperator: 4.878595, ((Zorotypus_medoensis: 4.513863, (Challia_fletcheri: 2.393924, Euborellia_arcanum: 2.393924) [&95%={1.53901, 3.25375}]: 2.119939) [&95%={3.98161, 4.98394}]: 0.221288, (((Mesocapnia_arizonensis: 3.153605, Pteronarcys_princeps: 3.153605) [&95%={2.74179, 3.45746}]: 0.320172, (Zelandoperla_fenestrata: 2.881256, Acroneuria_hainana: 2.881256) [&95%={2.09403, 3.27585}]: 0.592521) [&95%={3.39782, 3.65864}]: 0.760282, (((Gryllotalpa_unispina: 2.853027, Teleogryllus_emma: 2.853027) [&95%={2.16045, 3.26512}]: 0.692933, (Atractomorpha_sinensis: 1.845547, (Acrida_cinerea: 1.374569, (Xyleus_modestus: 1.107138, Tristira_magellanica: 1.107138) [&95%={0.666042, 1.65753}]: 0.267432) [&95%={0.907812, 1.93772}]: 0.470978) [&95%={1.30478, 2.45462}]: 1.700412) [&95%={3.41901, 3.7615}]: 0.275119, (((Leptomantella_albella: 1.582158, ((Creobroter_gemmatus: 0.965248, Anaxarcha_zhengi: 0.965248) [&95%={0.637286, 1.34159}]: 0.224932, (Mantis_religiosa: 0.959989, (Rhombodera_valida: 0.754187, Tenodera_sinesi: 0.754187) [&95%={0.466246, 1.10749}]: 0.205802) [&95%={0.66263, 1.32327}]: 0.230191) [&95%={0.876099, 1.56793}]: 0.391978) [&95%={1.18526, 2.05079}]: 1.519674, ((Gromphadorhina_portentosa: 1.993605, Blattella_bisignata: 1.993605) [&95%={1.33201, 2.53579}]: 0.939840, (Eupolyphaga_sinensis: 2.857919, (Periplaneta_americana: 2.726065, (Cryptocercus_kyebangensis: 2.529992, (Mastotermes_darwiniensis: 2.318378, (Zootermopsis_nevadensis: 2.012824, (Cryptotermes_secundus: 1.745008, (Nasutitermes_corniger: 1.034510, (Reticulitermes_flavipes: 0.819141, (Coptotermes_formosanus: 0.530538, Heterotermes_validus: 0.530538) [&95%={0.312185, 0.805323}]: 0.288603) [&95%={0.563109, 1.11701}]: 0.215369) [&95%={0.751664, 1.35103}]: 0.710498) [&95%={1.43366, 2.00244}]: 0.267815) [&95%={1.73863, 2.21083}]: 0.305554) [&95%={2.27488, 2.4239}]: 0.211615) [&95%={2.40384, 2.69505}]: 0.196073) [&95%={2.55861, 2.91561}]: 0.131854) [&95%={2.67647, 3.0447}]: 0.075527) [&95%={2.74964, 3.11775}]: 0.168387) [&95%={2.91038, 3.28613}]: 0.439651, (((Galloisiana_yusai: 1.883840, (Grylloblatta_sculleni: 0.525979, Grylloblatta_bifratrilecta: 0.525979) [&95%={0.275467, 0.899719}]: 1.357861) [&95%={1.21357, 2.60271}]: 1.406387, (Tanzaniophasma_sp: 1.218194, (Mantophasma_sp: 0.407036, Sclerophasma_paresisensis: 0.407036) [&95%={0.217585, 0.701409}]: 0.811159) [&95%={0.755145, 1.84795}]: 2.072033) [&95%={2.97261, 3.57053}]: 0.131346, ((Aposthonia_japonica: 1.493289, (Aposthonia_borneensis: 0.322041, Eosembia_sp: 0.322041) [&95%={0.175329, 0.53281}]: 1.171247) [&95%={1.03287, 2.00254}]: 1.556649, (Timema_californicum: 2.884722, (Carausius_morosus: 2.043521, (((Nanhuaphasma_hamicercum: 1.213557, Orthomeria_smaragdinum: 1.213557) [&95%={0.817459, 1.60786}]: 0.515687, (Phyllium_tibetense: 0.757634, Cryptophyllium_westwoodi: 0.757634) [&95%={0.439939, 1.14353}]: 0.971609) [&95%={1.40453, 2.06556}]: 0.134973, (Peruphasma_schultei: 1.688407, ((Bacillus_rossius: 1.381265, Sipyloidea_sipylus: 1.381265) [&95%={1.02308, 1.73355}]: 0.197949, (Heteropteryx_dilatata: 1.444592, (Extatosoma_tiaratum: 1.229370, Ramulus_irregulariterdentatus: 1.229370) [&95%={0.877256, 1.58615}]: 0.215222) [&95%={1.11173, 1.78234}]: 0.134622) [&95%={1.25755, 1.90981}]: 0.109194) [&95%={1.3662, 2.0186}]: 0.175809) [&95%={1.54392, 2.1917}]: 0.179305) [&95%={1.70959, 2.38137}]: 0.841201) [&95%={2.64706, 3.14655}]: 0.165216) [&95%={2.79288, 3.32937}]: 0.371636) [&95%={3.1681, 3.67573}]: 0.119910) [&95%={3.32137, 3.79599}]: 0.279595) [&95%={3.61052, 4.08785}]: 0.412980) [&95%={3.93442, 4.59249}]: 0.501092) [&95%={4.29258, 5.1451}]: 0.143445) [&95%={4.3922, 5.24465}];","END;"))

phy_with_all_2 <- readMCMCtree(with_all_clock2, from.file = FALSE)

pdf("mcmctree_outputs/All_Fossils/Trees.pdf/with_all_clock2.2.pdf", width = 11.7, height = 8.3)
MCMC.tree.plot(phy = phy_with_all_2, analysis.type = "MCMCtree",
               MCMC.chain = NULL, node.ages = NULL, directory.files = NULL,
               plot.type = "phylogram", build.tree = FALSE, node.method = "bar",
               all.nodes = NULL, add.time.scale = TRUE, add.abs.time = TRUE,
               scale.res = c("Period"), label.timescale.names = FALSE,
               time.correction = 100, col.age = ggplot2::alpha("#FDB927", 0.5), tip.lengths = FALSE,
               density.col = "#00000050", density.border.col = "#00000080",
               cex.tips = 0.5, show.tip.label = TRUE, col.tree = "black",
               tip.color = "black", lwd.bar = 4, grey.bars = TRUE, cex.age = 0.7,
               cex.labels = 0.7, cex.names = 1, relative.height = 0.08,
               tip.bar.col = "#ff000050", burn.in = 0.25,
               distribution.height = 0.8, abs.age.mgp = c(3, 0.35, 0),
               abs.age.lwd.ticks = 0.7, abs.age.lwd = 0, tck.abs.age = -0.01,
               abs.age.line = -0.4, pos.age = NULL, n.runs = 2,
               ladderize.tree = TRUE)
dev.off()

# RADARCHART ALL FOSSILS WITH vs WITHOUT

# CLOCK 1

# Data preparation clock 1 with
with_node_all1<-getMRCA(phy_with_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data_all1<-phy_with_all_1$nodeAges[as.character(with_node_all1),1]
with_node_all2<-getMRCA(phy_with_all_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all2<-phy_with_all_1$nodeAges[as.character(with_node_all2),1]
with_node_all3<-getMRCA(phy_with_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all3<-phy_with_all_1$nodeAges[as.character(with_node_all3),1]
with_node_all4<-getMRCA(phy_with_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data_all4<-phy_with_all_1$nodeAges[as.character(with_node_all4),1]
ages_with_all_clock1<-c(with_data_all1,with_data_all2,with_data_all3,with_data_all4)

# Data preparation clock1 wout
wout_node_all1<-getMRCA(phy_wout_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
wout_data_all1<-phy_wout_all_1$nodeAges[as.character(wout_node_all1),1]
wout_node_all2<-getMRCA(phy_wout_all_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all2<-phy_wout_all_1$nodeAges[as.character(wout_node_all2),1]
wout_node_all3<-getMRCA(phy_wout_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all3<-phy_wout_all_1$nodeAges[as.character(wout_node_all3),1]
wout_node_all4<-getMRCA(phy_wout_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
wout_data_all4<-phy_wout_all_1$nodeAges[as.character(wout_node_all4),1]
ages_wout_all_clock1<-c(wout_data_all1,wout_data_all2,wout_data_all3,wout_data_all4)

# Clock1 radarchart
all_data_clock1<-as.data.frame(rbind(ages_with_all_clock1,ages_wout_all_clock1))
colnames(all_data_clock1)<-c("Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem")
all_data_clock1<-cbind(c("with","without"),all_data_clock1)
colnames(all_data_clock1)<-c("group","Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem" )

pdf("mcmctree_outputs/All_Fossils/Radarcharts.pdf/allfossils_clock1.pdf", width = 11.7, height = 8.3)
ggradar(
  all_data_clock1[], 
  values.radar = c("0", "2.52", "5.5"),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "bottom"
)
dev.off()


# CLOCK 2

# Data preparation clock 2 with
with_node_all1<-getMRCA(phy_with_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data_all1<-phy_with_all_2$nodeAges[as.character(with_node_all1),1]
with_node_all2<-getMRCA(phy_with_all_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all2<-phy_with_all_2$nodeAges[as.character(with_node_all2),1]
with_node_all3<-getMRCA(phy_with_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all3<-phy_with_all_2$nodeAges[as.character(with_node_all3),1]
with_node_all4<-getMRCA(phy_with_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data_all4<-phy_with_all_2$nodeAges[as.character(with_node_all4),1]
ages_with_all_clock1<-c(with_data_all1,with_data_all2,with_data_all3,with_data_all4)

# Data preparation clock2 wout
wout_node_all1<-getMRCA(phy_wout_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
wout_data_all1<-phy_wout_all_2$nodeAges[as.character(wout_node_all1),1]
wout_node_all2<-getMRCA(phy_wout_all_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all2<-phy_wout_all_2$nodeAges[as.character(wout_node_all2),1]
wout_node_all3<-getMRCA(phy_wout_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all3<-phy_wout_all_2$nodeAges[as.character(wout_node_all3),1]
wout_node_all4<-getMRCA(phy_wout_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
wout_data_all4<-phy_wout_all_2$nodeAges[as.character(wout_node_all4),1]
ages_wout_all_clock2<-c(wout_data_all1,wout_data_all2,wout_data_all3,wout_data_all4)


# clock2 radarchart
all_data_clock2<-as.data.frame(rbind(ages_with_all_clock2,ages_wout_all_clock2))
colnames(all_data_clock2)<-c("Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem")
all_data_clock2<-cbind(c("with","without"),all_data_clock2)
colnames(all_data_clock2)<-c("group","Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem" )

pdf("mcmctree_outputs/All_Fossils/Radarcharts.pdf/allfossils_clock2.pdf", width = 11.7, height = 8.3)
ggradar(
  all_data_clock2[], 
  values.radar = c("0", "2.52", "5.5"),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "bottom"
)
dev.off()

# CLOCK 3

# Data preparation clock 3 with
with_node_all1<-getMRCA(phy_with_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data_all1<-phy_with_all_3$nodeAges[as.character(with_node_all1),1]
with_node_all2<-getMRCA(phy_with_all_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all2<-phy_with_all_3$nodeAges[as.character(with_node_all2),1]
with_node_all3<-getMRCA(phy_with_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all3<-phy_with_all_3$nodeAges[as.character(with_node_all3),1]
with_node_all4<-getMRCA(phy_with_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data_all4<-phy_with_all_3$nodeAges[as.character(with_node_all4),1]
ages_with_all_clock3<-c(with_data_all1,with_data_all2,with_data_all3,with_data_all4)

# Data preparation clock3 wout
wout_node_all1<-getMRCA(phy_wout_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
wout_data_all1<-phy_wout_all_3$nodeAges[as.character(wout_node_all1),1]
wout_node_all2<-getMRCA(phy_wout_all_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all2<-phy_wout_all_3$nodeAges[as.character(wout_node_all2),1]
wout_node_all3<-getMRCA(phy_wout_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all3<-phy_wout_all_3$nodeAges[as.character(wout_node_all3),1]
wout_node_all4<-getMRCA(phy_wout_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
wout_data_all4<-phy_wout_all_3$nodeAges[as.character(wout_node_all4),1]
ages_wout_all_clock1<-c(wout_data_all1,wout_data_all2,wout_data_all3,wout_data_all4)

# clock3 radarchart
all_data_clock3<-as.data.frame(rbind(ages_with_all_clock3,ages_wout_all_clock3))
colnames(all_data_clock3)<-c("Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem")
all_data_clock3<-cbind(c("with","without"),all_data_clock3)
colnames(all_data_clock3)<-c("group","Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem" )

pdf("mcmctree_outputs/All_Fossils/Radarcharts.pdf/allfossils_clock3.pdf", width = 11.7, height = 8.3)
ggradar(
  all_data_clock3[], 
  values.radar = c("0", "2.52", "5.5"),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "bottom"
)
dev.off()

# RADARCHART FOSSILS JACKKNIFE WITH EMBIOPTERA AND ZORAPTERA AND THE 3 CLOCK MODELS
# One radarchart for each "interesting" node:
# - Grylloblattodea (1)
# - Mantophasmatodea (2)
# - Grylloblattodea+Mantophasmatodea crown (3)
# - Grylloblattodea+Mantophasmatoea stem (4)

# All Fossils
# Clock 1
ages_with_all_clock1
# Clock 2
ages_with_all_clock2
# Clock 3
ages_with_all_clock3

# WITHOUT CROWN PLECOPTERA CALIBRATION (No_1)
#Clock 1
# Data preparation clock 1 with
with_node1<-getMRCA(phy_no1_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no1_1$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no1_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no1_1$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no1_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no1_1$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no1_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no1_1$nodeAges[as.character(with_node4),1]
ages_with_no1_clock1<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 2
# Data preparation clock 2 with
with_node1<-getMRCA(phy_no1_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no1_2$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no1_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no1_2$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no1_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no1_2$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no1_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no1_2$nodeAges[as.character(with_node4),1]
ages_with_no1_clock2<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 3
# Data preparation clock 3 with
with_node1<-getMRCA(phy_no1_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no1_3$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no1_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no1_3$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no1_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no1_3$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no1_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no1_3$nodeAges[as.character(with_node4),1]
ages_with_no1_clock3<-c(with_data1,with_data2,with_data3,with_data4)


# WITHOUT CROWN ORTHOPTERA CALIBRATION (No_2)
#Clock 1
# Data preparation clock 1 with
with_node1<-getMRCA(phy_no2_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no2_1$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no2_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no2_1$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no2_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no2_1$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no2_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no2_1$nodeAges[as.character(with_node4),1]
ages_with_no2_clock1<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 2
# Data preparation clock 2 with
with_node1<-getMRCA(phy_no2_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no2_2$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no2_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no2_2$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no2_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no2_2$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no2_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no2_2$nodeAges[as.character(with_node4),1]
ages_with_no2_clock2<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 3
# Data preparation clock 3 with
with_node1<-getMRCA(phy_no2_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no2_3$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no2_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no2_3$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no2_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no2_3$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no2_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no2_3$nodeAges[as.character(with_node4),1]
ages_with_no2_clock3<-c(with_data1,with_data2,with_data3,with_data4)



# WITHOUT CROWN ISOPTERA CALIBRATION (No_3)
#Clock 1
# Data preparation clock 1 with
with_node1<-getMRCA(phy_no3_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no3_1$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no3_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no3_1$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no3_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no3_1$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no3_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no3_1$nodeAges[as.character(with_node4),1]
ages_with_no3_clock1<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 2
# Data preparation clock 2 with
with_node1<-getMRCA(phy_no3_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no3_2$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no3_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no3_2$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no3_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no3_2$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no3_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no3_2$nodeAges[as.character(with_node4),1]
ages_with_no3_clock2<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 3
# Data preparation clock 3 with
with_node1<-getMRCA(phy_no3_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no3_3$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no3_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no3_3$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no3_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no3_3$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no3_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no3_3$nodeAges[as.character(with_node4),1]
ages_with_no3_clock3<-c(with_data1,with_data2,with_data3,with_data4)

# WITHOUT CROWN DICTYOPTERA CALIBRATION (No_4)
#Clock 1
# Data preparation clock 1 with
with_node1<-getMRCA(phy_no4_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no4_1$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no4_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no4_1$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no4_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no4_1$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no4_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no4_1$nodeAges[as.character(with_node4),1]
ages_with_no4_clock1<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 2
# Data preparation clock 2 with
with_node1<-getMRCA(phy_no4_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no4_2$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no4_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no4_2$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no4_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no4_2$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no4_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no4_2$nodeAges[as.character(with_node4),1]
ages_with_no4_clock2<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 3
# Data preparation clock 3 with
with_node1<-getMRCA(phy_no4_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no4_3$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no4_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no4_3$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no4_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no4_3$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no4_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no4_3$nodeAges[as.character(with_node4),1]
ages_with_no4_clock3<-c(with_data1,with_data2,with_data3,with_data4)


# WITHOUT CROWN PHASMATODEA CALIBRATION (No_5)
#Clock 1
# Data preparation clock 1 with
with_node1<-getMRCA(phy_no5_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no5_1$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no5_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no5_1$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no5_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no5_1$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no5_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no5_1$nodeAges[as.character(with_node4),1]
ages_with_no5_clock1<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 2
# Data preparation clock 2 with
with_node1<-getMRCA(phy_no5_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no5_2$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no5_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no5_2$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no5_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no5_2$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no5_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no5_2$nodeAges[as.character(with_node4),1]
ages_with_no5_clock2<-c(with_data1,with_data2,with_data3,with_data4)

#Clock 3
# Data preparation clock 3 with
with_node1<-getMRCA(phy_no5_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data1<-phy_no5_3$nodeAges[as.character(with_node1),1]
with_node2<-getMRCA(phy_no5_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data2<-phy_no5_3$nodeAges[as.character(with_node2),1]
with_node3<-getMRCA(phy_no5_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data3<-phy_no5_3$nodeAges[as.character(with_node3),1]
with_node4<-getMRCA(phy_no5_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data4<-phy_no5_3$nodeAges[as.character(with_node4),1]
ages_with_no5_clock3<-c(with_data1,with_data2,with_data3,with_data4)


# GRYLLOBLATTODEA (1)

clock1<-c(ages_with_all_clock1[1],ages_with_no1_clock1[1],ages_with_no2_clock1[1],ages_with_no3_clock1[1],ages_with_no4_clock1[1],ages_with_no5_clock1[1])
clock2<-c(ages_with_all_clock2[1],ages_with_no1_clock2[1],ages_with_no2_clock2[1],ages_with_no3_clock2[1],ages_with_no4_clock2[1],ages_with_no5_clock2[1])
clock3<-c(ages_with_all_clock3[1],ages_with_no1_clock3[1],ages_with_no2_clock3[1],ages_with_no3_clock3[1],ages_with_no4_clock3[1],ages_with_no5_clock3[1])
Gryllo<-as.data.frame(rbind(clock1,clock2,clock3))
colnames(Gryllo)<-c("All Fossils","No 1","No 2","No 3","No 4","No 5")
Gryllo<-cbind(c("Clock1","Clock2","Clock3"),Gryllo)
colnames(Gryllo)<-c("Clock_model","All Fossils","1","2","3","4","5")

grylloplot<-ggradar(
  Gryllo[], 
  values.radar = c("", "", ""),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "none",
  axis.label.size = 3
) +
  ggtitle("Grylloblattodea Crown") + 
  theme(plot.title = element_text(hjust = 0.5,size=10))

# MANTOPHASMATODEA (2)
clock1<-c(ages_with_all_clock1[2],ages_with_no1_clock1[2],ages_with_no2_clock1[2],ages_with_no3_clock1[2],ages_with_no4_clock1[2],ages_with_no5_clock1[2])
clock2<-c(ages_with_all_clock2[2],ages_with_no1_clock2[2],ages_with_no2_clock2[2],ages_with_no3_clock2[2],ages_with_no4_clock2[2],ages_with_no5_clock2[2])
clock3<-c(ages_with_all_clock3[2],ages_with_no1_clock3[2],ages_with_no2_clock3[2],ages_with_no3_clock3[2],ages_with_no4_clock3[2],ages_with_no5_clock3[2])
Manto<-as.data.frame(rbind(clock1,clock2,clock3))
colnames(Manto)<-c("All Fossils","No 1","No 2","No 3","No 4","No 5")
Manto<-cbind(c("Clock1","Clock2","Clock3"),Manto)
colnames(Manto)<-c("Clock_model","All Fossils","1","2","3","4","5")

mantoplot<-ggradar(
  Manto[], 
  values.radar = c("", "", ""),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "none",
  axis.label.size = 3
  ) +
  ggtitle("Mantophasmatodea Crown") + 
  theme(plot.title = element_text(hjust = 0.5,size=10))

# GRYLLOBLATTODEA+MANTOPHASMATODEA CROWN (3)
clock1<-c(ages_with_all_clock1[3],ages_with_no1_clock1[3],ages_with_no2_clock1[3],ages_with_no3_clock1[3],ages_with_no4_clock1[3],ages_with_no5_clock1[3])
clock2<-c(ages_with_all_clock2[3],ages_with_no1_clock2[3],ages_with_no2_clock2[3],ages_with_no3_clock2[3],ages_with_no4_clock2[3],ages_with_no5_clock2[3])
clock3<-c(ages_with_all_clock3[3],ages_with_no1_clock3[3],ages_with_no2_clock3[3],ages_with_no3_clock3[3],ages_with_no4_clock3[3],ages_with_no5_clock3[3])
MantoGrylloCrown<-as.data.frame(rbind(clock1,clock2,clock3))
colnames(MantoGrylloCrown)<-c("All Fossils","No 1","No 2","No 3","No 4","No 5")
MantoGrylloCrown<-cbind(c("Clock1","Clock2","Clock3"),MantoGrylloCrown)
colnames(MantoGrylloCrown)<-c("Clock_model","All Fossils","1","2","3","4","5")

gryllomantocrown<-ggradar(
  MantoGrylloCrown[], 
  values.radar = c("", "", ""),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "none",
  axis.label.size = 3
  ) +
  ggtitle("Xenonomia Crown") + 
  theme(plot.title = element_text(hjust = 0.5,size=10))

# GRYLLOBLATTODEA+MANTOPHASMATODEA STEM (4)

clock1<-c(ages_with_all_clock1[4],ages_with_no1_clock1[4],ages_with_no2_clock1[4],ages_with_no3_clock1[4],ages_with_no4_clock1[4],ages_with_no5_clock1[4])
clock2<-c(ages_with_all_clock2[4],ages_with_no1_clock2[4],ages_with_no2_clock2[4],ages_with_no3_clock2[4],ages_with_no4_clock2[4],ages_with_no5_clock2[4])
clock3<-c(ages_with_all_clock3[4],ages_with_no1_clock3[4],ages_with_no2_clock3[4],ages_with_no3_clock3[4],ages_with_no4_clock3[4],ages_with_no5_clock3[4])
MantoGrylloStem<-as.data.frame(rbind(clock1,clock2,clock3))
colnames(MantoGrylloStem)<-c("All Fossils","No 1","No 2","No 3","No 4","No 5")
MantoGrylloStem<-cbind(c("Clock1","Clock2","Clock3"),MantoGrylloStem)
colnames(MantoGrylloStem)<-c("Clock_model","All Fossils","1","2","3","4","5")

gryllomantostem <- ggradar(
  MantoGrylloStem[], 
  values.radar = c("", "", ""),
  grid.min = 0, grid.mid = 2.52, grid.max = 5.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "none",
  axis.label.size = 3
) +
  ggtitle("Xenonomia Stem") + 
  theme(plot.title = element_text(hjust = 0.5,size=10))

pdf("mcmctree_outputs/Radarcharts_Jackknife/Jackknife_plot.pdf", width = 11.7, height = 8.3)
plot_grid(grylloplot,mantoplot,gryllomantocrown,gryllomantostem)
dev.off()


# RADARCHARTS COMPARING NUCLEOTIDES (with/wout) AND AAs (with)

# CLOCK 1

# Data already generated for with/wout with nt

# Data preparation clock1 aa
AA_node_all1<-getMRCA(phy_AA_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
AA_data_all1<-phy_AA_all_1$nodeAges[as.character(AA_node_all1),1]
AA_node_all2<-getMRCA(phy_AA_all_1$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all2<-phy_AA_all_1$nodeAges[as.character(AA_node_all2),1]
AA_node_all3<-getMRCA(phy_AA_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all3<-phy_AA_all_1$nodeAges[as.character(AA_node_all3),1]
AA_node_all4<-getMRCA(phy_AA_all_1$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
AA_data_all4<-phy_AA_all_1$nodeAges[as.character(AA_node_all4),1]
ages_AA_all_clock1<-c(AA_data_all1,AA_data_all2,AA_data_all3,AA_data_all4)

# Clock1 radarchart
all_data_clock1<-as.data.frame(rbind(ages_with_all_clock1,ages_wout_all_clock1,ages_AA_all_clock1))
colnames(all_data_clock1)<-c("Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem")
all_data_clock1<-cbind(c("nt_with","nt_without","AA_with"),all_data_clock1)
colnames(all_data_clock1)<-c("group","Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem" )

pdf("mcmctree_outputs/All_Fossils_AAs/Radarcharts.pdf/allfossils_clock1.pdf", width = 11.7, height = 8.3)
ggradar(
  all_data_clock1[], 
  values.radar = c("0", "2.52", "5.5"),
  grid.min = 0, grid.mid = 2.52, grid.max = 6.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "bottom"
)
dev.off()


# CLOCK 2

# Data already generated for with/wout with nt

# Data preparation clock2 AA
AA_node_all1<-getMRCA(phy_AA_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
AA_data_all1<-phy_AA_all_2$nodeAges[as.character(AA_node_all1),1]
AA_node_all2<-getMRCA(phy_AA_all_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all2<-phy_AA_all_2$nodeAges[as.character(AA_node_all2),1]
AA_node_all3<-getMRCA(phy_AA_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all3<-phy_AA_all_2$nodeAges[as.character(AA_node_all3),1]
AA_node_all4<-getMRCA(phy_AA_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
AA_data_all4<-phy_AA_all_2$nodeAges[as.character(AA_node_all4),1]
ages_AA_all_clock2<-c(AA_data_all1,AA_data_all2,AA_data_all3,AA_data_all4)


# clock2 radarchart
all_data_clock2<-as.data.frame(rbind(ages_with_all_clock2,ages_wout_all_clock1,ages_AA_all_clock2))
colnames(all_data_clock2)<-c("Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem")
all_data_clock2<-cbind(c("nt_with","nt_without","AA_with"),all_data_clock2)
colnames(all_data_clock2)<-c("group","Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem" )

pdf("mcmctree_outputs/All_Fossils_AAs/Radarcharts.pdf/allfossils_clock2.pdf", width = 11.7, height = 8.3)
ggradar(
  all_data_clock2[], 
  values.radar = c("0", "2.52", "5.5"),
  grid.min = 0, grid.mid = 2.52, grid.max = 6.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "bottom"
)
dev.off()

# CLOCK 3

# Data already generated for with/wout with nt

# Data preparation clock2 AA
AA_node_all1<-getMRCA(phy_AA_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
AA_data_all1<-phy_AA_all_2$nodeAges[as.character(AA_node_all1),1]
AA_node_all2<-getMRCA(phy_AA_all_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all2<-phy_AA_all_2$nodeAges[as.character(AA_node_all2),1]
AA_node_all3<-getMRCA(phy_AA_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all3<-phy_AA_all_2$nodeAges[as.character(AA_node_all3),1]
AA_node_all4<-getMRCA(phy_AA_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
AA_data_all4<-phy_AA_all_2$nodeAges[as.character(AA_node_all4),1]
ages_AA_all_clock2<-c(AA_data_all1,AA_data_all2,AA_data_all3,AA_data_all4)



# Data preparation clock3 AA
AA_node_all1<-getMRCA(phy_AA_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
AA_data_all1<-phy_AA_all_3$nodeAges[as.character(AA_node_all1),1]
AA_node_all2<-getMRCA(phy_AA_all_3$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all2<-phy_AA_all_3$nodeAges[as.character(AA_node_all2),1]
AA_node_all3<-getMRCA(phy_AA_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
AA_data_all3<-phy_AA_all_3$nodeAges[as.character(AA_node_all3),1]
AA_node_all4<-getMRCA(phy_AA_all_3$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
AA_data_all4<-phy_AA_all_3$nodeAges[as.character(AA_node_all4),1]
ages_AA_all_clock3<-c(AA_data_all1,AA_data_all2,AA_data_all3,AA_data_all4)

# clock3 radarchart
all_data_clock3<-as.data.frame(rbind(ages_with_all_clock3,ages_wout_all_clock3,ages_AA_all_clock3))
colnames(all_data_clock3)<-c("Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem")
all_data_clock3<-cbind(c("nt_with","nt_without","AA_with"),all_data_clock3)
colnames(all_data_clock3)<-c("group","Grylloblattodea","Mantophasmatodea","Gryllo+Manto Crown","Gryllo+Manto Stem" )

pdf("mcmctree_outputs/All_Fossils_AAs/Radarcharts.pdf/allfossils_clock3.pdf", width = 11.7, height = 8.3)
ggradar(
  all_data_clock3[], 
  values.radar = c("0", "2.52", "5.5"),
  grid.min = 0, grid.mid = 2.52, grid.max = 6.5,
  # Polygons
  group.line.width = 1, 
  group.point.size = 4,
  group.colours = c("#552583", "#FDB927","darkolivegreen4"),
  # Background and grid lines
  background.circle.colour = "white",
  gridline.mid.colour = "firebrick1",
  legend.position = "bottom"
)
dev.off()


# PLOT COMPARING DIFFERENT DATASETS WITH CLOCK 2

library(ggplot2)
library(dplyr)
library(cowplot)

# Dataset preparation
# Data preparation clock 2 with
with_node_all1<-getMRCA(phy_with_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
with_data_all1<-phy_with_all_2$nodeAges[as.character(with_node_all1),1]
with_node_all2<-getMRCA(phy_with_all_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all2<-phy_with_all_2$nodeAges[as.character(with_node_all2),1]
with_node_all3<-getMRCA(phy_with_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
with_data_all3<-phy_with_all_2$nodeAges[as.character(with_node_all3),1]
with_node_all4<-getMRCA(phy_with_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Aposthonia_japonica","Eosembia_sp","Aposthonia_borneensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
with_data_all4<-phy_with_all_2$nodeAges[as.character(with_node_all4),1]
ages_with_all_clock1<-c(with_data_all1,with_data_all2,with_data_all3,with_data_all4)

# Data preparation clock2 wout
wout_node_all1<-getMRCA(phy_wout_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta"))
wout_data_all1<-phy_wout_all_2$nodeAges[as.character(wout_node_all1),1]
wout_node_all2<-getMRCA(phy_wout_all_2$apePhy,c("Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all2<-phy_wout_all_2$nodeAges[as.character(wout_node_all2),1]
wout_node_all3<-getMRCA(phy_wout_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis"))
wout_data_all3<-phy_wout_all_2$nodeAges[as.character(wout_node_all3),1]
wout_node_all4<-getMRCA(phy_wout_all_2$apePhy,c("Galloisiana_yusai","Grylloblatta_sculleni","Grylloblatta_bifratrilecta","Tanzaniophasma_sp","Mantophasma_sp","Sclerophasma_paresisensis","Timema_californicum","Carausius_morosus","Cryptophyllium_westwoodi","Phyllium_tibetense","Orthomeria_smaragdinum","Nanhuaphasma_hamicercum","Peruphasma_schultei","Sipyloidea_sipylus","Bacillus_rossius","Heteropteryx_dilatata","Ramulus_irregulariterdentatus","Extatosoma_tiaratum"))
wout_data_all4<-phy_wout_all_2$nodeAges[as.character(wout_node_all4),1]
ages_wout_all_clock2<-c(wout_data_all1,wout_data_all2,wout_data_all3,wout_data_all4)

date<-rbind(c("Grylloblattodea","nt_with",phy_with_all_1$nodeAges[as.character(with_node_all1),]),c("Grylloblattodea","nt_wout",phy_wout_all_1$nodeAges[as.character(wout_node_all1),]),c("Grylloblattodea","AA_with",phy_AA_all_1$nodeAges[as.character(AA_node_all1),]))
date<-rbind(date,c("Mantophasmatodea","nt_with",phy_with_all_2$nodeAges[as.character(with_node_all2),]),c("Mantophasmatodea","nt_wout",phy_wout_all_2$nodeAges[as.character(wout_node_all2),]),c("Mantophasmatodea","AA_with",phy_AA_all_2$nodeAges[as.character(AA_node_all2),]))
date<-rbind(date,c("Xenonomia Crown","nt_with",phy_with_all_2$nodeAges[as.character(with_node_all3),]),c("Xenonomia Crown","nt_wout",phy_wout_all_2$nodeAges[as.character(wout_node_all3),]),c("Xenonomia Crown","AA_with",phy_AA_all_2$nodeAges[as.character(AA_node_all3),]))
date<-rbind(date,c("Xenonomia Stem","nt_with",phy_with_all_2$nodeAges[as.character(with_node_all4),]),c("Xenonomia Stem","nt_wout",phy_wout_all_2$nodeAges[as.character(wout_node_all4),]),c("Xenonomia Stem","AA_with",phy_AA_all_2$nodeAges[as.character(AA_node_all4),]))
date<-as.data.frame(date)
colnames(date)<-c("Group","Data","Mean","Lower_bound","Higher_bound")
date[, 3:5] <- lapply(date[, 3:5], as.numeric)
date[, 3:5] <- lapply(date[, 3:5], function(x) as.numeric(gsub(",", ".", x, fixed = TRUE)) * 100)

# Assuming "date" is your dataframe

pdf("mcmctree_outputs/All_Fossils_AAs/dataset_sensitivity_test_plot.pdf", width = 11.7, height = 8.3)

ggplot(date, aes(x = as.factor(Group), y = Mean, colour = Data)) +
  ggtitle("Comparison of the dates for the groups of interest") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)) +
  theme_bw() +
  xlab("") +
  ylab("Dating (My)") +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_pointrange(aes(ymin = Lower_bound, ymax = Higher_bound), position = position_dodge(width = 0.5), linewidth = 1.3, alpha = 0.5) +
  scale_color_manual(values = c("#552583", "#FDB927","darkolivegreen4")) +
  geom_hline(yintercept = 252, linetype = "dashed", color = "firebrick1") +
  ggplot2::annotate("text", x = 3.5, y = 252, label = "Permian/Triassic", vjust = -1.5, color = "firebrick1") +
  geom_hline(yintercept = 201, linetype = "dashed", color = "firebrick1") +
  ggplot2::annotate("text", x = 3.5, y = 201, label = "Triassic/Jurassic", vjust = -1.5, color = "firebrick1")

dev.off()


# Comparison of dates with literature

pdf("mcmctree_outputs/Dates_comparison.pdf", width = 11.7, height = 8.3)

ggplot(Dates_comparison, aes(x = as.factor(Group), y = Mean, colour = Publication)) +
  ggtitle("Comparison of the dates with literature") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)) +
  theme_bw() +
  xlab("") +
  ylab("Dating (My)") +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_pointrange(aes(ymin = Lower_bound, ymax = Higher_bound), position = position_dodge(width = 0.5), linewidth = 1.3, alpha = 0.5) +
  scale_color_manual(values = c("#552583", "#FDB927","darkolivegreen4","lightblue","salmon1")) +
  geom_hline(yintercept = 252, linetype = "dashed", color = "firebrick1") +
  ggplot2::annotate("text", x = 3.5, y = 252, label = "Permian/Triassic", vjust = -1.5, color = "firebrick1") +
  geom_hline(yintercept = 201, linetype = "dashed", color = "firebrick1") +
  ggplot2::annotate("text", x = 3.5, y = 201, label = "Triassic/Jurassic", vjust = -1.5, color = "firebrick1")

dev.off()

# Figure 1

# Fossils occurency
grylloblattodea_occ<-read.table("./grylloblattodea_occ.txt", sep=",", header = T)
grylloblattodea_occ<-cbind(rep("Grylloblattodea",length(grylloblattodea_occ[1])),grylloblattodea_occ)
colnames(grylloblattodea_occ)[1]<-"Group"
mantophasmatodea_occ<-read.table("./mantophasmatodea_occ.txt", sep=",", header = T,stringsAsFactors = F)
mantophasmatodea_occ<-cbind(rep("Mantophasmatodea",length(mantophasmatodea_occ[1])),mantophasmatodea_occ)
colnames(mantophasmatodea_occ)[1]<-"Group"

fossils<-rbind(grylloblattodea_occ,mantophasmatodea_occ)

my_colors <- c("#008080", "#B87333")
plot2 <- ggplot(fossils, aes(x = max_ma, fill = Group)) +
  geom_histogram(adjust = 1.5, position = "identity", bins = 50) +
  theme_bw() +
  scale_fill_manual(values = my_colors) +  # Set fill colors
  scale_x_reverse() +
  xlim(520, 0) +
  geom_vline(xintercept = 201.3, linetype = 2, col = "royalblue1") +
  geom_vline(xintercept = 252, linetype = 2, col = "firebrick1")

# Plot the tree near the fossil occurency
pdf("mcmctree_outputs/Figure_1.pdf", width = 11.7, height = 8.3)
grid.arrange(MCMC.tree.plot(phy = phy_with_all_2, analysis.type = "MCMCtree",
                            MCMC.chain = NULL, node.ages = NULL, directory.files = NULL,
                            plot.type = "phylogram", build.tree = FALSE, node.method = "bar",
                            all.nodes = NULL, add.time.scale = TRUE, add.abs.time = TRUE,
                            scale.res = c("Period"), label.timescale.names = FALSE,
                            time.correction = 100, col.age = ggplot2::alpha("#FDB927", 0.5), tip.lengths = FALSE,
                            density.col = "#00000050", density.border.col = "#00000080",
                            cex.tips = 0.5, show.tip.label = TRUE, col.tree = "black",
                            tip.color = "black", lwd.bar = 4, grey.bars = TRUE, cex.age = 0.7,
                            cex.labels = 0.7, cex.names = 1, relative.height = 0.08,
                            tip.bar.col = "#ff000050", burn.in = 0.25,
                            distribution.height = 0.8, abs.age.mgp = c(3, 0.35, 0),
                            abs.age.lwd.ticks = 0.7, abs.age.lwd = 0, tck.abs.age = -0.01,
                            abs.age.line = -0.4, pos.age = NULL, n.runs = 2,
                            ladderize.tree = TRUE)
             , plot2, ncol = 1, heights = c(5, 1))
dev.off()

# Figure 2
library(readr)
Dates_comparison <- read_delim("Dates_comparison.csv", 
delim = ";", escape_double = FALSE, col_types = cols(Mean = col_number(), 
Lower_bound = col_number(), Higher_bound = col_number()), 
trim_ws = TRUE)

jack <- plot_grid(grylloplot,mantoplot,gryllomantocrown,gryllomantostem)

dataset <- ggplot(date, aes(x = as.factor(Group), y = Mean, colour = Data, shape = Data)) +
  ggtitle("Comparison of the dates for the groups of interest") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)) +
  theme_bw() +
  xlab("") +
  ylab("Dating (My)") +
  geom_point(position = position_dodge(width = 0.5), size = 4) +  # Adjust size as needed
  geom_pointrange(aes(ymin = Lower_bound, ymax = Higher_bound), position = position_dodge(width = 0.5), linewidth = 1.3, alpha = 0.5) +
  scale_color_manual(values = c("black", "grey50", "grey60")) +
  scale_shape_manual(values = c(16, 17, 18)) +  # 16 = circle, 17 = triangle, 18 = diamond
  geom_hline(yintercept = 252, linetype = "dashed", color = "firebrick1") +
  ggplot2::annotate("text", x = 3.5, y = 252, label = "Permian/Triassic", vjust = -1.5, color = "firebrick1", cex = 2.2) +
  geom_hline(yintercept = 201.3, linetype = "dashed", color = "royalblue1") +
  ggplot2::annotate("text", x = 3.5, y = 201.3, label = "Triassic/Jurassic", vjust = -1.5, color = "royalblue1", cex = 2.2) 

literature <- ggplot(Dates_comparison, aes(x = as.factor(Group), y = Mean, colour = Publication)) +
  ggtitle("Comparison of the dates with literature") +
  theme(plot.title = element_text(hjust = 0.5), axis.text.x = element_text(angle = 45, vjust = 0.5, hjust = 1)) +
  theme_bw() +
  xlab("") +
  ylab("Dating (My)") +
  geom_point(position = position_dodge(width = 0.5)) +
  geom_pointrange(aes(ymin = Lower_bound, ymax = Higher_bound), position = position_dodge(width = 0.5), linewidth = 1.3, alpha = 0.5) +
  scale_color_manual(values = c("#552583", "#FDB927","darkolivegreen4","lightblue","salmon1")) +
  geom_hline(yintercept = 252, linetype = "dashed", color = "firebrick1") +
  ggplot2::annotate("text", x = 3.5, y = 252, label = "Permian/Triassic", vjust = -1.5, color = "firebrick1",cex=2.2) +
  geom_hline(yintercept = 201.3, linetype = "dashed", color = "royalblue1") +
  ggplot2::annotate("text", x = 3.5, y = 201.3, label = "Triassic/Jurassic", vjust = -1.5, color = "royalblue1",cex=2.2) 

pdf("mcmctree_outputs/Figure_2.pdf", width = 8.3, height = 11.7)
tmp <- plot_grid(dataset,literature, ncol=1,rel_heights = c(1, 1),axis="lr",align="hv", labels=c("B","C"))
plot_grid(jack,tmp, ncol=1,rel_heights = c(3,2), labels=c("A",""))
dev.off()
