# flandeRs

## create conda environment

mamba create -p /ssu/bsssu/conda_envs_bsssu/flanders_r_test \
    -c conda-forge -c bioconda -c R \
    r-base=4.4 \
    bioconductor-singlecellexperiment=1.28.0 \
    bioconductor-zellkonverter=1.16.0 \
    bioconductor-scrnaseq=2.20.0 \
    r-susier=0.12.35 \
    r-coloc=5.2.3 \
    r-data.table=1.17.0 \
    r-dplyr=1.1.4 \
    r-anndata=0.7.5.6 \
    r-matrix=1.7_3 \
    r-optparse=1.7.5

```bash
#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

module load nextflow/23.10.0 #singularity/3.8.5

nextflow run flanders_nf_coloc/main.nf \
        --annData "/ssu/bsssu/cardinal_finemap_coloc/anndata/finngen_OT_credset_99_Sodbofixed_2025_04_09.h5ad" \
        --coloc_pairwise_guide_table "/group/pirastu/prj_032_fingenn_coloc/20250409_fingenn_coloc_input.csv" \
        --coloc_id fingenn_sce \
        -resume
```
