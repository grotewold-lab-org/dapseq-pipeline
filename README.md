# dapseq-pipeline

pipeline for cleaning, mapping, and peak identification for DAP-seq data

this repository contains a combination of bash scripts and docker configurations to 

- cross-platform - run on any computer using only docker
- stable - automated testing ensures the pipeline works correctly
- modular - each step in the pipeline works independantly on a standard linux system (HPC)
- no ongoing maintenence - all software and data is "locked in" to ensure reproducibility
  - [Git LFS](https://git-lfs.com/) for data
  - [Docker Hub](https://hub.docker.com/search?q=) for official pre-built linux images with installed software

## Specification of pipeline steps

Each pipeline step is defined by a docker image and a bash command in docker-compose.yml

```
  1_trim:
    image: openjdk:22-bookworm
    ...
    command: java -jar /mnt/Trimmomatic-0.38/trimmomatic-0.38.jar ...
```
- `1_trim` is the shorthand label to identify this step (step #1: cleaning with trimmomatic)
- `openjdk:22-bookworm` signifies a specific version of the official [OpenJDK docker image on dockerhub](https://hub.docker.com/_/openjdk).
Only official public docker images should be used with no added installations steps.
This avoids ongoing maintenance required for docker containers that connect to the internet.

- `java -jar ...` is the command used to execute the pipeline step in question. 
the command should 
  - use software included in the docker image (in this case java) 
  - use files included in this repository (under `/mnt/...`)
  - save all outputs in the folder `/mnt/output`




## Usage

install [git lfs](https://git-lfs.com/) and [docker](https://www.docker.com/)

clone this repository and execute pipeline steps 

all intermediate and output files are saved in `output` folder
```
git clone https://github.com/grotewold-lab/dapseq-pipeline.git
cd dapseq-pipeline
git lfs pull

# trimmomatic (raw fasta -> clean fasta)
docker compose run 1_trim

# bowtie2 genome index (ref genome -> index)
docker compose run 2_bt2-build

# bowtie2 mapping (clean fasta + index -> sam)
docker compose run 3_bt2-map

# extract uniquely mapped reads (sam -> bam)
docker compose run 4_samtools

# GEM tool (bams -> peaks)
docker compose run 5_gemtool
```
