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


# assert that IDR results contain expected peaks
if grep -Pq 'chr4\t209797374' /mnt/output/B73_idr_peaks.out; then
    echo "success"
    exit 0
fi
echo 'missing expected peak: chr4 209797374'
exit 1

