# Reading input files after unzip
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Compare emissions from motor vehicle sources in Baltimore City 
#with emissions from motor vehicle sources in 
#Los Angeles County, California (fips == "06037"). 
#Which city has seen greater changes over time in 
#motor vehicle emissions?

#Get the code for vehicle emissions
vehicles_SCC <- SCC[grep("vehicle", SCC$Short.Name, ignore.case = TRUE),]

#Get the NEI for Baltimore
NEI_Baltimore <- subset(NEI, fips == "24510")

#Select only the raws in the NEI Balitmore data that match the SCC vehicle codes
vehicles_NEI <- subset(NEI_Baltimore, vehicles_SCC$SCC %in% NEI_Baltimore$SCC)

#Add per year
vehicles_by_year_baltimore <- tapply(vehicles_NEI$Emissions, vehicles_NEI$year, sum)

#Get the NEI for L.A.
NEI_LA <- subset(NEI, fips == "06037")

#Select only the raws in the NEI LA data that match the SCC vehicle codes
vehicles_NEI_LA <- subset(NEI_LA, vehicles_SCC$SCC %in% NEI_LA$SCC)

#Add per year
vehicles_by_year_LA <- tapply(vehicles_NEI_LA$Emissions, vehicles_NEI_LA$year, sum)

#Plot Side by Side Baltimore and LA
png(filename = "Plot6.png", width = 480, height = 480)
par (mfrow = c(2,1))
barplot(vehicles_by_year_baltimore, col = "blue", main = "Vehicle Emissions Per Year in Baltimore - 1999-2008")
barplot(vehicles_by_year_LA, col = "green", main = "Vehicle Emissions Per Year in LA - 1999-2008")
dev.off ()

