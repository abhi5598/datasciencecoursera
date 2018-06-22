source("Main.R")
library(ggplot2)

temmision <-
  aggregate(Emissions ~ year + fips, NEI[NEI$fips == "24510" |
                                           NEI$fips == "06037" &
                                           NEI$type == "ON-ROAD", ], sum)

png(file = "plot6.png",
    width = 480,
    height = 480)

##setup ggplot
g <- ggplot(temmision, aes(factor(year), Emissions))

## Add layers
g + geom_point() +
  geom_bar(stat = "identity") +
  facet_grid(. ~ fips) +
  theme_bw(base_family = "Times", base_size = 12) +
  labs(x = "Year", y = expression("Total " * PM[2.5] * " Emission (Tons)")) +
  labs(title = expression(
    "Total " * PM[2.5] * " Emissions From ON Road Motor Vehicles in Los Angeles & Baltimore"
  ))

dev.off()
