#!/usr/bin/env bash

# specifications to 4 sets of peaks that will be identified
# all files in /mnt/output (unique bams created in step #4)
declare -A specs=(
    #[output name]=exp input; ctrl input; reference genome
    ["R1_B73_peaks"]="P1_R1_B73_aligned.sam.unique.bam;Halo_R1_B73_aligned.sam.unique.bam;Maize_AGPv4_B73_chroms"
    ["R2_B73_peaks"]="P1_R2_B73_aligned.sam.unique.bam;Halo_R2_B73_aligned.sam.unique.bam;Maize_AGPv4_B73_chroms"
    ["R1_A632_peaks"]="P1_R1_A632_aligned.sam.unique.bam;Halo_R1_A632_aligned.sam.unique.bam;Maize_A632_Wang_2023_chroms"
    ["R2_A632_peaks"]="P1_R2_A632_aligned.sam.unique.bam;Halo_R2_A632_aligned.sam.unique.bam;Maize_A632_Wang_2023_chroms"
)


# extract both reference genomes
tar -xzvf /mnt/genomes/Maize_A632_Wang_2023_chroms.tar.gz
tar -xzvf /mnt/genomes/Maize_AGPv4_B73_chroms.tar.gz


# run gemtools for each row in specs
for output_fname in "${!specs[@]}"; do
    row="${specs[$output_fname]}"
    IFS=';' read -ra pair <<< "$row"
    input_expt="${pair[0]}"
    input_ctrl="${pair[1]}"
    ref_genome="${pair[2]}"

    java -jar /mnt/gem/gem.jar \
      --d /mnt/gem/Read_Distribution_default.txt \
      --g /mnt/genomes/chrom.sizes \
      --genome $ref_genome \
      --exptCond1 /mnt/output/$input_expt \
      --ctrlCond1 /mnt/output/$input_ctrl \
      --f BAM --k_min 6 --k_max 13 --k_seqs 5000 \
      --smooth 5 --mrc 20 --poisson_control \
      --outBED --outMEME --outNP \
      --out /mnt/output/$output_fname

done

