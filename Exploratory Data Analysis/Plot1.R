## Reading input files after unzip
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States 
#from 1999 to 2008? Using the base plotting system, 
#make a plot showing the total PM2.5 emission from all sources 
#for each of the years 1999, 2002, 2005, and 2008.

#Sum rows on emissions per year
emissions_by_year <- tapply(NEI$Emissions, NEI$year, sum)

#plot the total emissions per year
png(filename = "Plot1.png", width = 480, height = 480)
barplot(emissions_by_year, col = "green", main = "Total Emissions Per Year")
dev.off ()