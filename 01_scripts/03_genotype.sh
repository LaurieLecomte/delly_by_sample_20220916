#!/bin/bash

# 3rd step of SV calling with delly : genotype SV calls at each sites
# SV calling is done by sample for high-coverage genomes or in small batches for low-coverage genomes : we have high coverage (16X)
# Following instructions for germline SV calling (https://github.com/dellytools/delly#germline-sv-calling)

# parallel -a 02_infos/ind_ALL.txt -k -j 10 srun -c 1 -J 03_genotype_{} -o log/03_genotype_{}_%j.log /bin/sh 01_scripts/03_genotype.sh {} &

# VARIABLES
GENOME="03_genome/genome.fasta"
CHR_LIST="02_infos/chr_list.txt"
BAM_DIR="04_bam"
CALLS_DIR="05_calls"
MERGED_DIR="06_merged"
FILT_DIR="07_filtered"

SAMPLE=$1
BAM="$BAM_DIR/"$SAMPLE".bam"

REGIONS_EX="02_infos/excl_chrs.txt"

# Create directory for genotyped calls
if [[ ! -d $CALLS_DIR/geno ]]
then
  mkdir $CALLS_DIR/geno
fi

# 1. Genotype this merged SV site list across all samples. This can be run in parallel for each sample.
delly call -g $GENOME -v $CALLS_DIR/merged_sites.bcf -o $CALLS_DIR/geno/"$SAMPLE".geno.bcf $BAM
