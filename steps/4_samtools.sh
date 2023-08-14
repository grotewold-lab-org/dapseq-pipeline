#!/usr/bin/env bash

samtools view -h -F 4 /mnt/output/aligned.sam | grep -v "XS:i" > /mnt/output/4a.sam
samtools view -h -Sb /mnt/output/4a.sam -o /mnt/output/4b.bam
samtools sort /mnt/output/4b.bam -o /mnt/output/unique.bam
samtools index /mnt/output/unique.bam'
