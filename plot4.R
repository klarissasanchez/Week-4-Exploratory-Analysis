##Reading the data
NEI <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Source_Classification_Code.rds")

##Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?
NEI_SCC <- merge(NEI, SCC, by="SCC")
library(ggplot2)
coal_1 <- grepl("coal", NEI_SCC$Short.Name, ignore.case=TRUE)
NEI_SCC_s <- NEI_SCC[coal_1, ]
tot_per_year3 <- aggregate(Emissions ~ year, NEI_SCC_s, sum)
png("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Week 4 - Exploratory Analysis/plot4.png", width=640, height=480)
g <- ggplot(tot_per_year3, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  +     xlab("year") +
  +     ylab(expression('Total PM'[2.5]*" Emissions")) +
  +     ggtitle('Total Emissions from coal sources from 1999 to 2008')
print(g)
dev.off()