# Total of Emissions per year and type  (Plot 3)

# Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City?
# Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make a 
# plot answer this question.

source("./src/initialise.R")
library(ggplot2)

NEIBalt = subset(NEI, fips=="24510")
NEIBaltTypeYearly = aggregate(Emissions ~ year + type, data = NEIBalt, FUN = sum)

png("./figure/plot3.png")

g <- ggplot(NEIBaltTypeYearly, aes(y = log10(Emissions), x = year, color = type)) + 
  labs(title="Total of Emissions per Year and Type for Baltimore") +
  ylab(expression("PM"[2.5]*" emissions (log scale)")) +
  xlab("Year")
g + geom_line()

dev.off()

# Nicer way: (Using grids)
# ggplot(NEIBaltTypeYearly, aes(x=factor(year), y=Emissions, fill=type)) +
#  geom_bar(stat="identity") +
#  facet_grid(. ~ type) +
#  xlab("year") +
#  ylab(expression("total PM"[2.5]*" emission")) +
#  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
#                                     "City by various source types", sep="")))
