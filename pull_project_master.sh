#!/bin/bash

#
# Script updates project directory to master branch, the directory 'output' and its contents are ignored
# 

# script argument <project_directory>
PROJECT_DIR=$1

# Change directory to '$PROJECT_DIR'
cd scratch/parallel_scientific_computing/$PROJECT_DIR

# Run 'make clean' command from 'src' and return to '$PROJECT_DIR' before pulling from master
cd src
make clean
cd ..

# Remove 'submit_job.sh'
rm submit_job.sh

# Pull from mater
git pull
      
