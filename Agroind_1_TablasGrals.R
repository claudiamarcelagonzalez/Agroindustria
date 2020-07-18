# ESTE SCRIP GENERA LAS TABLAS GENERALES DEL ESTUDIO
#***************************************************

library(tidyverse)
library(stringi)

# Incorporo la tabla de autoridades institucionales del SICYTAR de CONICET, INTA y UNN con ID de afiliacion

CONICET_N2 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloCONICET_IDs_N2.csv', sep=";", header = TRUE)) 
CONICET_N3 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloCONICET_IDs_N3.csv', sep=";", header = TRUE)) 
INTA_N2 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloINTA_IDs_N2.csv', sep=";", header = TRUE)) 
INTA_N3 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloINTA_IDs_N3.csv', sep=";", header = TRUE)) 
UNIV_N1 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloUNIV_IDs_N1.csv', sep=";", header = TRUE)) 
UNIV_N2 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloUNIV_IDs_N2.csv', sep=";", header = TRUE)) 
UNIV_N3 <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/4_Instituciones_IDs/Argentina/soloUNIV_IDs_N3.csv', sep=";", header = TRUE)) 

#Incorporo el csv de código ISO de países para generar una tabla propia de paises

paises <- as_tibble(read.csv(file = '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/3_Paises_IDs/paises.csv', sep=",", header = TRUE))
paises_Upp <- stri_trans_general(paises$nombre, "upper")
paises_Tilde <- stri_trans_general(paises_Upp,"Latin-ASCII")
paises$nombre <- paises_Tilde
paisesI_Upp <- stri_trans_general(paises$name, "upper")
paises$name <- paisesI_Upp
paisesF_Upp <- stri_trans_general(paises$nom, "upper")
paisesF_Tilde <- stri_trans_general(paisesF_Upp,"Latin-ASCII")
paises$nom <- paisesF_Tilde
write.table(paises, '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/3_Paises_IDs/paises.tsv', row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t")

#Genero tabla de sectores

IdS <- c("S1_UNI","S1_GOB","S1_SAL","S1_EMP","S1_OTR","S2_OCT","S2_ONG","S2_SUP","S2_UES","S2_UPR")
sector <-c("Universidad","Gobierno","Salud","Empresa","Otros","OCT-Universidad","ONG","Organismo supranacional","Universidad o Instituto universitario estatal","Universidad o Instituto universitario privado")
sectores <- cbind(IdS,sector)
write.table(sectores, '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/5_Sectores/sectores.tsv', row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t")

#Genero tabla de categorías

IdC <- c("FoodAnimals","AgroCropScience","FoodScience","Horticulture","Forestry","AquaticScience")
categorias <- c("Food Animals","Agronomy and Crop Science","Food Science","Horticulture","Forestry","Acuatic Science")
categorias <- cbind(IdC,categorias)
write.table(categorias, '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/1_Categorias/categorias.tsv', row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t")

#Genero tablas de sets de búsqueda

IdSet <- c("LxArg","LxExt","GxArg")
set <- c("LocalxArg","LocalxExtr","GlobalxArg")
set <- cbind(IdSet,set)
write.table(set, '/Users/claudiamgonzalez/Documents/DOCTORADO/2_Datos/5_Sectores_Set/set.tsv', row.names=FALSE, col.names=TRUE, quote=FALSE, sep="\t")
