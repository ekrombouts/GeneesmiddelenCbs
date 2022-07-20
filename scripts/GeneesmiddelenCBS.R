## CBS data
## Doel: Vinden van trends in geneesmiddelengebruik onder ouderen
## 

library(readxl, tidyverse, dplyr)

# Get data
# Hulptabellen
ATC <- 
        read_excel(
                "data/81071ned_metadata.xlsx", 
                sheet = "Geneesmiddelengroep"
        )

lft <- 
        read_excel(
                "data/81071ned_metadata.xlsx", 
                sheet = "Leeftijd"
        )

gs <-
        read_excel(
                "data/81071ned_metadata.xlsx",
                sheet = "Geslacht"
        )

# En hoofdtabel
med <- 
        read.csv(
        "~/Documents/DataScience/Projecten/GeneesmiddelenCbs/data/81071ned_UntypedDataSet_18072022_203041.csv", 
        sep=";")

med$Geslacht <- trimws(med$Geslacht)

# Join tables and clean up
med <- med %>%
        left_join(ATC, c("GeneesmiddelengroepATC" = "Key")) %>%
        select(-GeneesmiddelengroepATC) %>%
        rename(ATC = Title, ATCDesc = Description) %>%
        left_join(lft, c("Leeftijd" = "Key")) %>%
        select (-Leeftijd) %>%
        rename (Leeftijd = Title) %>%
        left_join(gs, c("Geslacht" = "Key")) %>%
        select (-Geslacht, - Description) %>%
        rename (Geslacht = Title, 
                nPersonen = PersonenMetVerstrekteGeneesmiddelen_1,
                percPersonen = PersonenMetGeneesmiddelenRelatief_2) %>%
                select (
                        ID, 
                        Perioden,
                        Geslacht, 
                        Leeftijd,
                        ATC, 
                        nPersonen, 
                        percPersonen, 
                        ATCDesc
                        )

med$Perioden <- ordered(as.factor(substr(med$Perioden,1,4)))
med$Geslacht <- as.factor(med$Geslacht)
med$Leeftijd <- as.factor(med$Leeftijd)




