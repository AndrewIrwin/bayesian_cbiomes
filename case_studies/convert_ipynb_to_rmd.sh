# convert R.ipynb to .rmd
# a few steps:
# - remove output from jupyter notebook
# - convert jupyter notebook to markdown
# - fix two translation "errors": ```R becomes ```{r} and open_progress=FALSE
# - rename file
# - cleanup
FILE=$1
./remove_output.py -o temp.ipynb $1
jupyter nbconvert --to markdown temp.ipynb
NEWFILE=${FILE%ipynb}rmd
sed -e 's/```R/```{r}/' -e 's/open_progress=TRUE/open_progress=FALSE/' < temp.md > $NEWFILE
rm temp.ipynb temp.md
