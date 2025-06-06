## 🚀  `flanders_nf_coloc`: Scalable Colocalization with Nextflow

This pipeline wraps the `flanders` R package to perform fast and scalable colocalization analysis on precomputed AnnData objects.

---

### 🧬 Step-by-Step Guide

#### 1. Start from an existing AnnData object (produced by `flanders::finemap2anndata()` or `nf-flanders` nextflow pipeline)

```bash
conda activate /ssu/bsssu/conda_envs_bsssu/flanders_r
```

```r
library(zellkonverter)
library(SingleCellExperiment)
library(flanders)

# Load your AnnData
ad <- readH5AD("/path/bla/my_anndata.h5ad", reader = "R")

# Generate coloc input table
coloc_input <- anndata2coloc_input(ad)

# Save it to a file
data.table::fwrite(coloc_input, "/path/bla/my_coloc_guide.csv")
```

Now you have:
- ✅ `/path/bla/my_anndata.h5ad`
- ✅ `/path/bla/my_coloc_guide.csv`

These are the two required inputs for the Nextflow pipeline.

---

#### 2. Clone the pipeline
```bash
git clone git@github.com:Biostatistics-Unit-HT/flanders_nf_coloc.git
cd flanders_nf_coloc
```

---

#### 3. Modify the submission script

Edit `hcoloc_anndata_example.sh` by specifying `--annData` and `coloc_pairwise_guide_table` paths to reflect your input paths and desired ID:

```bash
#!/bin/bash
#SBATCH --job-name nf-hcoloc
#SBATCH --output nf-hcoloc_%A.log
#SBATCH --partition cpuq
#SBATCH --cpus-per-task 1
#SBATCH --mem 8G
#SBATCH --time 20-00:00:00

module load nextflow/23.10.0

nextflow run flanders_nf_coloc/main.nf \
    --annData "/path/bla/my_anndata.h5ad" \
    --coloc_pairwise_guide_table "/path/bla/my_coloc_guide.csv" \
    --coloc_id my_output_id \
    -resume
```

---

#### 4. Submit the job

```bash
sbatch hcoloc_anndata_example.sh
```

This will produce:
- `results/my_output_id_coloc.tsv` with all pairwise colocalization results.

---

### 💡 Notes

For more information, see the upstream [`flanders`](https://github.com/Biostatistics-Unit-HT/flanders_r) package.
