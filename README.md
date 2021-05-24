# issie-synth
A script for synthesis, place and route on [Issie](https://github.com/tomcl/issie) projects

## Installation (Linux)
1. Install [Issie v2.0.12](https://github.com/tomcl/issie/releases/tag/v2.0.12) or later
2. Install [Yosys](http://bygone.clairexen.net/yosys/download.html)
3. Install [nextpnr with iCE40 support](https://github.com/YosysHQ/nextpnr#nextpnr-ice40)
4. Install issie-synth

       git clone https://github.com/edstott/issie-synth.git`

Imperial College users can download a [preinstalled VMware Virtual Machine](https://imperiallondon-my.sharepoint.com/:u:/g/personal/estott_ic_ac_uk/ETfs6pGuxt5EqaUugjaZpmkBlx7b5Fm35V-pTtjpjOAYeg?e=4ifSLO). 
Log in as `user` with password `DECA`. Update issie synth with:

    cd ~/issie-synth
    git pull
  
## Usage
1. Generate a verilog output of your project from Issie with Sheet → Write design as Verilog. Select the option 'Write Synthesis Verilog'
2. Run `./issie-synth.sh <path to project directory>`

Some examples are included:
             
    ./issie-synth.sh examples/count
    ./issie-synth.sh examples/alphatest
    ./issie-synth.sh examples/mu0arm

## Compilation results
Open `main.log` in the project directory in a text editor to see the compilation report.

A line near the end of the report shopws the maximum clock frequency, for example:

    Info: Max frequency for clock 'clk$SB_IO_IN_$glb_clk': 42.52 MHz (PASS at 12.00 MHz)

A table shows the resource utilisation, for example:

    Info: Device utilisation:
    Info: 	         ICESTORM_LC:   597/ 7680     7%
    Info: 	        ICESTORM_RAM:    16/   32    50%
    Info: 	               SB_IO:   100/  256    39%
    Info: 	               SB_GB:     7/    8    87%
    Info: 	        ICESTORM_PLL:     0/    2     0%
    Info: 	         SB_WARMBOOT:     0/    1     0%

The important resources are `ICESTORM_LC` (logic cells) and `ICESTORM_RAM` RAM blocks.

The report also describes the critical path in the design, listing all the logic that limits the clock frequency. The section begins with:
      
    Info: Critical path report for clock 'clk$SB_IO_IN_$glb_clk' (posedge -> posedge):
Make sure you are looking at `(posedge -> posedge)` - there are other critical paths relating to inputs and putputs that do not affect the clock frequency.

The critical path may be hard to decipher because it describes entities on the flattened and optimised design. Look for names of blocks in your design. The first and last elements are registered or other clocked logic, while everything else is combinatorial.


