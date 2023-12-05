#!/bin/bash
# This .sh script should be launched in a directory with multiple MCMCtree runs with three clocks with folder name structured like this: run$i_clock{1..3}.
# Create the directory for txt files if it doesn't exist
mkdir -p txt_files

# Loop through each folder matching the pattern run*_clock*/
for folder in run*_clock*/; do
    # Extract run and clock numbers from the folder name
    run=$(echo "$folder" | grep -oP 'run\K\d+')
    clock=$(echo "$folder" | grep -oP 'clock\K\d+')

    # Define the source and destination paths
    source_file="${folder}mcmc.txt"
    destination_file="txt_files/run${run}_clock${clock}_mcmc.txt"

    # Copy and rename the file
    cp "$source_file" "$destination_file"
done
