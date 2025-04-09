#!/usr/bin/env nextflow

process PublishResults {
    publishDir "results/",
        mode: "copy",
        pattern: "colocalization_table_all_merged.txt",
        saveAs: { filename -> "${params.coloc_id}_${filename}" }
    
    input:
        // Expects the merged results file as input from the workflow
        path merged_file

    output:
        // Declare the file to be published
        path "colocalization_table_all_merged.txt"

    script:
    """
    # Do nothing. publishDir will do everything I need
    """
}