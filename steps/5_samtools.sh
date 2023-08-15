#!/usr/bin/env bash

# list of files from which to extract uniquely mapped reads with perfect math
# all files in /mnt/output (aligned sams created in step #3)
specs=(
    "P1_R1_B73_aligned.sam"
    "P1_R2_B73_aligned.sam"
    "Halo_R1_B73_aligned.sam"
    "Halo_R2_B73_aligned.sam"
    "P1_R1_A632_aligned.sam"
    "P1_R2_A632_aligned.sam"
    "Halo_R1_A632_aligned.sam"
    "Halo_R2_A632_aligned.sam"
)

for fname in "${specs[@]}"; do
    echo "samtools "$fname;

    samtools view -q 42 -b /mnt/output/$fname -o "/mnt/output/"$fname".5a.bam"
    samtools sort "/mnt/output/"$fname".5a.bam" -o "/mnt/output/"$fname".perfect.bam"
    samtools index "/mnt/output/"$fname".perfect.bam"

done
