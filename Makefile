filename=thesis
outdir=build
referenceFile=reference.bib
abstract=abstract
abstractBuild=build/abstract
abstractChapters=abstract-chapters
abstractDutch=abstract_dutch




all: abstract abstract_dutch
	mkdir -p ${outdir}/chapter &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${outdir} ${filename}.tex
	biber --output-directory ${outdir} ${filename}||true
	pdflatex -output-directory ${outdir} ${filename}.tex
	pdflatex -output-directory ${outdir} ${filename}.tex
	cp ${outdir}/${filename}.pdf . 

abstract: 
	mkdir -p ${abstractBuild}/${abstractChapters} &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${abstractBuild} ${abstract}.tex
	biber --output-directory ${abstractBuild} ${abstract}||true
	pdflatex -output-directory ${abstractBuild} ${abstract}.tex
	pdflatex -output-directory ${abstractBuild} ${abstract}.tex
	cp ${abstractBuild}/${abstract}.pdf . 

abstract_dutch: 
	mkdir -p ${abstractBuild}/${abstractChapters}/dutch &>/dev/null || true 	# create chapter subfolder for .aux files etc
	pdflatex -output-directory ${abstractBuild} ${abstractDutch}.tex
	biber --output-directory ${abstractBuild} ${abstractDutch}||true
	pdflatex -output-directory ${abstractBuild} ${abstractDutch}.tex
	pdflatex -output-directory ${abstractBuild} ${abstractDutch}.tex
	cp ${abstractBuild}/${abstractDutch}.pdf . 

	
clean:
	rm -r build/
