## Reading input files after unzip
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the 
#Baltimore City, Maryland (fips == "24510") from 1999 to 2008? 
#Use the base plotting system to make a plot answering this question.

#Subset Baltimore City, Maryland data only
NEI_Baltimore <- subset(NEI, fips == "24510")

#Sum rows on emissions per year
emissions_by_year_Baltimore <- tapply(NEI_Baltimore$Emissions, NEI_Baltimore$year, sum)

#plot the total emissions per year
png(filename = "Plot2.png", width = 480, height = 480)
barplot(emissions_by_year_Baltimore, col = "green", main = "Total Emissions Per Year in Baltimore")
dev.off ()
