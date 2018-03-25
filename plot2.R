##Reading the data
NEI <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.
tot_per_year2 <- aggregate(Emissions ~ year, NEI_fips, sum)


png("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Week 4 - Exploratory Analysis/plot2.png", width=480, height=480)
barplot(height=tot_per_year2$Emissions, names.arg=tot_per_year2$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' in the Baltimore City, MD emissions at various years'))
dev.off()