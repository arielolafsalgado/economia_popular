########## Este script genera la base_ep_resumen para el tablero

library(tidyverse)
source('tablero/helpers.R')

load('base_ep.RData')
#load('tablero_prototipo/data/base_ep_resumen.RData')

individual_03.hoy <- individual_03.hoy %>% 
  group_by(
    YEAR,
    TRIMESTER,
    EDAD_QUINQUENIO,
    EDAD_DECENIO,
    SEXO,
    REGION,
    AGLOMERADO,
    situacion
  ) %>% 
  genera_resumen() %>%
  ungroup() 
save(individual_03.hoy,file = 'tablero/data/base_ep_resumen.RData')
 