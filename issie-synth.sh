#!/bin/bash

if [ "$1" = "" ]; then
	echo "Usage: issie-synth <project_directory>"
	exit
fi 

cd $1

#Remove "q = 0;" lines from source files
for VFILE in *.v
do
	grep -v '^\W*q = 0;' "${VFILE}" > "${VFILE}_"
	mv "${VFILE}_" "${VFILE}"
done

#Synthesis
echo "Running Yosys with source files:"
ls ./*.v
rm main.json
eval "yosys -p 'synth_ice40 -top main -json main.json' ./*.v &> main.log"

if [ ! -f main.json ] ; then
	echo "Synthesis Failed"
	exit
fi

echo "Synthesis Complete"

#Place and route
echo "Running nextpnr"
eval "nextpnr-ice40 --hx8k --json main.json --asc main.asc &>> main.log"
echo "Generated log $1/main.log"

exit 0

