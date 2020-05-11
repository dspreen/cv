## Put this Makefile in your project directory---i.e., the directory
## containing the paper you are writing. Assuming you are using the
## rest of the toolchain here, you can use it to create .html, .tex,
## and .pdf output files from
## your markdown file.
## -	Change the paths at the top of the file as needed.
## -	Using `make` without arguments will generate html, tex, and pdf
## 	output files from all of the files with the designated markdown
##	extension. The default is `.md` but you can change this.
## -	You can specify an output format with `make tex`, `make pdf` or
## - 	`make html`.
## -	Doing `make clean` will remove all the .tex, .html, and .pdf files
## 	in your working directory. Make sure you do not have files in these
##	formats that you want to keep!

## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## Source directory
SDIR = markdown/

## All markdown files in the working directory
PDFSRC = $(SDIR)/1-CV.md $(SDIR)/2-Education.md $(SDIR)/3a-Employment.md $(SDIR)/4-Publications.md $(SDIR)/5-Grants\ and\ Fellowships.md $(SDIR)/6-Conference\ Participation.md $(SDIR)/7-Teaching\ Experience.md $(SDIR)/8-Media\ Coverage.md $(SDIR)/9-DepartmentalUniversity\ Service.md $(SDIR)/10-Languages.md $(SDIR)/11-Technical\ Skills.md $(SDIR)/13-References.md

HTMLSRC = $(SDIR)/2-Education.md $(SDIR)/3b-Employment-html.md $(SDIR)/4-Publications.md $(SDIR)/5-Grants\ and\ Fellowships.md $(SDIR)/6-Conference\ Participation.md $(SDIR)/7-Teaching\ Experience.md $(SDIR)/8-Media\ Coverage.md $(SDIR)/10-Languages.md $(SDIR)/11-Technical\ Skills.md


all:	clean html pdf

html:	clean results/dspreen-CV.html
pdf:	clean results/dspreen-CV.pdf

results/dspreen-CV.html: $(HTMLSRC)
	pandoc -o results/dspreen-CV.html $(HTMLSRC)

results/dspreen-CV.pdf: $(PDFSRC)
	pandoc --template templates/svm-latex-cv.tex -o results/dspreen-CV.pdf --pdf-engine=xelatex $(PDFSRC)

clean:
	rm -f results/*.html results/*.docx results/*.pdf
