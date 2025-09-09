PetType<-c("Dog","Dog","Cat","Bunny","Cat","Bunny")
Weight<-c(50,70,20,2,25,3)
PetInfo<-data.frame(PetType,Weight)
PetInfo
aggregate(PetInfo$Weight,by=list(PetInfo$PetType),FUN=mean)
aggregate(PetInfo$Weight,by=list(PetInfo$PetType),FUN=max)
aggregate(PetInfo$Weight,by=list(PetInfo$PetType),FUN=min)
aggregate(PetInfo$Weight,by=list(PetInfo$PetType),FUN=sum)

#GGplot
?iris
ggplot(data = iris) +
  +     geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species)) #Basic plot

#Detailed plot
ggplot(data = iris) + 
  +     geom_point(mapping = aes(x = Petal.Length, y = Petal.Width, color = Species)) +
  +     labs(title = "Petal Length and Width of Iris Flowers", subtitle = "Measured in centimeters (cm)", caption = "Data from Fisher's iris dataset")