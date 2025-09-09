#Swirl project: Mortality Rates
#Step 1: Install these libraries
library(tidyverse) #installs tidyverse library
install.packages("ggpmisc") #installs ggpmisc package
library(ggpmisc) #installs ggpmisc library


#Step 2. Recognize the first column (Age)
VADeaths1<-as.data.frame(VADeaths) #Converts the data to a dataframe
VADeaths2<- tibble::rownames_to_column(VADeaths1, "Age") #Converts the data to a tibble (table) with the 1st column being Age

#Step 3. Use pivot_longer(),separate(), and mutate()
#Part A:pivot_longer() to combine location and sex:
VADeaths_long <- VADeaths2 %>%
  pivot_longer(cols = -Age, names_to = "Location_Sex", values_to = "Rate")
#This pivots all columns except for age (-age is the exception), moves the original location/sex columns (rural female, rural male, etc.) to a new column “Location_Sex”, and store the mortality rates in a new column “Rate”.


#Part B: separate() to split the Location_Sex column:
VADeaths_separated <- VADeaths_long %>%
  separate(Location_Sex, into = c("Location", "Sex"), sep = " ")
#This splits Location_Sex into 2 columns, Location and Sex, separated by a space. "Urban male" would be split into "location: urban" and "sex: male".

#Part C: separate() to split the age column
VADeaths_ages <- VADeaths_separated %>%
  separate(Age, into = c("LowAge", "HighAge"), sep = "-")
#This splits Age into 2 columns, LowAge and HighAge, separated by dash. “70-74” would be converted to “LowAge: 70” and “HighAge: 74”.

#Part d: mutate() to calculate the average age:
VADeaths3 <- VADeaths_ages %>%
  mutate(
    LowAge = as.integer(LowAge),   
    HighAge = as.integer(HighAge),
    AvgAge = (LowAge + HighAge) / 2 #Creates an Average Age column by simple math
  )
#This converts LowAge and HighAge to an integer data type. 

#mutate() convert Rate and AvgAge to dbl:
VADeaths4 <- VADeaths3 %>%
  mutate(
    Rate = as.numeric(Rate),
    AvgAge = as.numeric(AvgAge)
  )
#This converts Rate and AvgAge into numeric data types (doubles) so it matches the final table

#Step 4. Build ggplot
ggplot(VADeaths4, aes(x = AvgAge, y = Rate, color = Sex, shape = Location)) + 
  geom_point(size = 4) +  # Points to represent Rate vs AvgAge
  labs(
    title = "Mortality Rates by Location, Sex, and Average Age",
    subtitle = "Comparison of Urban and Rural Mortality Rates across Different Age Groups",
    x = "Average Age", #Labels X Axis
    y = "Mortality Rate", #Labels Y Axis
    caption = "Paulina Mostek" #Caption is my name
  )
#This graph uses each of the 4 variables Age, Rate, Sex, and Location.
