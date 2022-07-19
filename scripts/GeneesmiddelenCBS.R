## CBS data
## Doel: Vinden van trends in geneesmiddelengebruik in ouderen
library(readxl)
ATCCodes <- 
        read_excel(
                "data/81071ned_metadata.xlsx", 
                sheet = "Geneesmiddelengroep")

LeeftijdGroepen <- 
        read_excel(
                "data/81071ned_metadata.xlsx", 
                sheet = "Leeftijd")

GeneemiddelenLftGsl <- 
        read.csv(
        "~/Documents/DataScience/Projecten/GeneesmiddelenCbs/data/81071ned_UntypedDataSet_18072022_203041.csv", 
        sep=";")
