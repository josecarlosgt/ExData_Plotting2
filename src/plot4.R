# Total of Emissions for Combustion-related Sources  (Plot 4)

# Across the United States, how have emissions from coal combustion-related sources changed from 1999–2008?

source("./src/initialise.R")
library(ggplot2)

# Find coal combustion-related sources
is_cc <- grepl("Fuel Comb.*Coal", SCC$EI.Sector)
cc_sources <- SCC[is_cc,]

# Another option for subsetting: NEI[(NEI$SCC %in% cc_sources$SCC), ]
NEICCC = subset(NEI, NEI$SCC %in% cc_sources$SCC)

NEICCTYearly = aggregate(Emissions ~ year, data = NEICCC, FUN = sum)

png("./figure/plot4.png")

ggplot(NEICCTYearly, aes(x=factor(year), y=Emissions/1000)) +
  geom_bar(stat="identity") +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emissions (x1000)")) +
  ggtitle("Total of Emissions from Coal Combustion-related Sources")

dev.off()
