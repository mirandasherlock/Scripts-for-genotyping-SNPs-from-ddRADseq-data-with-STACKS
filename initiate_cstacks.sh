#!/bin/bash -l

#$ -l h_rt=48:0:0
#$ -l mem=48G
#$ -pe smp 32
#$ -l tmpfs=15G
#$ -N cstacks_job
#$ -wd /home/username/Scratch/stacks_directory/cstacks_out

module load stacks/2.54/gnu-4.9.2
# Specific to UCL's Myriad cluster. However you load stacks.

cd /home/username/Scratch/stacks_directory

popmap=popmap.txt 
# standards STACKS popmap, one individiaul per line with tab space to population ID. See manual for more detail. 

INPUT=/home/username/Scratch/stacks_directory/ustacks_out

n=3
# Change for the value of n that you selected via optimisation steps. 

out_dir=/home/username/Scratch/stacks_directory/cstacks_out 

log_file=$out_dir/denovo_map.oe

/usr/bin/time --verbose cstacks -P $INPUT -M $popmap -n $n -p $NSLOTS
