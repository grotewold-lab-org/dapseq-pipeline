#!/usr/bin/env bash

samtools view -q 42 -b /mnt/output/aligned.sam -o /mnt/output/5a.bam
samtools sort /mnt/output/5a.bam -o /mnt/output/perfect.bam
samtools index /mnt/output/perfect.bam
