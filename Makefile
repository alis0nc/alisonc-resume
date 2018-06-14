TEX = pdflatex -shell-escape -interaction=nonstopmode -file-line-error

all : resume full pub full_pub

resume: resume.tex
	$(TEX) -jobname=resume "\input{resume}"

full: resume.tex
	$(TEX) -jobname=resume_full "\def\SHALEM{}\input{resume}"

pub: resume.tex
	$(TEX) -jobname=resume_pub "\def\PUBLIC{}\input{resume}"

full_pub: resume.tex
	$(TEX) -jobname=resume_full_pub "\def\SHALEM{}\def\PUBLIC{}\input{resume}"


