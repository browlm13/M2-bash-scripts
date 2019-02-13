#!/bin/bash

# 
#  'scp' entire output directory from M2 to local
#

#
#  Script arguments: <project directory name> <output directory to copy>
#

PROJECT_DIR=$1
OUTPUT_DIR=$2

#
# Constants
#

USERNAME=""
HOST=""


#
# Functions
#

psc_project_output()
{

  #args
  local project_dir=$1
  local output_dir=$2

  # for specific account
  local connection_address="${USERNAME}@${HOST}"

  scp  -r $connection_address:/users/$USERNAME/scratch/parallel_scientific_computing/$project_dir/output/$output_dir ~/Documents/M2/parallel_scientific_computing/$project_dir/output/

  return
}

psc_project_output $PROJECT_DIR $OUTPUT_DIR


