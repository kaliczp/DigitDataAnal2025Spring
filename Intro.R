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
