##Reading the data
NEI <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Source_Classification_Code.rds")

##How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?
library(ggplot2)
NEI_onroad <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",  ]
tot_per_year4 <- aggregate(Emissions ~ year, NEI_onroad, sum)
png("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Week 4 - Exploratory Analysis/plot5.png", width=640, height=480)
g <- ggplot(tot_per_year4, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") +
  +     xlab("year") +
  +     ylab(expression('Total PM'[2.5]*" Emissions")) +
  +     ggtitle('Total Emissions from motor vehicle (type = ON-ROAD) in Baltimore City, Maryland (fips = "24510") from 1999 to 2008')
print(g)
dev.off()