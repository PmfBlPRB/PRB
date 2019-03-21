set xlabel "x-axis"
set ylabel "y-axis"
set logscale y
set yrange [1:]
set title "Example Plot"

#set output 'test.png' 
#set terminal png

#set output 'test.tex'
#set terminal latex 

set terminal aqua
#set terminal x11

plot 'power2.txt' title 'Squared X' with linespoints, 'power3.txt' title 'Cubic X' with linespoints, 'exp.txt' title '$2^n$' with linespoints

#reset 