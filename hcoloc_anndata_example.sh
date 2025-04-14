#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

module load nextflow/24.10.4 #singularity/3.8.5

nextflow run flanders_nf_coloc/main.nf \
	--annData "/ssu/bsssu/cardinal_finemap_coloc/anndata/finngen_OT_credset_99_Sodbofixed_2025_04_09.h5ad" \
	--coloc_pairwise_guide_table "/group/pirastu/prj_032_fingenn_coloc/20250409_fingenn_coloc_input.csv" \
	--coloc_id fingenn_sce \
	-resume
