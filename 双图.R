rm(list = ls())

library(dplyr)
library(tidyr)
library(data.table)
library(ggplot2)
setwd('F:')
dir()

data <- fread('111.txt')
names(data)

colnames(data) <- c("female","FFA1","HOMA1","male","FFA","HOMA")

data1 <- na.omit(data)

data <- data %>% select(female,FFA1,HOMA1)
data1 <- data1 %>% select(male,FFA,HOMA)


data$female <- as.character(data$female)
data$female <- "female"
data1$male <- as.character(data1$male)
data1$male <- "male"

colnames(data) <- c("label","FFA","HOMA")
colnames(data1) <- c("label","FFA","HOMA")

sumdata <- rbind(data,data1)

sumdata$label <- as.factor(sumdata$label)


ggplot(sumdata)+
  geom_smooth(aes(x=FFA,y=HOMA, colour=label))+  #在此处可以补充formula和method的类型
  scale_x_continuous(breaks = c(0,1,2,3,4,5))















