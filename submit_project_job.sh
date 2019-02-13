#!/bin/bash

# args -- project, output directory name
PROJECT_DIR=$1
OUTPUT_DIR=$2

# Change working directory to specified project directory
cd /users/<USER>/scratch/parallel_scientific_computing/$PROJECT_DIR

# Run 'make' and 'make clean' commands from 'src' directory and then return to '$PROJECT_DIR'
cd src
make clean
make
cd ..

# Modify 'submit_job.sh' script permissions in case it was updated to 755
chmod 755 submit_job.sh

# Run submit 'job_script.sh' from scratch passing output directory name as the only argument
cd ../..
sbatch /users/<USER>/scratch/parallel_scientific_computing/$PROJECT_DIR/submit_job.sh $OUTPUT_DIR
