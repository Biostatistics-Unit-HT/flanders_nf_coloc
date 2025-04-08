#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

module load nextflow/24.10.4 #singularity/3.8.5

nextflow run hcoloc_anndata/main.nf \
--annData "/group/pirastu/prj_014_huvec_coloc/hcoloc/tiledb/results/coloc/2025_04_02_input/cardinal_UKBB_cis_finemapping_full_020425_Sodbo_fixed.h5ad" \
--coloc_pairwise_guide_table "/group/pirastu/prj_014_huvec_coloc/hcoloc/tiledb/results/coloc/2025_04_02_input/cardinal_UKBB_cis_finemapping_full_020425_Sodbo_fixed.h5ad_coloc_mirror_input" \
--pph3 0.75 \
--pph4 0.75 \
--coloc_id test \
-resume
