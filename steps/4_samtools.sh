#!/usr/bin/env bash

# list of files to extract uniquely mapped reads from
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

    samtools view -h -F 4 /mnt/output/$fname | grep -v "XS:i" > "/mnt/output/"$fname".4a.sam"
    samtools view -h -Sb "/mnt/output/"$fname".4a.sam" -o "/mnt/output/"$fname".4b.bam"
    samtools sort "/mnt/output/"$fname".4b.bam" -o "/mnt/output/"$fname".unique.bam"
    samtools index "/mnt/output/"$fname".unique.bam"
done
