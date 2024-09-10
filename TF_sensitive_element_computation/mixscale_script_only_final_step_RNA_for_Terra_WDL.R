R.version
#install.packages("BiocManager")
print("install summarized experiment")
install.packages("SummarizedExperiment")
print("done installing summarized experiment")
library("BiocManager")
install.packages("Seurat")
install.packages("PMA")
install.packages("protoclust")
BiocManager::install("glmGamPoi")
remotes::install_version("SeuratObject", "4.1.4", repos = c("https://satijalab.r-universe.dev", getOption("repos")))
remotes::install_version("Seurat", "4.4.0", repos = c("https://satijalab.r-universe.dev", getOption("repos")))
print("done with dependencies!!!")

print("install Signac")
setRepositories(ind=1:3)
install.packages("Signac")
print("done with Signac")

install.packages("devtools")
# Note: if running on ATAC, install modified branch here (will be added to github repo soon – stay tuned)
devtools::install_github("longmanz/Mixscale")
print("installed mixscale")

library("Mixscale")
print("loaded Mixscale")
library(Seurat)
print("loaded Seurat")

# External arguments
args <- commandArgs(trailingOnly = TRUE)
seurat_object_path <- args[1]
TF = args[2]
print(TF)

seurat_obj_mixscale_separate_guides_AAVS1_1_reference=readRDS(seurat_object_path)
#seurat_obj_mixscale_separate_guides_AAVS1_1_reference=FindVariableFeatures(seurat_obj_mixscale_separate_guides_AAVS1_1_reference,nfeatures = 5000)
#seurat_obj_mixscale_separate_guides_AAVS1_1_reference=ScaleData(seurat_obj_mixscale_separate_guides_AAVS1_1_reference)
# calculate Perturbation signatures 
#seurat_obj_mixscale_separate_guides_AAVS1_1_reference <- CalcPerturbSig(
#    object = seurat_obj_mixscale_separate_guides_AAVS1_1_reference, 
#    assay = "ATAC", 
#    slot = "data", 
#    gd.class ="perturbation_name", 
#    nt.cell.class = "AAVS1_1", 
#    reduction = "lsi", 
#    ndims = 20, 
#    num.neighbors = 20, 
#    new.assay.name = "PRTB")
print("starting RunMixscale")
# Mixscale
#seurat_obj_mixscale_separate_guides_AAVS1_1_reference = RunMixscale(
#    object = seurat_obj_mixscale_separate_guides_AAVS1_1_reference, 
#    assay = "PRTB", 
#    slot = "scale.data", 
#    labels = "perturbation_name", 
#    nt.class.name = "AAVS1_1", 
#    min.de.genes = 5, 
#    logfc.threshold = 0.2,
#    de.assay = "ATAC",
#    max.de.genes = 100, 
#    new.class.name = "mixscale_score", 
#    fine.mode = F, 
#    verbose = TRUE)

print("starting last step")
#modified repo would be installed here for ATAC
#detach("package:Mixscale", unload=TRUE)
#devtools::install_github("",auth_token = '')
library("Mixscale")
de_res_seurat_obj_mixscale_separate_guides_AAVS1_1_reference = Run_wmvRegDE(object = seurat_obj_mixscale_separate_guides_AAVS1_1_reference, assay = "RNA", slot = "counts",
                      labels = "gene", nt.class.name = "negative_control", 
                      PRTB_list = TF,
                      logfc.threshold = 0,
                      total_ct_labels = 'nCount_RNA', 
                      min.pct=0)

saveRDS(de_res_seurat_obj_mixscale_separate_guides_AAVS1_1_reference,"mixscale_results.RDS")