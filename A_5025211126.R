#SOAL NO 1
sebelum <- c(78, 75, 67, 77, 70, 72, 78, 74, 77)
sesudah <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)
selisih <- sesudah - sebelum

#1a
sd(selisih)

#1b
t.test(sesudah, sebelum, alternative = "two.sided", paired = TRUE, mu = 0)
t.test(sesudah, sebelum, alternative = "two.sided", paired = TRUE, mu = 0)$p.value

#1c
# Terlampir pada laporan

#SOAL NO 2

#2a
# Terlampir pada laporan

#2b
library(BSDA)
zsum.test(mean.x = 23500, sigma.x = 3900, n.x = 100, mu = 20000, alternative = "greater")
qnorm(p = 0.05, mean = 0, sd = 1, lower.tail = FALSE)

#2c
# Terlampir pada laporan

#SOAL NO 3
library(BSDA)

#3a
# Terlampir pada laporan

#3b
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "two.sided", var.equal = TRUE)

#3c
tsum.test(mean.x = 3.64, s.x = 1.67, n.x = 19, mean.y = 2.79, s.y = 1.32, n.y = 27, alternative = "two.sided", var.equal = TRUE)$statistic

#3d
qt(p = 0.025, df = 44, lower.tail = TRUE)
qt(p = 0.025, df = 44, lower.tail = FALSE)

#3e
# Terlampir pada laporan

#3f
# Terlampir pada laporan

#SOAL NO 4

myData <- read.table("https://rstatisticsandresearch.weebly.com/uploads/1/0/2/6/1026585/onewayanova.txt", header = TRUE)
myData$Group <- as.factor(myData$Group)
myData$Group <- factor(myData$Group, labels = c("Oren", "Hitam", "Putih"))

#4a
Group1 <- subset(myData, Group == "Oren")
Group2 <- subset(myData, Group == "Hitam")
Group3 <- subset(myData, Group == "Putih")

qqnorm(Group1$Length, col = "orange", lwd = 2)
qqline(Group1$Length, col = "orange", lwd = 2)

qqnorm(Group2$Length, lwd = 2)
qqline(Group2$Length, lwd = 2)

qqnorm(Group3$Length, col = "grey", lwd = 2)
qqline(Group3$Length, col = "grey", lwd = 2)

#4b
bartlett.test(Length~Group, data = myData)

#4c
model1 <- lm(Length~Group, data = myData)
anova(model1)

#4d
# Terlampir pada laporan

#4e
TukeyHSD(aov(model1))

#4f
library(ggplot2)
ggplot(myData, aes(x = Group, y = Length)) + geom_boxplot(fill = "gray50", colour = "black") + scale_x_discrete() + xlab("Spesies") + ylab("Panjang (cm)")

#SOAL NO 5
myData <- read.csv("https://drive.google.com/u/0/uc?id=1aLUOdw_LVJq6VQrQEkuQhZ8FW43FemTJ&export=download")
myData$Glass <- as.factor(myData$Glass)
myData$Temp <- as.factor(myData$Temp)

str(myData)

#5a
qplot(x = Temp, y = Light, data = myData) + facet_grid(.~Glass) + geom_point()

#5b
summary(aov(Light ~ Glass*Temp, data = myData))

#5c
library(dplyr)
treatment_summary <- group_by(myData, Glass, Temp) %>% summarise(mean = mean(Light), sd = sd(Light)) %>% arrange(desc(mean))
treatment_summary

#5d
TukeyHSD(aov(Light ~ Glass*Temp, data = myData))

#5e
library(multcompView)
tukey <- TukeyHSD(aov(Light ~ Glass*Temp, data = myData))
anova <- aov(Light ~ Glass*Temp, data = myData)

result <- multcompLetters4(anova, tukey)
result

cld <- as.data.frame.list(result$`Glass:Temp`)
treatment_summary$CLD <- cld$Letters
treatment_summary

