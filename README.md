# pleisol

```bash
#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

module load nextflow/23.10.0 #singularity/3.8.5

nextflow run nf-hcoloc_anndata/main.nf \
  --inputFileList all_cond_datasets_cs_example.tsv \
  --pph3 0.75 \
  --pph4 0.75 \
  --coloc_id test \
  --results_path /path/to/results/folder/ \
  -profile ht_cluster -resume
```
