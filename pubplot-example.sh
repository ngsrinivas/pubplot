#!/bin/bash

plotscript="pubplot.py"
plotpath="."
outfile="example1-latency-vs-load/elapsed-vs-load.eps"
datafile1="example1-latency-vs-load/loadsxtimeatpriority19.csv"
datafile2="example1-latency-vs-load/loadsxtimeatpriority18.csv"
python $plotscript -g -a "font \"Helvetica,24\"" \
    -p 2 -f "postscript enhanced color" \
    -o $outfile \
    -x "background load" -y "Elapsed ns" \
    --bmargin 5.2 --rmargin 4.3 \
    --csv \
    $datafile1 "prio 19" 1:2 \
    $datafile2 "prio 18" 1:2 \
    | gnuplot ; epstopdf $plotpath/$outfile --autorotate=All
