# Code to analyze Perturb-multiome experiments
Please navigate to https://github.com/jmartinrufino/perturb_multiome/ for Perturb-multiome scripts. This repository contains code to analyze Perturb-multiome experiments. Below, you can find the title of the corresponding notebook or script in this GitHub repository next to a brief explanation of its purpose.<br /><br />

1. GITHUB_processing_RNA_object (https://github.com/jmartinrufino/perturb_multiome/blob/main/GITHUB_processing_RNA_object.ipynb): first notebook to process the output from Cellranger.<br /><br />
2. GITHUB_processing_perturb_multiome_object (https://github.com/jmartinrufino/perturb_multiome/blob/main/GITHUB_processing_perturb_multiome_object.ipynb): second notebook to prepare the final single-cell object.<br /><br />
3. GITHUB_RNA_ATAC_CCA_UMAPs (https://github.com/jmartinrufino/perturb_multiome/blob/main/GITHUB_RNA_ATAC_CCA_UMAPs.ipynb): contains code to reproduce figure 1C and supplementary figure S1I<br /><br />
4. TF_sensitive_element_computation (https://github.com/jmartinrufino/perturb_multiome/tree/main/TF_sensitive_element_computation)<br />
-4a. GITHUB_TF_sensitive_element_computation: contains code to perform the first step of TF-sensitive element computation and reproduce Figure 2A<br />
-4b. R script for WDL target computation. This can be run using [terra.bio](https://terra.bio/) using the wdl script from step 4c<br /><br />
-4c. WDL_RNA: WDL code to run the prior script, 4b, as a workflow in [terra.bio](https://terra.bio/). You need to update /path/to/mixscale_script_only_final_step_RNA_for_Terra_WDL.R to the bucket path where you place that script<br /><br />
5. GITHUB_Figure2_B_C_D (https://github.com/jmartinrufino/perturb_multiome/blob/main/GITHUB_Figure2_B_C_D.ipynb): reproduces figure 2B, C, D<br /><br />
6. GITHUB_generating_QC_plots (https://github.com/jmartinrufino/perturb_multiome/blob/main/GITHUB_generating_QC_plots.ipynb): reproduces multiple panels from supplementary figure S2<br /><br />
7. figR_script_by_target.R (https://github.com/jmartinrufino/perturb_multiome/blob/main/figR_script_by_target.R): script to compute correlations<br /><br />
8. LDSC folder (https://github.com/jmartinrufino/perturb_multiome/tree/main/LDSC), contains the following files:<br />
-8a. GITHUB_LD_regression_first_step
-8b. GITHUB_LD_regression: contains the code to run the first part of LDSC regression for overlapping features and reproduce figure 4D and S5D. <br />
-8c. WDL_LDSC: the WDL used to run the second part of LDSC regression on genomic features of choice. <br />
9. GITHUB_fraction_heritability (https://github.com/jmartinrufino/perturb_multiome/blob/main/GITHUB_fraction_heritability.ipynb): contains code to reproduce figure S5A<br />


Coming soon: <br /><br />
-Publicly available workflows in Terra to run the WDLs<br />
-Modified mixscale script to run on ATAC<br />
