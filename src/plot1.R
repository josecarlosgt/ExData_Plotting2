# Total of Emissions per Year (Plot 1)

# Have total emissions from PM2.5 decreased in the United States from 1999 to 2008?
# Using the base plotting system, make a plot showing the total PM2.5 emission from all
# sources for each of the years 1999, 2002, 2005, and 2008.

source("./src/initialise.R")

NEIYearly = aggregate(Emissions ~ year, data = NEI, FUN = sum)

png("./figure/plot1.png")

with(NEIYearly, plot(year, log10(Emissions), type="l", xlab="Year", ylab="Emissions (log scale)"))
title("Total of Emissions per Year")

dev.off()