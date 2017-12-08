#!/bin/bash

# Takes a csv file with username,n_comments rows and writes to stdout a csv
# with rows of form digital_suffix,n_usernames

grep -E -o '[0-9]+,' $1 | sed 's/,//' | sort | uniq -c | sort -n -r | sed -E 's/^ *([0-9]+) ([0-9]+)$/\2,\1/'
