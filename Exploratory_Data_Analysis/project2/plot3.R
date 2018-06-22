source("Main.R")
library(ggplot2)
temmision <-
        aggregate(Emissions ~ year + type, NEI[NEI$fips == "24510",], sum)
png(file = "plot3.png",
    width = 480,
    height = 480)
##setup ggplot
g <- ggplot(temmision, aes(factor(year), Emissions, fill = type))
## Add layers
g + geom_point() +
        geom_bar(stat = "identity") +
        theme_bw(base_family = "Times", base_size = 12) +
        facet_grid(. ~ type) +
        labs(x = "Year", y = expression("Total " * PM[2.5] * " Emission (Tons)")) +
        labs(title = expression("Total " * PM[2.5] * " Emissions From Baltimore City"))

dev.off()
