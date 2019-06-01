unset grid
set terminal pdf
set output "cosinus_clear_after_dft.pdf"
set key box top left
set multi
set key opaque
set key box
set key width 1 height 0.5 font  'Arial, 14' 
set style data lines
set termopt enhanced
set xlabel 'x' font 'Arial,14'
set ylabel 'y' font 'Arial,14'
set xtics font 'Arial,14'
set ytics font 'Arial,14'
set termoption dashed

plot "cosinus_clear_after_dft" title "cosinus_clear_after_dft"


unset multi
