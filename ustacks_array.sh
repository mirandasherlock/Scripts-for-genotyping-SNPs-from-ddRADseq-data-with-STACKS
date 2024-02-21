#!/bin/bash -l
#$ -l h_rt=24:0:0
#$ -l mem=16G
#$ -pe smp 8
#$ -l tmpfs=15G
#$ -t 1-100
#$ -N ustacks_job_array
#$ -wd /home/username/Scratch/stacks_directory/cstacks_out

# '-t' above should be the number of samples you wish to process.
cd /home/zcbtmbs/Scratch/iberia_stacks

out_dir=$PWD/ustacks_out

log_file=$out_dir/denovo_map.oe

# Path to your demultiplexed .fq.gz files.
DEMULTIPLEXED_DIR=/home/zcbtmbs/Scratch/iberia_stacks/cleaned

# ITERFILE is a list of the filenames of the samples to run, one per line. Including the extension e.g. "SAMPLE_1.fq.gz"
ITERFILE=index_job_array.txt

SAMPLE=$(sed -n ${SGE_TASK_ID}p $ITERFILE)  ## Use a sed one-liner and the SGE_TASK_ID to get the appropriate line in the $ITERFILE

module load stacks/2.54/gnu-4.9.2
# This is specific to UCL's myriad cluster, substitute this to how you load stacks if you need to. 

ustacks -f ${DEMULTIPLEXED_DIR}/${SAMPLE} -i $SGE_TASK_ID -o $out_dir -M 3 -m 3 -p 8
