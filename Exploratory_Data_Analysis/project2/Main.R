#######     Download File
if (!file.exists("Dataset.zip")) {
        fileUrl <-
                "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2FNEI_data.zip"
        download.file(fileUrl, destfile = "./Dataset.zip")
        
        # Unzip File
        unzip(zipfile = "./Dataset.zip")
}        
        ## This first line will likely take a few seconds. Be patient!
        NEI <- readRDS("summarySCC_PM25.rds")
        SCC <- readRDS("Source_Classification_Code.rds")

