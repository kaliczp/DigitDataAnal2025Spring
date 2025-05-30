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

## Coordinate identification
plot(WadElbashir[-c(71,100), 2:3], asp = TRUE) # Without errors
WadOK <- WadElbashir[-c(71,100), ] # Save data withotu erroneous rows

## Look at sample numbers
plot(WadElbashir[-c(71,100), 2:3], asp = TRUE, col = "lightgray")
text(WadElbashir[-c(71,100), 2:3], labels = WadElbashir[-c(71,100), 1])
axis(2, at = 1496166, tck = 1)
axis(1, at = 674583, tck = 1)

plot(WadOK) # Scatterplot matrix again

## Look at sample numbers with corrected
plot(WadOK[, 2:3], asp = TRUE, col = "lightgray")
text(WadOK[, 2:3], labels = WadOK[, 1])

## Small analysis
plot(WadOK$DBH, WadOK$Hi) # Plot
Wad.lm <- lm(Hi ~ DBH, data = WadOK) # lm
abline(Wad.lm) # Visual result
Wad.lm
summary(Wad.lm) # No significant linear relationship

scatter.smooth(WadOK$DBH, WadOK$Hi) # Smoother
## remove outlier diameter
identify(WadOK$DBH, WadOK$Hi)

WadDBHok <- WadOK[-41,] # Remove large DBH
plot(WadDBHok$DBH, WadDBHok$Hi)
scatter.smooth(WadDBHok$DBH, WadDBHok$Hi)

## To save and reuse result
WadDBHsmooth <- loess.smooth(WadDBHok$DBH, WadDBHok$Hi)
lines(WadDBHsmooth, col = "brown", lwd =2)

## Analysis of variance
names(WadOK) <- c("SampleNo.", "N", "E", "DBH", "SpeciesType", "Hi", "Basel Area", "Volume", "Branches", "Crwon Dimeter")

WadAOV <- aov(Volume ~ SpeciesType, data = WadOK)
WadAOV
summary(WadAOV) # Volume not depends on tree species

WadAOV2 <- aov(Volume ~ SpeciesType + Branches, data = WadOK)
summary(WadAOV2) # Volume are not influneced any of tow variables

## Without 41 row erroneous DBH
names(WadDBHok) <- c("SampleNo.", "N", "E", "DBH", "SpeciesType", "Hi", "Basel Area", "Volume", "Branches", "Crwon Dimeter")

WadAOV3 <- aov(Volume ~ SpeciesType, data = WadDBHok)
summary(WadAOV3)
plot(WadAOV3)

WadAOV4 <- aov(Volume ~ SpeciesType + Branches, data = WadDBHok)
summary(WadAOV4) # Volume are not influneced any of tow variables
