#!/usr/bin/env nextflow

nextflow.enable.dsl=2 // specify the Domain Specific Language version to be used in the Nextflow script

// Source all processes
include {COLOC} from "$projectDir/modules/coloc"
//include {IDENTFY_REG_MODULES} from "$projectDir/modules/identify_reg_modules"

// Need to specify here the chunck size! Rather than hardcode it the channel

// Define the main workflow
workflow {

// Define a channel for each process

// Define input channel for identifying overlapping cs among submitted conditional datasets
  coloc_pairwise_guide_table = Channel.fromPath(params.coloc_pairwise_guide_table)
  
  annData = Channel.fromPath(params.annData)

  // Define input channel for performing pair-wise colocalisation analysis (in batches)
  coloc_pairs_by_batches = coloc_pairwise_guide_table
    .splitText(by:100, keepHeader:true, file:true) //// can the batch size not be hardcoded??

  // Run COLOC process on coloc_pairs_by_batches channel
  COLOC(annData.combine(coloc_pairs_by_batches))

  // Define input channel for identifying regulatory modules - collect all tables (coloc performed in batches of n pairwise tests)
  coloc_results_all = COLOC.out.colocalization_table_all_by_chunk
    .collectFile(name: 'colocalization_table_all_merged.txt', keepHeader: true)

  // Run COLOC process on coloc_pairs_by_batches channel
  //IDENTFY_REG_MODULES(coloc_results_all)
  
}


