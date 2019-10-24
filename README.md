# qc-nf

Template Nextflow pipeline to run quality control (QC) on FastQ files using FastQC & generate an output HTML report using MultiQC

### Dependencies 
- [Nextflow](https://www.nextflow.io/)
- [Docker](https://www.docker.com/)

### Usage:
```bash
nextflow run main.nf --reads "testdata/test.20k_reads_{1,2}.fastq.gz"
```

## Deploit

This tool can also be run on Deploit.

Deploit is a bioinformatics platform, developed by Lifebit, where you can run your analysis over the Cloud/AWS.

It is free for indivudal users to [sign-up](https://deploit.lifebit.ai/register)

To run the pipeline, once logged in, you will first need to navigate to the pipelines page where you can import the pipeline:

![deploit](https://raw.githubusercontent.com/lifebit-ai/ecw-converter/master/images/deploit.png)

See [example run](https://deploit.lifebit.ai/public/jobs/5dade42f43cc9700e1826166) of the pipeline on Deploit