
# trimmomatic (raw fasta -> clean fasta)
docker compose run 1_trim

# bowtie2 genome index (ref genome -> index)
docker compose run 2_bt2-build

# bowtie2 mapping (clean fasta + index -> sam)
docker compose run 3_bt2-map

# extract uniquely mapped reads (sam -> bam)
docker compose run 4_samtools

# extract uniquely mapped reads with perfect match (MAPQ= 42)
docker compose run 5_samtools

# GEM tool (bams -> peaks)
docker compose run 6_gemtool

# IDR (peaks -> high confidence peaks)
docker compose run 7_idr