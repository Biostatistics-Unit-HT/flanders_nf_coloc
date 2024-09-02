#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

#module load nextflow/23.10.0 #singularity/3.8.5

nextflow run hcoloc_anndata/main.nf \
--annData "/Users/sodbo.sharapov/OneDrive - Htechnopole/00_Sodbo_Projects/anndata/data/HUVEC_chr22_combined_credible_sets_NEW.h5ad" \
--coloc_pairwise_guide_table "/Users/sodbo.sharapov/OneDrive - Htechnopole/00_Sodbo_Projects/anndata/data/coloc_duie_table.csv" \
--pph3 0.75 \
--pph4 0.75 \
--coloc_id test \
--results_path "/Users/sodbo.sharapov/OneDrive - Htechnopole/00_Sodbo_Projects/anndata/output" \
-resume
