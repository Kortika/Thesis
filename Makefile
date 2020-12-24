filename=thesis
outdir=build

all:
	mkdir build &>/dev/null || true				# create main build folder for .aux files etc
	mkdir build/chapter &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${outdir} ${filename}.tex
	bibtex ${filename}||true
	pdflatex -output-directory ${outdir} ${filename}.tex
	pdflatex -output-directory ${outdir} ${filename}.tex

clean:
	rm -r build/
