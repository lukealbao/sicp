#! /usr/bin/env python

'''
Exercise: Create a recursive procedure for calculating Pascal's Triangle.

I was able to create the function to calculate the value of a single cell, given its
line and cell number, but creating the recursive call to concatenate these values into
a list was proving tricky in Scheme. Here is an implementation of the procedure in Python.

For fun, the third function will print the entire triangle given the number of rows.
Not sure if there is a more idiomatic way of pulling off those ranges, since their values
are integers to be calculated and not indexes.

// Scheme Version of calculate_one //
(define (calculate_one line place)
  (if (or (= place line)
          (= place 1))
          1
      (+ (calculate_one (- line 1) place)
         (calculate_one (- line 1) (- place 1)))))

'''
import sys

def calculate_one(line, place):
    if place == 1 or line == place:
        return 1
    else:
        return calculate_one(line - 1, place - 1) + calculate_one(line - 1, place)

def write_line(line):
    return [calculate_one(line, i) for i in range(1, line + 1)]

def write_triangle(lines):
    for i in range(1, lines +1):
        print write_line(i)

if __name__ == '__main__':
    write_triangle(int(sys.argv[1]))
