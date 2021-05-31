filename=thesis
outdir=build
referenceFile=reference.bib
abstract=abstract
abstract-build=build/abstract




all: abstract
	mkdir -p ${outdir}/chapter &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${outdir} ${filename}.tex
	biber --output-directory ${outdir} ${filename}||true
	pdflatex -output-directory ${outdir} ${filename}.tex
	pdflatex -output-directory ${outdir} ${filename}.tex
	cp ${outdir}/${filename}.pdf . 

abstract: 
	mkdir -p ${abstract-build}/abstract-chapters &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${abstract-build} ${abstract}.tex
	biber --output-directory ${abstract-build} ${abstract}||true
	pdflatex -output-directory ${abstract-build} ${abstract}.tex
	pdflatex -output-directory ${abstract-build} ${abstract}.tex
	cp ${abstract-build}/${abstract}.pdf . 


	
clean:
	rm -r build/
