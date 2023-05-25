#LIBRERIA ####
library(tidyverse)
library(readr)

#FUENTES ####
canasta_basica_alimentaria_regiones_del_pais <- read_csv(
  "C:/Users/Federico/Downloads/canasta-basica-alimentaria-regiones-del-pais.csv")
canasta_basica_total_regiones_del_pais <- read_csv(
  "C:/Users/Federico/Downloads/canasta-basica-total-regiones-del-pais.csv")

#BASES ####

cba_aq_20162022 <- canasta_basica_alimentaria_regiones_del_pais %>% 
  pivot_longer(!indice_tiempo,names_to = "region",values_to="canasta") %>% 
  group_by(year(indice_tiempo),quarter(indice_tiempo),region) %>% 
  summarise(cba=mean(canasta))  

cbt_aq_20162022 <- canasta_basica_total_regiones_del_pais %>% 
  pivot_longer(!indice_tiempo,names_to = "region",values_to="canasta") %>% 
  group_by(year(indice_tiempo),quarter(indice_tiempo),region) %>% 
  summarise(cbt=mean(canasta))  

canastas_20162022 <- merge(cbt_aq_20162022,cba_aq_20162022)

write.csv(canastas_20162022,"canastas_20162022_datosgob.csv")

