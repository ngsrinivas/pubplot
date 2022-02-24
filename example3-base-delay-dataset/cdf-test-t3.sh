file="not-delayed-dataset/T3"
col=2
sort -n -k $col $file | awk '
{	d[++c] = $2
}
END {	inc = 1 / c
	for(i = 0; i <= c; i++)
		printf("%.1f\t%.2f\n", d[i], i * inc)
}'
# Output was captured into cdf-t3.txt
