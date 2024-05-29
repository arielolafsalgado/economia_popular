library(dplyr)
library(tidyr)
# Actualizadas al 27-05-2024
url_cbt <- 'https://infra.datos.gob.ar/catalog/sspm/dataset/446/distribution/446.1/download/canasta-basica-total-regiones-del-pais.csv'
url_cba <- 'https://infra.datos.gob.ar/catalog/sspm/dataset/445/distribution/445.1/download/canasta-basica-alimentaria-regiones-del-pais.csv'

CBT <- read.csv(url_cbt) %>%
  pivot_longer(-indice_tiempo) %>%
  rename(CBT=value) %>%
  mutate(indice_tiempo = as.Date(indice_tiempo)) %>%
  mutate(year = format(indice_tiempo,"%Y"), month = as.numeric(format(indice_tiempo,"%m"))) %>%
  mutate(trimester = case_when(
    month <= 3 ~ '1',
    month <= 6 ~ '2',
    month <= 9 ~ '3',
    month <= 12 ~ '4'
   )) %>%
  mutate(periodo = paste(year,trimester,sep='.')) %>%
  mutate(region = case_when(
    name == 'gran_buenos_aires' ~ 'GBA',
    name == 'cuyo' ~ 'Cuyo',
    name == 'noreste' ~ 'Noreste',
    name == 'noroeste' ~ 'Noroeste',
    name == 'pampeana' ~ 'Pampeana',
    name == 'patagonia' ~ 'Patagonia'
  )) %>%
  select(region,periodo,CBT) %>%
  group_by(region,periodo) %>%
  summarise(CBT = mean(CBT)) %>%
  ungroup()


CBA <- read.csv(url_cba) %>%
  pivot_longer(-indice_tiempo) %>%
  rename(CBA=value) %>%
  mutate(indice_tiempo = as.Date(indice_tiempo)) %>%
  mutate(year = format(indice_tiempo,"%Y"), month = as.numeric(format(indice_tiempo,"%m"))) %>%
  mutate(trimester = case_when(
    month <= 3 ~ '1',
    month <= 6 ~ '2',
    month <= 9 ~ '3',
    month <= 12 ~ '4'
  )) %>%
  mutate(periodo = paste(year,trimester,sep='.')) %>%
  mutate(region = case_when(
    name == 'gran_buenos_aires' ~ 'GBA',
    name == 'cuyo' ~ 'Cuyo',
    name == 'noreste' ~ 'Noreste',
    name == 'noroeste' ~ 'Noroeste',
    name == 'pampeana' ~ 'Pampeana',
    name == 'patagonia' ~ 'Patagonia'
  )) %>%
  select(region,periodo,CBA) %>%
  group_by(region,periodo) %>%
  summarise(CBA = mean(CBA)) %>%
  ungroup()

canastas <- full_join(CBA,CBT,by = c('periodo','region'))

write.csv(canastas,file='canastas.csv',row.names = FALSE)