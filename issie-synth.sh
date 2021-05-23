#!/bin/bash

if [ "$1" = "" ]; then
	echo "Usage: issie-synth <project_directory>"
	exit
fi 

cd $1

echo "Running Yosys with source files:"
ls ./*.v
eval "yosys -p 'synth_ice40 -top main -json main.json' ./*.v &> main.log"
echo "Running nextpnr"
eval "nextpnr-ice40 --hx4k --json main.json --asc main.asc &>> main.log"

exit 0

