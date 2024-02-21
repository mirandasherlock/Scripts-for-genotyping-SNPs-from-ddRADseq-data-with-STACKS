#!/bin/bash -l
#$ -l h_rt=2:0:0
#$ -l mem=4G
#$ -pe smp 8
#$ -l tmpfs=15G
#$ -t 1-433
#$ -N sstacks_job_array
#$ -wd /home/username/Scratch/stacks_directory

cd /home/username/Scratch/stacks_directory/ustacks_out
# Here, 'ustacks_out' contains most of my files for STACKS analyses. Check this is correct for where you are writing/ reading files to and from.

ITERFILE=/home/username/Scratch/stacks_directory/index_job_array_sstacks.txt
# Text file list of samples, one per line. No population information necessary. 

SAMPLE=$(sed -n ${SGE_TASK_ID}p $ITERFILE)  ## Use a sed one-liner and the SGE_ARRAY_TASK_ID to get the appropriate line in the $ITERFILE

module load stacks/2.54/gnu-4.9.2
# Specific to UCL's Myriad cluster. However you load STACKS. 

sstacks -c /home/username/Scratch/stacks_directory/ustacks_out -s $SAMPLE -p 8
