# Custom latexmkrc

# Use pdflatex for processing
$pdf_mode = 1;

# Output directory for final files like PDF
$out_dir = 'output/';

# Use nonstopmode and file-line-error mode with pdflatex
$pdflatex = 'pdflatex -output-directory='.$out_dir.' -interaction=nonstopmode -file-line-error -synctex=1 -shell-escape %O %S';

# Use Biber for bibliography
$biber = 'biber --input-directory='.$out_dir.' --output-directory='.$out_dir.' --input-encoding=UTF8 --output-encoding=UTF8 %B';

# Use makeglossaries
$makeglossaries = 'makeglossaries -d '.$out_dir.' %N';
# $makeglossaries = 'makeglossaries -d '.$build_dir.' -s mystyle.sty %N';

# Additional customizations
$recorder = 1;  # Use -recorder with *latex
$latex = 'latex -output-directory='.$out_dir.' -aux-directory='.$out_dir.' %O %S';  # Redefine the latex command
