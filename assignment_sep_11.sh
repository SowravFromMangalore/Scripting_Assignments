#!/bin/bash

# Question 1

grep -n "ERROR" sim.log # 4,7 was the output

# Question 2

grep -i -c "warning" sim.log # There are no warnings in the file according to the question, if we put warnings we get 0
# if warning then 2 was the output

# Question 3

grep -i -c "set violation" timing_report.rpt # Path 1: setup violation at U1/clk -> was the output

# Question 4

if grep - q "NAND_X1" netlist.v # -q is the option which I learnt from --help which supresses normal output which can also told to be stops grep from printing in the terminal and quietly exits the if statement
then
	echo "CELL FOUND"
else
	echo "CELL NOT FOUND"
fi

# Question 5

grep -B 2 "violation" timing_report.rpt # -B print before number of lines in which we gave 2

# Question 6

grep -A 3 "ERROR" sim.log # to print next 3 lines which has word ERROR
grep -B 1 -A 1 "fatal" sim.log # to print 1 line before and after the line with fatal
# we can also do -C which I understood later

# Questino 7

grep -i -E "error|warning" sim.log # usinging | to check if the line has error OR warning

# Question 8

grep -f cells.txt netlist.v # -f helps us to find the patterns present in file 1 is present or not in file 2

# Question 9

grep -l "endmodule" *.v # -l is used to find matches and using globbing we can find in every same type file in the directory

# Question 10

# grep "^always" alu.v didn't give me any output becuz it has space in the lines which start with always 
grep "[[:space:]]*always" alu.v # which mentions the presence of space and * becomes a whitespace character

# Question 11

grep -w "nand" truth_table.txt # -w is used to match pattern exactly

# Question 12

grep -v "^#" constraints.sdc # -v is used to invert -> here we asked grep to print lines which starts with ^# but -v inverted it so lines other than those gets printed

# Question 13

grep "[0-9]" sim_results.log # prints all the lines which has numbers

# Question 14
grep -in '[^a-z0-9]' netlist.v # -i is to ignore case, -n is to give line number and to show lines which contains characters other than alphanumeric the above logic is used

# Question 15

if grep -qi "slack" timing_report_rpt
then
	echo "Slack Report Available"
else
	echo "No Slack Data"
fi

# Question 16

grep -H "clk" netlist.v alu.v # -H prints filename with output lines

# Question 17

grep -s "missing" stdcells.lib # the file didn't have missing in it however, but I understood -s is used to supress if the errors messages occurs like if the file doesn't exist and still it doesnt print any error

# Question 18

grep -H "module" *.v # -H prints all the lines in the mentioned in " " of the given filename

# Question 19

grep -h "pin" stdcells.lib # -h prints same like -H but not module name

# Question 20

grep -ich "error" * # We get count of each file separately, if we are mentioned with the filename then we can get the proper output

# Question 21

grep "input" alu.v > inputs.txt # push all the lines with input into the new file 

# Question 22

grep -E "and_r|xor_r|and_r" alu.v # Finding lines with those content 

# Question 23

grep -E '^[[:space:]]*(N|I)' netlist.v # Finds only lines which starts with N or I - which are gates in this module

# Question 24

grep -E "clk$" sim_results.log # print lines only which ends with clk

# Question 25

grep -h "^module" *.v # print all lines which starts with module and dont show module names from all verilog files

# Question 26

grep -v "#" truth_table.txt # print all the lines of the filename except which has #

# Question 27

grep -E -w "a=[0-9]|b=[0-9]" sim_results.log # prints exactly lines which has a and b are single digit number

# Question 28

grep -iE "delay" constraints.sdc # prints all the lines which has delay word in it

# Question 29

grep "always" alu.v # prints all the lines with always but I have no idea how to print the always block

# Question 30

echo "Read Cell Name:"
read cellname

if grep -q "$cell" stdcells.lib # q is used to do quiet search
then
	echo "Available"
else
	echo "Not Available"
fi

# Questino 31

if grep -iq "fatal" sim.log
then
	echo "Fatal Error Found"
	exit 1
else
	echo "No Fatal Error Found"
	exit 0
fi

# Question 32

grep "module" netlist.v alu.v > modules.txt # push all the lines which has module in it to modules.txt file

# Question 33

grep -E "input|output" netlist.v alu.v # prints all the lines which has input and output words in those files

# Question 34 

grep -o '\<[A-Z0-9][A-Z0-9]*_[A-Z0-9]*\>' netlist.v # -o prints the parts only which matches and the syntax is the format in which the lines are written inside the module
