#!/usr/bin/env nextflow

// Using DSL-2
nextflow.enable.dsl=2

// Syntax for defining a process
process template {
    // Docker/Singularity container used to run the process
    container "${params.container__template}"
    // Write output files to the output directory
    publishDir "${params.output}", mode: "copy", overwrite: true
    
    input:
    // Input from a single file
    path input_file

    output:
    // Capture all output files
    path "*"

    script:
    template 'template.sh'

}
