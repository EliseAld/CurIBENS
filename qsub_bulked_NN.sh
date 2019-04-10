#!/bin/bash

## Torque Configuration
# ==============================================================================

# resources
#PBS -l walltime=15:00:00
#PBS -l mem=30gb
#PBS -l nodes=1:ppn=10
#PBS -q batch
 
# Information
#PBS -N test_bulked_NN
#PBS -M elise.amblard@curie.fr
#PBS -m abe
 
# Other
#PBS -j oe
#PBS -o /data/tmp/zela/CurIBENS/rank_estimation/bulked_NN_log
#PBS -p 900


## Command section
# ==============================================================================

cd $PBS_O_WORKDIR
echo Running on host `hostname`
echo Time is `date`
echo Directory is `pwd`

# Main
# ==============================================================================
export PATH="/data/users/eamblard/tmp/R-3.5.3/bin:$PATH"
script_dir="/data/tmp/zela/CurIBENS/rank_estimation"
script="bulked_NN_test.R"
working_directory="/data/tmp/zela/CurIBENS/rank_estimation"

echo Start = `date`
cd $working_directory
Rscript ${script_dir}/${script}

echo End = `date`