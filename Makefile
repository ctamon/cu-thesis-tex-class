all: main.tex
	bibtex main; pdflatex main.tex; pdflatex main.tex

clean:
	rm -f *.log *.aux 
