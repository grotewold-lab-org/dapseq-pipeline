#!/usr/bin/env bash

# run IDR for peaks aligned with both ref genomes
# all files in /mnt/output (peaks created by gemtools in step #6)

idr --samples \
    /mnt/output/R1_B73_peaks/R1_B73_peaks.GEM_events.narrowPeak \
    /mnt/output/R2_B73_peaks/R2_B73_peaks.GEM_events.narrowPeak \
    --input-file-type narrowPeak \
    --output-file /mnt/output/B73_idr_peaks.out \
    --plot


idr --samples \
    /mnt/output/R1_A632_peaks/R1_A632_peaks.GEM_events.narrowPeak \
    /mnt/output/R2_A632_peaks/R2_A632_peaks.GEM_events.narrowPeak \
    --input-file-type narrowPeak \
    --output-file /mnt/output/A632_idr_peaks.out \
    --plot



# check for peak at chrom 4, position 209797300...99
if grep -qe $'chr4\t2097973[0-9][0-9]\t' /mnt/output/B73_idr_peaks.out; then
    echo "peaks are correct in /mnt/output/B73_idr_peaks.out"
    exit 0
fi

echo 'missing expected peak at chrom 4, position 209797300...99'
exit 1