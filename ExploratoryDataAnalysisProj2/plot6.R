# reading the data
library(ggplot2)

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# grepping for motor vehicle sources, using type as "ON-ROAD"
motor_vehicle_emission <- subset(NEI, NEI$type=='ON-ROAD')

# filtering data for Baltimore City, Maryland & Los Angeles
city_data <- subset(motor_vehicle_emission, motor_vehicle_emission$fips=='24510' | motor_vehicle_emission$fips=='06037')
  
# aggregating total emissions for each year
agg <- aggregate(Emissions ~ year + fips, city_data, sum)

# function to assign city names
city_labeller <- function(var, value){
  value <- as.character(value)
  if (var=="fips") { 
    value[value=="24510"] <- "Baltimore City"
    value[value=="06037"]   <- "Los Angeles"
  }
  return(value)
}

# plotting it
qplot(x=year, y=Emissions, data=agg, geom=c("line"), main="A") + facet_grid(~ fips, labeller=city_labeller) 

# copy plot to png
dev.copy(png, "plot6.png", width=480, height=480)

# close
dev.off()