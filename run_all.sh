#!/bin/bash

# Get the directory path from the first argument
dir_path=$1

# Loop through all subdirectories of the directory path
for subdir in $dir_path/*; do
  # Check if the file is a subdirectory (checkpoint-XX)
  if [[ -d "$subdir" ]]; then 

    # Check if the subdirectory contains the file pred_file.csv
    if [ -f "$subdir/pred_file.csv" ]; then

      # Check if the subdirectory doesn't contain the file pred_result.csv
      if [ ! -f "$subdir/pred_result.csv" ]; then

        # Print the subdirectory name
        docker run -it -v "$(pwd)/$subdir/:/$subdir" --rm --name qasrl hirscheran/qasrl_state_machine_example "file" "/$subdir/pred_file.csv" "/$subdir/pred_result.csv"      
      fi
    fi
  fi 
done