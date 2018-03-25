##Reading the data
NEI <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/summarySCC_PM25.rds")
SCC <- readRDS("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Source_Classification_Code.rds")

##Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.
tot_per_year <- aggregate(Emissions ~ year, NEI, sum)

##Plotting
png("C:/Users/Klarissa/Documents/ACADEMICS/Data Science Track/Data/Week 4 - Exploratory Analysis/plot1.png", width=480, height=480)

barplot(height=tot_per_year$Emissions, names.arg=tot_per_year$year, xlab="years", ylab=expression('total PM'[2.5]*' emission'),main=expression('Total PM'[2.5]*' emissions at various years'))

dev.off()