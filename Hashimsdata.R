### Import dataset directly from excel
## If not installed install readxl package
## install.packages("readxl")
library(readxl)
WadElbashir <- as.data.frame(read_excel("Wad Elbashir.xlsx"))

## Look at dataset
str(WadElbashir)
summary(WadElbashir)
WadElbashir[, "Species Type"] <- factor(WadElbashir[, "Species Type"])
