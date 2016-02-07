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

# Old way:
# g <- ggplot(NEIBaltTypeYearly, aes(y = log10(Emissions), x = year, color = type)) + 
#  labs(title="Total of Emissions per Year and Type for Baltimore") +
#  ylab(expression("PM"[2.5]*" emissions (log scale)")) +
#  xlab("Year")
# g + geom_line()

# Nicer way: (Using grids)
ggplot(NEIBaltTypeYearly, aes(x=factor(year), y=Emissions, fill=type)) +
  geom_bar(stat="identity") +
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) +
  facet_grid(. ~ type) +
  xlab("Year") +
  ylab(expression("Total PM"[2.5]*" emission")) +
  ggtitle(expression("PM"[2.5]*paste(" Emissions in Baltimore ",
                                     "City by Various Source Types", sep="")))

# Another way: (Without grids)
# ggplot(NEIBaltTypeYearly, aes(x=factor(year), fill=type, y=Emissions)) +
#  geom_bar(stat="identity", position="dodge") +
#  geom_bar(stat="identity") +
#  facet_grid(. ~ type) +
#  xlab("Year") +
#  ylab(expression("Total PM"[2.5]*" emission")) +
#  ggtitle(expression("PM"[2.5]*paste(" emissions in Baltimore ",
#                                     "City by Various Source Types", sep="")))

dev.off()
