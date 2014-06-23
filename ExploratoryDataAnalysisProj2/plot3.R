library(ggplot2)

# reading the data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# filtering data for Baltimore City, Maryland
baltimore_data <- subset(NEI, NEI$fips=='24510')

# aggregating based on year and type
agg <- aggregate(Emissions ~ year + type, baltimore_data, sum)

# plotting it
qplot(x=year, y=Emissions, data=agg, geom=c("line")) + facet_wrap(~ type)

# copy plot to png
dev.copy(png, "plot3.png", width=480, height=480)

# close
dev.off()