## Reading input files after unzip
NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")

#Of the four types of sources indicated by the type 
#(point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions 
#from 1999-2008 for Baltimore City? 
#Which have seen increases in emissions from 1999-2008? 
#Use the ggplot2 plotting system to make a plot answer this question.

library(ggplot2)

#Subset Baltimore City, Maryland data only
NEI_Baltimore <- subset(NEI, fips == "24510")


#plot a bar chart for each of the different types of emissions
gp <- ggplot(NEI_Baltimore, aes(factor(year), Emissions, fill=type)) +
        geom_bar(stat="identity") + facet_grid(.~type) +
        labs(x= "Year", y = "PM2.5 Total Emissions", title = "PM2.5 Emissions in Baltimore by type. 1999 to 2008")
png(filename = "Plot3.png", width = 480, height = 480)
print (gp)
dev.off ()
