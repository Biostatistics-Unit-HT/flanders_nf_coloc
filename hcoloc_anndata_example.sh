#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

module load nextflow/24.10.4 #singularity/3.8.5

nextflow run main.nf \
--annData "/path/to/your/anndata" \
--coloc_pairwise_guide_table "/path/to/your/anndata_coloc_input" \
--coloc_id test \
-resume
