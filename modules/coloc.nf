#!/usr/bin/env nextflow

process COLOC {
  conda '/ssu/bsssu/conda_envs_bsssu/flanders_r'

  // Define input
  input:
    tuple file(annData), val(coloc_pairs_by_batches)
  
  // Define output
  output:
    path "${params.coloc_id}_colocalization.table.all.tsv", emit:colocalization_table_all_by_chunk

  // Tag the process with the study ID    
  tag "${params.coloc_id}_coloc"

// Define the shell script to execute
  shell:
    '''
    Rscript --version
    Rscript --vanilla !{projectDir}/bin/s01_coloc.R \
        --annData !{annData} \
        --coloc_guide_table !{coloc_pairs_by_batches} \
        --coloc_id !{params.coloc_id}
    '''
}
