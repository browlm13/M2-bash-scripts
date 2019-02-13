#!/bin/bash

# 
#  Update M2 to master branch and Submit Job to M2
#

#
#  Script arguments: <project directory name> <output directory name>
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

# Submit job to M2 by calling 'submit_project_job.sh' script and passing '$PROJECT_DIR' and '$OUTPUT_DIR' as arguments
psc_project_submit_job(){
  #args
  local project_dir=$1
  local output_dir=$2

  # for specific account
  local connection_address="${USERNAME}@${HOST}"

  ssh $connection_address ./scratch/parallel_scientific_computing/submit_project_job.sh $project_dir $output_dir

  return
}

# Update M2 to master by calling 'pull_project_master.sh' script and passing '$PROJECT_DIR' as argument
# * ignores '$PROJECT_DIR/output/' directory and all its contents
psc_project_pull(){

  #args
  local project_dir=$1

  # for specific account
  local connection_address="${USERNAME}@${HOST}"

  ssh $connection_address ./scratch/parallel_scientific_computing/pull_project_master.sh $project_dir

  return
}

psc_project_pull $PROJECT_DIR
psc_project_submit_job $PROJECT_DIR $OUTPUT_DIR

