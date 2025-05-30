## Creat an empty folder!
## Change in R the working directory In windows File -> Change dir..
## Check it!
getwd() # Print actual working directory
help(getwd) # Read the manual!
example(getwd) # Run examples from the manual page
WD # Write the content of the saved object
a <- 1 # Create an object contains a number (1)
letters # Object from the system contains downcase letters
LETTERS # Another object
LETTERS[2] # Second member of the upcase letters
search() # Look at the search path where are the objects of the system
d <- c("A","B") # An object with two letters.
e <- c(1,2,3) # An object with three numbers
1:10 # Teen num
letters[2:5] # Subset of letters
ls() # list of objects
?diag # Manual of diag() function
diag(10) # Print a 10x10 unity matrix
Mt <- diag(10) # Create an object from matrix above
ls() # list of object
Mt # print the content of Mt object
Mt[1,1] # Element in 1st row and 1st columnt
Mt[1,3] # Element in 1st row and 3rd column
as.character(1) # A number converted to character
as.data.frame(Mt) # The matrix saved into Mt is converted to data.frame
Mt.df <- as.data.frame(Mt) # ... and saved into Mt.df object
ls() # list
str(c) # structure (short description) of objects
str(e)
str(Mt)
str(Mt.df)
Mt.df$V1 # First column (variable) of Mt.df object

dir() # List the files from the working directory (folder)
rm(list=ls()) # remove ALL the existing objects
help.start() # Open a browser window with help

## Import file
Soil.df <- read.csv("Soil Data_Alshfa.csv") # Save data into object called Soil.df
NA # Not Available
str(Soil.df) # Overview of the new data.frame
Soil.df # Write the name of the object to look the content
summary(Soil.df)
Soil.df[,5] # Only fifth column
sum(Soil.df[,5]) # sum of all element in the 5th column
sum(Soil.df[,5], na.rm = TRUE) / 7 # Calculate the mean
TRUE;FALSE # The two possible logical values this is not character, this has special meaning
mean(Soil.df[,5], na.rm = TRUE) # Calculation of the mean with function
mean(Soil.df$CaCO3..., na.rm = TRUE) # Same as above but indexing
plot(Soil.df) # Scatter-plot matrix
plot(Soil.df$X,Soil.df$Y, asp = TRUE) # There is an extra point
Soil.df[,2:3] # Cearly identifiable 2nd is wrong
plot(Y ~ X, Soil.df[-2, c("X","Y")], asp = TRUE) # 2nd row removed an X and Y columns are used, with tilde (~) axies assigned

## Graphical identification of error
locator(1) # Prints the coordinate of clicking in the graph
identify(Soil.df$X,Soil.df$Y) # Identify the wrong coordinates

## Manipulation of dataset
Soil.df[2,3] <- 2158269 # Overwrite the wrong coordinate
SoilOK.df <- Soil.df[1:7,] # Remove the empty rows
summary(SoilOK.df) # Check again summary

## Export dataset
write.csv(SoilOK.df, "SoilOK.csv")

## Plots and export
plot(SoilOK.df$X,SoilOK.df$Y, asp = TRUE) # Plot OK dataset points with coordinates

pdf() # Open a pdf file
plot(SoilOK.df$X,SoilOK.df$Y, asp = TRUE) #Make plot
dev.off() # Close file

jpeg(width = 18, height = 18, units = "cm", res = 300) # Open a jpeg file
plot(SoilOK.df$X,SoilOK.df$Y, asp = TRUE, xlab = "X", ylab = "Y", main = "Sampling points") # Make plot with custom labs a title
grid() # Grid lines to better identifications
points(SoilOK.df$X,SoilOK.df$Y, col = "brown", lwd = 3) # Overwrite the points to better points and color and line width modified
text(SoilOK.df$X,SoilOK.df$Y, SoilOK.df$ID, adj = c(-0.5,0.5))
dev.off() # Close file

## Boxplot visualisation Tukey five numbers
SoilOK.df[,c(9,11,12)] # Selected variables for comparison
summary(SoilOK.df[,c(9,11,12)]) # Summary of selected variables
boxplot(SoilOK.df[,c(9,11,12)]) # Graphical summary of variables

## Regression
plot(SoilOK.df) # Scatterplot matrix for variable selection
plot(SAR ~ Na, data=SoilOK.df) # plot the selected variables
lm(SAR ~ Na, data=SoilOK.df) # Linear model
Model <- lm(SAR ~ Na, data=SoilOK.df) # Save result in an object
str(Model) # See the structure of result
Model$coefficients # Access list elements
Model$coefficients[1] + Model$coefficients[2] *200 # Predict SAR based on 200 cc of NA
predict(Model, newdata=data.frame(Na = 200)) # Same prediction as above
points(x = 200, y = predict(Model, newdata=data.frame(Na = 200)), col = "red") # See the prediction
points(x = c(100,200,300), y = predict(Model, newdata=data.frame(Na = c(100,200,300)))) # More points
abline(Model) # visualise result
summary(Model) # See summary
identify(SoilOK.df$Na, SoilOK.df$SAR) # Identify residuals
plot(Model) # graphical tests
## Model without intercept
Modelnoint <- lm(SAR ~ Na - 1, data=SoilOK.df)
summary(Modelnoint)
abline(Modelnoint, col = "blue")
plot(Modelnoint)
?plot.lm # Read manual of regression diagnostics plot

## Generate artifical points
Gener.df <- data.frame(Na = sample(2:500, 50)) # Generate 50 random points between 2 and 500
Gener.df$SAR <- Gener.df$Na * 0.31566 + rnorm(50, sd = 10) # Generate pairs based on regression
plot(SAR ~ Na, data = Gener.df, xlim = c(0,500), ylim = c(0,170)) # Plot generated data
points(SAR ~ Na, data = SoilOK.df, col = "red", lwd = 3) # Put original point on it

## Home work
## Make a regression analysis for Gener.df
