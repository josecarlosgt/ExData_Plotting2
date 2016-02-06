# Total of Emissions for Motor Vehicle Sources  (Plot 5)

# How have emissions from motor vehicle sources changed from 1999–2008 in Baltimore City?

source("./src/initialise.R")

NEIVBalt = NEI[(NEI$fips=="24510") & (NEI$type=="ON-ROAD"),]
NEIVBaltYearly = aggregate(Emissions ~ year, data = NEIVBalt, FUN = sum)

png("./figure/plot5.png")

ggplot(NEIVBaltYearly, aes(x=factor(year), y=Emissions)) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emissions")) +
  ggtitle("Total of emissions from motor vehicle sources for Baltimore")

dev.off()
