#!/bin/bash

# Call SV in all samples

# parallel -a 02_infos/chr_list.txt -k -j 10 srun -c 4 --mem=20G -p medium --time=7-00:00 -J 01_call_{} -log/01_call_{}_%j.log /bin/sh 01_scripts/01_call.sh {} &
# srun -c 2 -p medium --time=7-00:00 -J 01_call_ssa01-23 -o log/01_call_ssa01-23_%j.log /bin/sh 01_scripts/01_call.sh 'ssa01-23' &

# VARIABLES
GENOME="03_genome/genome.fasta"
CHR_LIST="02_infos/chr_list.txt"
BAM_DIR="04_bam"
CALLS_DIR="05_calls"
MERGED_DIR="06_merged"
FILT_DIR="07_filtered"

REGION=$1
BAM_LIST=$(for file in $(ls $BAM_DIR/*.bam); do echo '--bam' "$file" ; done)

CPU=2
