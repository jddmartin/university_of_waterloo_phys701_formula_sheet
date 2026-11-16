source := university_of_waterloo_phys701_formula_sheet

$(source)_generated.pdf : $(source).tex
	rm -f *_generated*
	for number in 1 2 ; do \
	  lualatex -shell-escape -halt-on-error -jobname $(source)_generated \
            $(source).tex ; \
	  if [ ! -s $(source)_generated.pdf ]; then \
		rm -f *_generated* ; \
          fi ; \
	done
	pdftk A="university_of_waterloo_phys701_formula_sheet_generated.pdf" cat A1-5 output "phys701_short_formula_sheet_generated.pdf" 
	rm -f *_generated.aux *_generated.toc *_generated.log *_generated.out
