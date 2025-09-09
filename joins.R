>Pet<-c("Cat","Dog","Bunny")
Weight<-c(12,70,3)
Pet1<-data.frame(Pet,Weight)
>Pet<-c("Cat","Dog","Hamster")
Color<-c("Black","Golden","Brown")
Pet2<-data.frame(Pet,Color)

#left join
left_join(Pet1, Pet2, by = "Pet")
#The primary key in this data is the column name that both tables have in common. Both tables share a Pet column, so Pet is the primary key in the command.

#right join
right_join(Pet1, Pet2, by = "Pet")
#This results in a missing value for Hamster weight, because Pet1 does not contain the key Hamster nor its weight. Right_join keeps all the values in y, which is the Pet2 table.
#No rows are deleted from either table.

#inner join
inner_join(Pet1, Pet2, by = "Pet")
#This results in no missing values since it matches pairs that have identical keys, in this case “Cat” and “Dog”. Both tables contain Cat and Dog values, so the values are combined.

#full join
full_join(Pet1, Pet2, by = "Pet")
#This results in a missing value for Hamster Weight and a missing value for Bunny Color.
#Bunny is in Pet1 but not Pet2, so it has a weight but no color.

