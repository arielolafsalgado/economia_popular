#LIBRERIA ####
library(tidyverse)
library(readr)

#FUENTES ####
canasta_basica_alimentaria_regiones_del_pais <- read_csv(
  "C:/Users/Federico/Downloads/canasta-basica-alimentaria-regiones-del-pais.csv")
canasta_basica_total_regiones_del_pais <- read_csv(
  "C:/Users/Federico/Downloads/canasta-basica-total-regiones-del-pais.csv")

# Revisar forma de guardar las bases para que estén disponibles en cualquier lugar. 
#BASES ####

cba_aq_20162022 <- canasta_basica_alimentaria_regiones_del_pais %>% 
  pivot_longer(!indice_tiempo,names_to = "region",values_to="canasta") %>% 
  group_by(year(indice_tiempo),quarter(indice_tiempo),region) %>% 
  summarise(CBA=mean(canasta))  

cbt_aq_20162022 <- canasta_basica_total_regiones_del_pais %>% 
  pivot_longer(!indice_tiempo,names_to = "region",values_to="canasta") %>% 
  group_by(year(indice_tiempo),quarter(indice_tiempo),region) %>% 
  summarise(CBT=mean(canasta))  

canastas_20162022 <- merge(cbt_aq_20162022,cba_aq_20162022)

write.csv(canastas_20162022,"canastas_20162022_datosgob.csv")

canastas_formato <- canastas_20162022_datosgob %>% 
  mutate(codigo = case_when(
    region == 'gran_buenos_aires' ~ '1',
    region == 'noroeste' ~ '40',
    region ==  'noreste' ~ '41',
    region == 'cuyo' ~ '42',
    region == 'pampeana' ~ '43',
    region == 'patagonia' ~ '44',
    TRUE ~ 'N/A'
  )) %>% 
  mutate(periodo =paste(`year(indice_tiempo)`, `quarter(indice_tiempo)`, sep='.')) %>% 
  select(-c(...1,`year(indice_tiempo)`,`quarter(indice_tiempo)`)) %>% 
  select(c(region,periodo,cba,cbt,codigo))

canastas_formato <- rename(canastas_formato,CBA = cba)
canastas_formato <- rename(canastas_formato, CBT = cbt)
write.csv2(canastas_formato, quote = FALSE, file = "canastas.csv",row.names = FALSE)
  

  

