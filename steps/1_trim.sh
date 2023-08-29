#!/usr/bin/env bash


# list of files to clean with trimmomatic
specs=(
    # input in /mnt/raw_data; output in /mnt/output
    "P1_deM_R1_SE50_20190904.fastq.gz;P1_R1_clean.fa"
    "P1_deM_R2_SE50_20190904.fastq.gz;P1_R2_clean.fa"
    "Halo_deM_R1_SE50_20190904.fastq.gz;Halo_R1_clean.fa"
    "Halo_deM_R2_SE50_20190904.fastq.gz;Halo_R2_clean.fa"
)


# run trimmomatic for each row in specs
for row in "${specs[@]}"; do
    IFS=';' read -ra paths <<< "$row"
    input_fname="${paths[0]}"
    output_fname="${paths[1]}"

    echo "Trimmomatic $input_fname -> $output_fname"

    #debug
    wc -l /mnt/raw_data/$input_fname

    java -jar /mnt/Trimmomatic-0.38/trimmomatic-0.38.jar \
        SE -phred33 -threads 6 \
        /mnt/raw_data/$input_fname \
        /mnt/output/$output_fname \
        ILLUMINACLIP:/mnt/Trimmomatic-0.38/TruSeq3-SE.fa:2:30:10 \
        SLIDINGWINDOW:6:15 MINLEN:30

done

