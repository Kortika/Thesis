filename=thesis
outdir=build
referenceFile=reference.bib
all:
	mkdir build &>/dev/null || true				# create main build folder for .aux files etc
	mkdir build/chapter &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${outdir} ${filename}.tex
	biber --output-directory ${outdir} ${filename}||true
	pdflatex -output-directory ${outdir} ${filename}.tex
	pdflatex -output-directory ${outdir} ${filename}.tex
	
clean:
	rm -r build/
