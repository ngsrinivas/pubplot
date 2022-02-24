#!/bin/bash

plotscript="pubplot.py"
plotpath="."
outfile="not-delayed-cdf.eps"
folder="."
datafile_client=$folder/"cdf-t1.txt"
datafile_lb=$folder/"cdf-t2.txt"
datafile_trigger=$folder/"cdf-t3.txt"
python $plotscript -g -a "font \"Helvetica,34\"" \
    -p 2 -f "postscript enhanced color" \
    -o $outfile -l \
    --small \
    -x "Delay (ms)" -y "CDF: Pr(T <= x)" \
    --xrange "[0:1.8]" \
    -k "bottom right spacing 1.5 font \"Helvetica,34\"" \
    --bmargin 6.5 --rmargin 5 --lmargin 15 \
    $datafile_client  "T_{client}" "(\$1/1000):2" \
    $datafile_lb "T_{LB}\ \ \ \ " "(\$1/1000):2" \
    $datafile_trigger "T_{trigger}" "(\$1/1000):2" \
    | gnuplot ; epstopdf $plotpath/$outfile --autorotate=All
#    --csv \
#   --yrange "[9000:12000]"
# -l \
#    --yrange "[9000:12000]" \
#    $datafile_trigger "T_{trigger}" "((1000*\$1)-420):2" \
#    --xrange "[0:20]" \
#    --yrange "[9000:12000]" \
#
