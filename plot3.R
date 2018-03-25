##Reading the data
NEI <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Source_Classification_Code.rds")

##Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.
NEI_fips  <- NEI[NEI$fips=="24510", ]
tot_year_type <- aggregate(Emissions ~ year + type, NEI_fips, sum)
png("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Week 4 - Exploratory Analysis/plot3a.png", width=640, height=480)
g <- ggplot(tot_year_type, aes(year, Emissions, color = type))
g <- g + geom_line() +
  +     xlab("year") +
  +     ylab(expression('Total PM'[2.5]*" Emissions")) +
  +     ggtitle('Total Emissions in Baltimore City, Maryland (fips == "24510") from 1999 to 2008')
print(g)
dev.off()