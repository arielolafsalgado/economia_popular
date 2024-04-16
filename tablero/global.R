# Carga de librerías
library(shiny)
library(tidyverse)
library(lemon)
library(leaflet)
library(leaflegend)
library(sf)
# Carga del dataset
load('data/base_ep_resumen.RData')

# Carga de funciones propias
source('helpers.R')
