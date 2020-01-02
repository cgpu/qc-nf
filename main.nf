#!/usr/bin/env nextflow
/*
========================================================================================
                         lifebit-ai/qc-nf
========================================================================================
 lifebit-ai/qc-nf Template Nextflow pipeline to run quality control (QC) on FastQ files 
 #### Homepage / Documentation
 https://github.com/lifebit-ai/qc-nf
----------------------------------------------------------------------------------------
*/

Channel
  .fromFilePairs( params.reads, size: params.singleEnd ? 1 : 2 )
  .ifEmpty { exit 1, "Cannot find any reads matching: ${params.reads}\nNB: Path needs to be enclosed in quotes!\nNB: Path requires at least one * wildcard!\nIf this is single-end data, please specify --singleEnd on the command line." }
  .set { raw_reads_fastqc }

/*--------------------------------------------------
  Run FastQC for quality control of input reads
---------------------------------------------------*/

process fastqc {
  label 'med_resources'

  tag "$name"

  publishDir params.outdir, mode: 'copy'

  input:
  set val(name), file(reads) from raw_reads_fastqc

  output:
  file "*_fastqc.{zip,html}" into fastqc_results

  script:
  """
  fastqc $reads
  """
}

/*--------------------------------------------------
  Run MultiQC to generate an output HTML report
---------------------------------------------------*/

process multiqc {
    publishDir params.outdir, mode: 'copy'

    input:
    file ('fastqc/*') from fastqc_results.collect()

    output:
    file "*multiqc_report.html" into multiqc_report
    file "*_data"

    script:
    """
    multiqc . -m fastqc
    """
}