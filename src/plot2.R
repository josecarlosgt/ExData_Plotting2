# Total of Emissions per year in Baltimore City, Maryland  (Plot 2)

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (flips=="24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

source("./src/initialise.R")

NEIBalt = subset(NEI, fips=="24510")
NEIBaltYearly = aggregate(Emissions ~ year, data = NEIBalt, FUN = sum)

png("./figure/plot2.png")

with(NEIBaltYearly, plot(year, log10(Emissions), type="l", xlab="Year", ylab="Emissions (log scale)"))
title("Total of Emissions per Year for Baltimore City")

dev.off()