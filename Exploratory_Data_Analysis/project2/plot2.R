source("Main.R")

temmision <-
        aggregate(Emissions ~ year, NEI[NEI$fips == "24510", ], sum)

png(file = "plot2.png",width=480,height=480)
barplot(
        (temmision$Emissions),
        names.arg = temmision$year,
        xlab = "Year",
        ylab = "PM2.5 Emissions (Tons)",
        main = "Total PM2.5 Emissions From Baltimore City"
)
dev.off()
