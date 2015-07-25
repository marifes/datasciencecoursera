# Reading input files after unzip
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#How have emissions from motor vehicle sources changed 
#from 1999-2008 in Baltimore City?

#Subset Baltimore City, Maryland data only
NEI_Baltimore <- subset(NEI, fips == "24510")

#Subset vehicles codes from SCC
vehicles_SCC <- SCC[grep("vehicle", SCC$Short.Name, ignore.case = TRUE),]

#Select only the raws in the NEI Balitmore data that match the SCC vehicle codes
vehicles_NEI <- subset(NEI_Baltimore, vehicles_SCC$SCC %in% NEI_Baltimore$SCC)

#Add per year
vehicles_by_year <- tapply(vehicles_NEI$Emissions, vehicles_NEI$year, sum)

#Plot the graph
png(filename = "Plot5.png", width = 480, height = 480)
barplot(vehicles_by_year, col = "green", main = "Vehicle Emissions Per Year in Baltimore - 1999-2008")
dev.off ()
