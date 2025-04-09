#!/usr/bin/env nextflow
nextflow.enable.dsl=2

// Include the COLOC module and the PublishResults module
include { COLOC } from "$projectDir/modules/coloc"
include { PublishResults } from "$projectDir/modules/PublishResults.nf"

workflow {
    // Define input channels
    coloc_pairwise_guide_table = Channel.fromPath(params.coloc_pairwise_guide_table)
    annData = Channel.fromPath(params.annData)

    // Split coloc_pairwise_guide_table into batches (chunk size specified here, e.g. 500)
    coloc_pairs_by_batches = coloc_pairwise_guide_table
        .splitText(by: 500, keepHeader: true, file: true)

    // Run the COLOC process on the combined channel
    COLOC(annData.combine(coloc_pairs_by_batches))

    // Collect all COLOC batch outputs into a single merged file
    coloc_results_all = COLOC.out.colocalization_table_all_by_chunk
        .collectFile(name: 'colocalization_table_all_merged.txt', keepHeader: true)

    // Pass the merged file channel to the PublishResults process module
    PublishResults(coloc_results_all)
}