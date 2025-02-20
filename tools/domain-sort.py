#!/usr/bin/env python3.11

from fileinput import input

seen = set()  # Set to track seen lines

for y in sorted([x.strip().split('.')[::-1] for x in input()]):
    line = '.'.join(y[::-1])
    if line not in seen:  # Check if the line has already been seen
        print(line)  # Print the line if it's not a duplicate
        seen.add(line)  # Add the line to the set of seen lines
