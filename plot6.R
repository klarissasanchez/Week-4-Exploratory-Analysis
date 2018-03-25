##Reading the data
NEI <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Source_Classification_Code.rds")

##Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?
NEI_s <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",  ]
tot_year_fips <- aggregate(Emissions ~ year + fips, subsetNEI, sum)
tot_year_fips <- aggregate(Emissions ~ year + fips, NEI_s, sum)
tot_year_fips$fips[tot_year_fips$fips=="24510"] <- "Baltimore, MD"
tot_year_fips$fips[tot_year_fips$fips=="06037"] <- "Los Angeles, CA"
png("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Week 4 - Exploratory Analysis/plot6.png", width=640, height=480)
g <- ggplot(tot_year_fips, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g + geom_bar(stat="identity")  +
  +     xlab("year") +
  +     ylab(expression('Total PM'[2.5]*" Emissions")) +
  +     ggtitle('Total Emissions from motor vehicle (type=ON-ROAD) in Baltimore City, MD (fips = "24510") vs Los Angeles, CA (fips = "06037")  1999-2008')
print(g)
dev.off()