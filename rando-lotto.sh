#!/bin/bash
# A basic lottery number generator.
# batch = how many sets of numbers to output (5)
# count = number of random numbers (5)
# number = numerical range 1-99
# output adds a zero to the beginning of single digits 01 02 02 etc..
clear
for batch in {1..5}
 do
for count in {1..5}
 do
    number=$((1 + RANDOM % 99))
    output="$(printf '%02d' $((++$number)) )"
    echo -n $output"|"
 done
echo -e
done
