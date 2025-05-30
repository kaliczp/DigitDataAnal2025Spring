### Import dataset directly from excel
## If not installed install readxl package
## install.packages("readxl")
library(readxl)
WadElbashir <- as.data.frame(read_excel("Wad Elbashir.xlsx"))

## Look at dataset
str(WadElbashir)
summary(WadElbashir)
## Convert tree species (categorical variable) to factor
WadElbashir[, "Species Type"] <- factor(WadElbashir[, "Species Type"])

## Visualisation
plot(WadElbashir) # Scatterplot matrix
plot(WadElbashir$DBH, WadElbashir[,"Basel Area"]) # Functional relationship
plot(WadElbashir$DBH, WadElbashir$Hi) # Random relationship
plot(WadElbashir$DBH, WadElbashir[,"Volum/m3"]) # Random relationship
plot(WadElbashir$E, WadElbashir$N, asp = TRUE) # Coordinates

## Find erroneous coordinates
plot(WadElbashir$E, WadElbashir$N, asp = TRUE) # Coordinates
identify(WadElbashir$E, WadElbashir$N) # Identify outliers
WadElbashir[c(1, 71, 100), ] # Look at erroneous cordinate
WadElbashir[70:103, 2:6] # Neighbours 71 duplication of 73, 102 of 100

## Coordinate correction
plot(WadElbashir[-c(71,100), 2:3], asp = TRUE) # Without errors
