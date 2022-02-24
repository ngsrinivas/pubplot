# sample file to generate CDF from 2 column data
file="sample_two_column_file.txt"
col=2 # which column to use to sort values for cdf?
sort -n -k $col $file | awk '
{	d[++c] = $2
}
END {	inc = 1 / c
	for(i = 0; i <= c; i++)
		printf("%.1f\t%.2f\n", d[i], i * inc)
}'
