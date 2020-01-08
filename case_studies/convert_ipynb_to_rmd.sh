FILE=$1
./remove_output.py -o temp.ipynb $1
jupyter nbconvert --to markdown temp.ipynb
NEWFILE=${FILE%ipynb}rmd
sed -e 's/```R/```{r}/' -e 's/open_progress=FALSE/open_progress=FALSE/' < temp.md > $NEWFILE
rm temp.ipynb temp.md
