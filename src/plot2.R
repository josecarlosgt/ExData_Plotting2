# Total of Emissions per year in Baltimore City, Maryland  (Plot 2)

# Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (flips=="24510") 
# from 1999 to 2008? Use the base plotting system to make a plot answering this question.

source("./src/initialise.R")

NEIBalt = subset(NEI, fips=="24510")
NEIBaltYearly = aggregate(Emissions ~ year, data = NEIBalt, FUN = sum)

png("./figure/plot2.png")

barplot(NEIBaltYearly$Emissions, names.arg=NEIBaltYearly$year,
        xlab="Year", ylab=expression("PM"[2.5]*" emissions"), main="Total of Emissions per Year for Baltimore"       
)

dev.off()
