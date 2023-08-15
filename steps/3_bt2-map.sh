#!/usr/bin/env bash


# list of fastas to map to reference genomes
# all files in /mnt/output (clean fastas created in step #1)
declare -A fastas=(
    #[shorthand label]=filename
    ["P1_R1"]="P1_R1_clean.fa"
    ["P1_R2"]="P1_R2_clean.fa"
    ["Halo_R1"]="Halo_R1_clean.fa"
    ["Halo_R2"]="Halo_R2_clean.fa"
)


# list of reference genome indices
# all files in /mnt/output (indices built in step #2)
declare -A genomes=(
    #[shorthand label]=filename
    ["B73"]="index_B73"
    ["A632"]="index_A632"
)


# run  for each row in specs
for fasta_label in "${!fastas[@]}"; do
    fasta_fname="${fastas[$fasta_label]}"
    for genome_label in "${!genomes[@]}"; do
        genome_fname="${genomes[$genome_label]}"
    	output_fname=$fasta_label"_"$genome_label"_aligned.sam"
    	echo "bowtie2 align $fasta_label + $genome_label -> $output_fname"

        bowtie2 \
            -x /mnt/output/$genome_fname \
            -q /mnt/output/$fasta_fname \
            --sensitive --threads 6 \
            -S /mnt/output/$output_fname
    done
done

