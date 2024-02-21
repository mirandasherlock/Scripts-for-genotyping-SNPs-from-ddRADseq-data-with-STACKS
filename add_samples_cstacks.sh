#!/bin/bash -l
#$ -l h_rt=48:0:0
#$ -l mem=48G
#$ -pe smp 32
#$ -l tmpfs=15G
#$ -N cstacks_job_2
#$ -wd /home/username/Scratch/stacks_directory/cstacks_out

module load stacks/2.54/gnu-4.9.2
# Specific to UCL's Myriad cluster, replace with however you load STACKS (if needed).

cd /home/username/Scratch/stacks_directory

popmap=popmap_of_samples_added.txt 
# This is a popmap only of the samples being added on. 

INPUT=/home/username/Scratch/stacks_directory/ustacks_out

n=3
# Your value of n selected through optimisation.

out_dir=/home/username/Scratch/stacks_directory/cstacks_out 

log_file=$out_dir/denovo_map.oe

cstacks -o $INPUT --catalog $INPUT/catalog -s $INPUT/SAMPLE_TO_ADD_1 -s $INPUT/SAMPLE_TO_ADD_3 -s $INPUT/SAMPLE_TO_ADD_3 -n $n -p $NSLOTS
