# Reading input files after unzip
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Across the United States, how have emissions 
#from coal combustion-related sources changed from 1999-2008?


#subset all the codes that are combustion related in the short name
combustion <- SCC[grep("comb", SCC$Short.Name, ignore.case = TRUE),]
#subset those that have a coal origin in level four
coal_combustion <- combustion[grep ("coal", combustion$SCC.Level.Four, ignore.case= TRUE),]


#Select only the raws in NEI that match those SCC codes of coal combustion
coal_combustion_NEI <- subset(NEI, coal_combustion$SCC %in% NEI$SCC)
# Add emissions per year
coal_combustion_by_year <- tapply(coal_combustion_NEI$Emissions, coal_combustion_NEI$year, sum)

#plot the total emissions per year
png(filename = "Plot4.png", width = 480, height = 480)
barplot(coal_combustion_by_year, col = "green", main = "Coal Combustion Emissions Per Year")
dev.off ()