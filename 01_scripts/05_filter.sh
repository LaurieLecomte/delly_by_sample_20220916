#!/bin/bash

# Filter for PASS and PRECISE calls ?

# VARIABLES
GENOME="03_genome/genome.fasta"
CHR_LIST="02_infos/chr_list.txt"
BAM_DIR="04_bam"
CALLS_DIR="05_calls"
MERGED_DIR="06_merged"
FILT_DIR="07_filtered"

REGIONS_EX="02_infos/excl_chrs.txt"

BCF_GENO_LIST="02_infos/bcf_geno_list.txt"

# LOAD REQUIRED MODULES
module load bcftools/1.15
