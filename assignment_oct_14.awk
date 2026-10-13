#!/bin/bash

# Part A: Numerical and String Comparisons

# Question 1
awk '$4 > 70000 {print $2, $3, $4}' employee.txt # Prints name, department and salary for employees earning more than 70000

# Question 2
awk '$4 >= 60000 && $4 <= 80000' employee.txt # Prints employees whose salary is between 60000 and 80000, including both limits

# Question 3
awk '$5 == "Inactive"' employee.txt # Exact string comparison: prints employees whose status is Inactive

# Question 4
awk '$3 == "VLSI"' employee.txt # Prints employees belonging to the VLSI department


# Part B: Regular-Expression Patterns

# Question 5
awk '/Security/' employee.txt # Prints all records containing the word Security anywhere in the record

# Question 6
awk '$2 ~ /^[ABC]/' employee.txt # Prints employees whose names begin with A, B or C

# Question 7
awk '$2 ~ /^[ABC]/' employee.txt # The regular expression is applied only to field 2 (employee name), not the whole record

# Question 8
awk '$3 !~ /Security/' employee.txt # Prints employees whose department field does not match the regular expression Security


# Part C: Logical Patterns

# Question 9
awk '$3 == "Security" && $4 > 70000' employee.txt # Both conditions must be true: Security department AND salary greater than 70000

# Question 10
awk '$3 == "VLSI" || $3 == "Networking"' employee.txt # Prints employees in either VLSI OR Networking

# Question 11
awk '$3 == "VLSI" && $4 > 70000 && $5 == "Active"' employee.txt # All three conditions must be true


# Part D: Conditional Pattern

# Question 12
awk '{ if ($3 == "Security" && $4 > 75000) print $2, $3, $4; else if ($3 != "Security" && $4 > 70000) print $2, $3, $4 }' employee.txt # Security employees need salary > 75000; all other departments need salary > 70000


# Part E: Grouped Patterns

# Question 13
awk '$5 == "Active" && ($3 == "Security" || $3 == "VLSI")' employee.txt # Parentheses group the department alternatives; Active applies to both

# Question 14
awk '($3 == "Security" && $4 > 80000) || ($3 == "VLSI" && $4 > 75000)' employee.txt # Prints Security employees earning > 80000 OR VLSI employees earning > 75000

# Question 15
awk '$5 == "Active" && (($3 == "Security" && $4 > 70000) || ($3 == "VLSI" && $4 > 75000))' employee.txt # Status must be Active and one grouped department/salary condition must be true


# Part F: Negated Patterns

# Question 16
awk '$5 != "Active"' employee.txt # Exact field comparison; avoids matching Inactive just because it contains the text Active

# Question 17
awk '$3 != "Security" && $3 != "VLSI"' employee.txt # Prints employees who belong to neither Security nor VLSI


# Part G: Range Patterns

# Question 18
awk '$1 == 103, $1 == 108' employee.txt # Prints records from employee ID 103 through ID 108, including both boundary records

# Question 19
awk '$2 == "David", $2 == "Irene"' employee.txt # Prints records beginning at David and ending at Irene, including both boundary records


# Part H: Built-In Variables

# Question 20
awk 'NR <= 5 {print NR, $0}' employee.txt # NR is the current record number; prints the first five records with their record numbers

# Question 21
awk 'NR >= 4 && NR <= 9' employee.txt # Prints records numbered 4 through 9 using NR

# Question 22
awk 'NF == 5 {print NR, $0}' employee.txt # NF is the number of fields; prints record number and complete record only when there are exactly five fields

# Question 23
awk 'NR % 2 == 1' employee.txt # NR % 2 gives the remainder after division by 2; remainder 1 means an odd-numbered record


# Part I: Arithmetic Conditions

# Question 24
awk '{bonus = $4 * 0.10; if (bonus > 7000) print $2, $4, bonus}' employee.txt # Calculates a 10% bonus and prints employees whose bonus exceeds 7000

# Question 25: Revised salary
awk '{revised = $4 * 1.12; if (revised > 85000) print $2, $4, revised}' employee.txt # Adds a 12% increment; prints employees whose revised salary exceeds 85000

# Question 26
awk '{monthly = $4 / 12; if (monthly > 6000) print $2, $4, monthly}' employee.txt # Converts annual salary to monthly salary and checks whether it exceeds 6000


# Part J: Integrated Challenge

# Question 27
awk 'BEGIN {
    print "Active Employee Salary Report"
    print "ID Name Department Salary Status"
}
$5 == "Active" && (
    ($3 == "Security" && $4 >= 70000) ||
    ($3 == "VLSI" && $4 >= 75000) ||
    ($3 == "Networking" && $4 >= 70000)
) {
    print $1, $2, $3, $4, $5
    count++
}
END {
    print "Total selected employees:", count+0
}' employee.txt # BEGIN prints the heading; END prints the total number of selected employees
