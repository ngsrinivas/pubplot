#!/bin/bash

plotscript="pubplot.py"
plotpath="."
outfile="not-delayed-dataset2.eps"
folder="."
datafile_client=$folder/"T1"
datafile_lb=$folder/"T2"
datafile_trigger=$folder/"T3"
python $plotscript -g -a "font \"Helvetica,34\"" \
    -p 3 -f "postscript enhanced color" \
    -o $outfile -l \
    --small \
    -x "time (ms)" -y "Delays (ms)" \
    --xrange "[0:20]" \
    --yrange "[0:1.6]" \
    --bmargin 6.5 --rmargin 5 --lmargin 15 \
    -k "top right spacing 1.5 font \"Helvetica,34\" " \
    $datafile_client  "T_{client}" "((1000*\$1)-420):(\$2/1000)" \
    $datafile_lb "T_{LB}\ \ \ \ " "((1000*\$1)-420):(\$2/1000)" \
    $datafile_trigger "T_{trigger}" "((1000*\$1)-420):(\$2/1000)" \
    | gnuplot ; epstopdf $plotpath/$outfile --autorotate=All
#    --csv \
#   --yrange "[9000:12000]"
# -l \
#    --yrange "[9000:12000]" \
#    $datafile_trigger "T_{trigger}" "((1000*\$1)-420):2" \
#    --yrange "[9000:12000]" \
#    --yrange "[9:12]" \
