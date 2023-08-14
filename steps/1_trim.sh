#!/usr/bin/env bash

java -jar /mnt/Trimmomatic-0.38/trimmomatic-0.38.jar SE -phred33 -threads 6 /mnt/Raw_data/P1_deM_R1_SE50_20190904.fastq.gz /mnt/output/clean.fa ILLUMINACLIP:/mnt/Trimmomatic-0.38/TruSeq3-SE.fa:2:30:10 SLIDINGWINDOW:6:15 MINLEN:30
