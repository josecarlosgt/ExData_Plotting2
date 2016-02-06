# Total of Emissions for Motor Vehicle Sources: Baltimore Vs. Los Angeles  (Plot 5)

# Compare emissions from motor vehicle sources in Baltimore City with emissions
# from motor vehicle sources in Los Angeles County, California (flips="06037").
# Which city has seen greater changes over time in motor vehicle emissions?

source("./src/initialise.R")
library(ggplot2)

NEIVBalt = NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
NEIVLA = NEI[(NEI$fips=="06037") & (NEI$type=="ON-ROAD"),]
NEIVBaltYearly = aggregate(Emissions ~ year, data = NEIVBalt, FUN = sum)
NEIVLAYearly = aggregate(Emissions ~ year, data = NEIVLA, FUN = sum)

NEIVBaltYearly$City <- "Baltimore City"
NEIVLAYearly$City <- "Los Angeles County"
NEIVBatlLAYearly <- rbind(NEIVBaltYearly, NEIVLAYearly)

png("./figure/plot6.png")

ggplot(NEIVBatlLAYearly, aes(x=factor(year), y=Emissions, fill=City)) +
  geom_bar(stat="identity") +
  facet_grid(City  ~ ., scales="free") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emissions")) +
  ggtitle("Emissions from Motor Vehicle - Baltimore Vs. Los Angeles")

dev.off()
