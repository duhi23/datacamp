

install.packages("devtools", dependencies = TRUE)
library("devtools")
install_github("data-camp/datacamp")
library("datacamp")

ls("package:datacamp")
author_chapter("ranalysis")


# recommended:
install_github("data-camp/datacampAPI")
install_github("data-camp/testwhat")
library("testwhat")
