setwd("C:/Users/Tugu/Downloads/iris/")
getwd()

files = list.files(pattern="*.dat")
files


for (file in files){
  if (!exists("df_iris_tot1")){
    df_iris_tot1 <- read.table(file, header=FALSE, sep=",", skip= 9)
  }
  if (exists("df_iris_tot1")){
    temp_dataset <-  read.table(file, header=FALSE, sep=",", skip=9)
    df_iris_tot1 <- rbind(df_iris_tot1, temp_dataset)
    rm(temp_dataset)
  }
}

View(df_iris_tot1)


install.packages("XML")
library("XML")
library("methods")
xmldataframe <- xmlToDataFrame("C:/Users/Tugu/Downloads/iris.xml")
print(xmldataframe)

install.packages("rjson")
library("rjson")
install.packages("jsonlite")
library("jsonlite")

write_json(xmldataframe,"C:/Users/Tugu/Downloads/iris.json")
write_json(df_iris_tot1, "C:/Users/Tugu/Downloads/iris_joined.json")
read_json("C:/Users/Tugu/Downloads/iris.json")
read_json("C:/Users/Tugu/Downloads/iris_joined.json")

iris_data<- fromJSON("C:/Users/Tugu/Downloads/iris.json")
iris_joined_data <- fromJSON("C:/Users/Tugu/Downloads/iris_joined.json")

names(iris_data)
names(iris_joined_data)

  library(dplyr)
select(iris_data, starts_with("Petal"))

filter(iris_data, (!is.na(Species)))

arrange(iris_data , desc(Petal.Length))

rename(iris_data, petal_length = Petal.Length)

iris_data %>% as_tibble() %>% mutate(
  Species_New = Species
)

iris_data %>% 
  group_by(Species) %>%
  summarise(Sepal.Length =n())