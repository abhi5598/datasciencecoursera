source("Main.R")
library(ggplot2)

NEISCC <- merge(NEI, SCC, by = "SCC")

temmision <-
        aggregate(Emissions ~ year , NEISCC[grepl("coal", NEISCC$Short.Name, ignore.case =
                                                          TRUE),], sum)

png(file = "plot4.png",
    width = 480,
    height = 480)

##setup ggplot
g <- ggplot(temmision, aes(factor(year), Emissions))

## Add layers
g + geom_point() +
        geom_bar(stat = "identity") +
        theme_bw(base_family = "Times", base_size = 12) +
        labs(x = "Year", y = expression("Total " * PM[2.5] * " Emission (Tons)")) +
        labs(title = expression("Total " * PM[2.5] * " Emissions From Coal Sources"))

dev.off()
