#!/usr/bin/env nextflow

// All of the default parameters are being set in `nextflow.config`

// Import the process
include { template } from './modules/template'


// Function which prints help message text
def helpMessage() {
    log.info"""
Usage:

nextflow run WORKFLOW <ARGUMENTS>

Required Arguments:

  Input Data:
  --input_folder    Folder containing all input files

  Output Location:
  --output          Folder for output files

    """.stripIndent()
}


// Main workflow
workflow {

    // Show help message if the user specifies the --help flag at runtime
    // or if any required params are not provided
    if ( params.help || params.output == false || params.input_data == false ){
        // Invoke the function above which prints the help message
        helpMessage()
        // Exit out and do not run anything else
        exit 1
    }

    // Make a channel with all of the files from the --input_folder
    input_ch = Channel
        .fromPath("${params.input_folder}/*")

    // Run the process on the data
    template(input_ch)

}