options(dplyr.summarise.inform = FALSE)
## FUNCIONES PARA PROCESAR DATOS

genera_resumen_old <- function(df){
  #'@param df Un dataframe, eventualmente agrupado por subgrupos
  #'@returns Un dataframe resumido, con las categorias POBLACION, ECONOMICAMENTE_ACTIVES, CUENTAPROPISTAS_PROFESIONALES, CUENTAPROPISTAS_NO_PROFESIONALES.
  #'@details El objetivo de esta funcion es agilizar la escritura de la preparación de resumenes que muestren la evolución por año y trimestre de las poblaciones de interés. Pasandole un tibble agrupado, se puede ver la evolución de subgrupos de poblaciones en términos de las variables de la EP.
  df %>%
    mutate(ES_EP = ES_CUENTAPROPISTA_NO_PROFESIONAL | ES_TFSR) %>%
    summarise(
      'POBLACION' = sum( PONDERA ), # Aca deberia ir PONDIH
      'POBLACION_PONDIH' = sum( PONDIH ), # Aca deberia ir PONDIH
      'OCUPADES' = sum(
        PONDERA * 
          (ESTADO == 'OCUPADE'),na.rm=TRUE),
      'OCUPADES_NO_EP' = sum(
        PONDERA * 
          (ESTADO == 'OCUPADE' & !ES_EP),na.rm=TRUE),
      'OCUPADES_NO_EP_PONDIH' = sum(
        PONDIH * 
          (ESTADO == 'OCUPADE' & !ES_EP),na.rm=TRUE),
      'DESOCUPADES' =  sum(
        PONDERA * 
          (ESTADO == 'DESOCUPADE'),na.rm=TRUE),
      'DESOCUPADES_PONDIH' =  sum(
        PONDIH * 
          (ESTADO == 'DESOCUPADE'),na.rm=TRUE),
      'ECONOMICAMENTE_ACTIVES' = sum(
        PONDERA * 
          (ESTADO == 'OCUPADE' | ESTADO == 'DESOCUPADE'),na.rm=TRUE),
      'CUENTAPROPISTAS' = sum(
        PONDERA * 
          (CATEGORIA_OCUPACION == 'CUENTAPROPISTA'),na.rm=TRUE),
      'CUENTAPROPISTAS_PONDIH' = sum(
        PONDIH * 
          (CATEGORIA_OCUPACION == 'CUENTAPROPISTA'),na.rm=TRUE),
      'CUENTAPROPISTAS_PROFESIONALES' = sum(
        PONDERA * 
          (CATEGORIA_OCUPACION == 'CUENTAPROPISTA' & ES_PROFESIONAL),na.rm=TRUE),
      'CUENTAPROPISTAS_NO_PROFESIONALES' = sum(
        PONDERA * 
          (CATEGORIA_OCUPACION == 'CUENTAPROPISTA' & !ES_PROFESIONAL),na.rm=TRUE),
      'TFSR' = sum(
        PONDERA * 
          (CATEGORIA_OCUPACION == 'TRABAJADORE FLIAR S.R.'),na.rm=TRUE),
      "ASALARIADOS_REGISTRADOS" = sum(
        PONDERA * (
          CATEGORIA_OCUPACION == 'ASALARIADE' & REGISTRACION == 1),na.rm=TRUE
      ),
      "ASALARIADOS_REGISTRADOS_PONDIH" = sum(
        PONDIH * (
          CATEGORIA_OCUPACION == 'ASALARIADE' & REGISTRACION == 1),na.rm=TRUE
      ),
      "ASALARIADOS_NOREGISTRADOS" = sum(
        PONDERA * (
          CATEGORIA_OCUPACION == 'ASALARIADE' & REGISTRACION == 2),na.rm=TRUE
      ),
      "ASALARIADOS_NOREGISTRADOS_PONDIH" = sum(
        PONDIH * (
          CATEGORIA_OCUPACION == 'ASALARIADE' & REGISTRACION == 2),na.rm=TRUE
      ),
      "PATRONES" = sum(
        PONDERA * (
          CATEGORIA_OCUPACION == 'PATRON'), na.rm=TRUE
      ),
      "PATRONES_PONDIH" = sum(
        PONDIH * (
          CATEGORIA_OCUPACION == 'PATRON'), na.rm=TRUE
      ),
      'ECONOMIA_POPULAR' = sum(ES_EP*PONDERA,na.rm=TRUE),
      'ECONOMIA_POPULAR_PONDIH' = sum(ES_EP*PONDIH,na.rm=TRUE),
      "RESTO_CUENTAPROPISTAS" = CUENTAPROPISTAS - ECONOMIA_POPULAR,
      "RESTO_CUENTAPROPISTAS_PONDIH" = CUENTAPROPISTAS_PONDIH - ECONOMIA_POPULAR_PONDIH,
      'IT_ECONOMIA_POPULAR' = sum(ES_EP*POND_ING_TOT_IND*TOTAL_INGRESO_INDIVIDUAL,na.rm=TRUE),
      'IL_ECONOMIA_POPULAR' = sum(ES_EP*POND_ING_OCUP_PRINC*INGRESOS_OCUP_PPAL,na.rm=TRUE),
      'CB_ECONOMIA_POPULAR' = sum(ES_EP*POND_ING_TOT_IND*CBT_hogar,na.rm=TRUE)
    ) %>% 
    mutate('INL_ECONOMIA_POPULAR' = IT_ECONOMIA_POPULAR-IL_ECONOMIA_POPULAR) %>%
    return()
}

# Hace funcion en forma que reciba columna como SEGMENTO_LABORAL:
# EP, PRIVADO_REGISTRADO, PRIVADO_NOREGISTRADO, PUBLICO_RE/NOREG, 


genera_resumen <- function(df){
  #'@param df Un dataframe, eventualmente agrupado por subgrupos
  #'@returns Un dataframe resumido, con las categorias POBLACION, ECONOMICAMENTE_ACTIVES, CUENTAPROPISTAS_PROFESIONALES, CUENTAPROPISTAS_NO_PROFESIONALES.
  #'@details El objetivo de esta funcion es agilizar la escritura de la preparación de resumenes que muestren la evolución por año y trimestre de las poblaciones de interés. Pasandole un tibble agrupado, se puede ver la evolución de subgrupos de poblaciones en términos de las variables de la EP.
  df %>%
    mutate(
      ES_CUENTAPROPISTA_NO_PROFESIONAL = CATEGORIA_OCUPACION == 'CUENTAPROPISTA' & !ES_PROFESIONAL,
      ES_TFSR = CATEGORIA_OCUPACION == 'TRABAJADORE FLIAR S.R.',
      ES_OCU = ESTADO == 'OCUPADE',
      ES_DESOCU = ESTADO == 'DESOCUPADE',
      ES_PEA = ES_OCU | ES_DESOCU,
      ES_EP = (ES_CUENTAPROPISTA_NO_PROFESIONAL | ES_TFSR),
      ES_ASALREG = CATEGORIA_OCUPACION == 'ASALARIADE' & REGISTRACION == 1,
      ES_ASALNREG = CATEGORIA_OCUPACION == 'ASALARIADE' & REGISTRACION == 2,
      ES_PATRON = CATEGORIA_OCUPACION == 'PATRON',
      ES_CUENTAPROP = CATEGORIA_OCUPACION == 'CUENTAPROPISTA'
    ) %>%
    summarise(
      'POBLACION' = sum( PONDERA ), 
      'OCUPADES' = sum( PONDERA * ES_OCU,na.rm=TRUE),
      'OCUPADES_NO_EP' = sum( PONDERA * (ES_OCU & !ES_EP),na.rm=TRUE),
      'DESOCUPADES' =  sum( PONDERA * ES_DESOCU ,na.rm=TRUE),
      'ECONOMICAMENTE_ACTIVES' = sum( PONDERA * ES_PEA,na.rm=TRUE),
      'ECONOMICAMENTE_INACTIVES' = sum( PONDERA * !ES_PEA,na.rm=TRUE),
      'CUENTAPROPISTAS' = sum( PONDERA * ES_CUENTAPROP,na.rm=TRUE),
      "ASALARIADOS_REGISTRADOS" = sum( PONDERA * ES_ASALREG,na.rm=TRUE),
      "ASALARIADOS_NOREGISTRADOS" = sum( PONDERA * ES_ASALNREG,na.rm=TRUE),
      "PATRONES" = sum(PONDERA * ES_PATRON, na.rm=TRUE),
      'ECONOMIA_POPULAR' = sum(ES_EP*PONDERA,na.rm=TRUE),
      "RESTO_CUENTAPROPISTAS" = CUENTAPROPISTAS - ECONOMIA_POPULAR,
      'POBLACION_PONDIH' = sum( PONDIH ), 
      'OCUPADES_PONDIH' = sum( PONDIH * ES_OCU,na.rm=TRUE),
      'OCUPADES_NO_EP_PONDIH' = sum( PONDIH * (ES_OCU & !ES_EP),na.rm=TRUE),
      'DESOCUPADES_PONDIH' =  sum( PONDIH * ES_DESOCU ,na.rm=TRUE),
      'ECONOMICAMENTE_ACTIVES_PONDIH' = sum( PONDIH * ES_PEA,na.rm=TRUE),
      'ECONOMICAMENTE_INACTIVES_PONDIH' = sum( PONDIH * !ES_PEA,na.rm=TRUE),
      'CUENTAPROPISTAS_PONDIH' = sum( PONDIH * ES_CUENTAPROP,na.rm=TRUE),
      "ASALARIADOS_REGISTRADOS_PONDIH" = sum( PONDERA * ES_ASALREG,na.rm=TRUE),
      "ASALARIADOS_NOREGISTRADOS_PONDIH" = sum( PONDIH * ES_ASALNREG,na.rm=TRUE),
      "PATRONES_PONDIH" = sum(PONDIH * ES_PATRON, na.rm=TRUE),
      'ECONOMIA_POPULAR_PONDIH' = sum(ES_EP*PONDIH,na.rm=TRUE),
      "RESTO_CUENTAPROPISTAS_PONDIH" = sum( PONDIH * (ES_CUENTAPROP & !ES_EP),na.rm=TRUE),
      'IT_ECONOMIA_POPULAR' = sum(ES_EP*POND_ING_TOT_IND*TOTAL_INGRESO_INDIVIDUAL,na.rm=TRUE),
      'IL_ECONOMIA_POPULAR' = sum(ES_EP*POND_ING_OCUP_PRINC*INGRESOS_OCUP_PPAL,na.rm=TRUE),
      'CB_ECONOMIA_POPULAR' = sum(ES_EP*POND_ING_TOT_IND*CBT_hogar,na.rm=TRUE)
    ) %>% 
    mutate('INL_ECONOMIA_POPULAR' = IT_ECONOMIA_POPULAR-IL_ECONOMIA_POPULAR) %>%
    return()
}

############################
## FUNCIONES PARA EL TABLERO
############################

genera_aes_cantTrabEP_plot <- function(input){
  #' @description Esta función se encarga de generar el objeto estético para el plot cantTrabEP_plot
  if(input$separar_genero){ # Si separamos por sexo
      if(input$separar_zonas){ # Si separamos por región
        
        aes_plot <- aes_(
          x = ~ FECHA,
          y = ifelse(!input$usar_porcentaje_pea, list(~ (PERSONAS)/1e6),list(~PORC_PEA))[[1]], 
          #group = as.formula( paste('~paste( SEXO,', input$variable_zona, ',OCUPACIONES)' )), 
          linetype = as.formula( paste('~', input$variable_zona )),
          color = ~ OCUPACIONES,
          shape = ~ SEXO)
        
      }else{ # Si no separamos por región
        
        aes_plot <- aes_(
          x = ~ FECHA,
          y = ifelse(!input$usar_porcentaje_pea, list(~ (PERSONAS)/1e6),list(~PORC_PEA))[[1]], 
          color = ~ OCUPACIONES,
          #group = ~ paste(SEXO,OCUPACIONES),  
          shape = ~ SEXO)
        
      }
    }else{ # Si no separamos por sexo
      if(input$separar_zonas){ # Si separamos por región
        
        aes_plot <- aes_(
          x = ~ FECHA,
          y = ifelse(!input$usar_porcentaje_pea, list(~ (PERSONAS)/1e6),list(~PORC_PEA))[[1]], 
          color = ~ OCUPACIONES,
          #group = as.formula(paste('~',input$variable_zona)), 
          linetype = as.formula(paste('~',input$variable_zona)))
        
      }else{ # Si no separamos por región
        
        aes_plot <- aes_(
          x = ~ FECHA,
          y = ifelse(!input$usar_porcentaje_pea, list(~ (PERSONAS)/1e6),list(~PORC_PEA))[[1]],
          color = ~ OCUPACIONES
          )
        
      }
    }
  return(aes_plot)
}

genera_grouping_vars_cantTrabEP_plot <- function(input){
  #'@description Esta función genera el agrupamiento necesario para el plot cantTrabEP_plot
  
  agrupar <- c("YEAR", "TRIMESTER")
  if(input$separar_genero){
    agrupar <- c(agrupar, "SEXO")
  }
  if(input$separar_zonas){
    agrupar<- c(agrupar, input$variable_zona)
  }
  grouping_vars <- quos(agrupar)
  return(grouping_vars)
}


genera_grouping_vars_mapa <- function(input){
  #'@description Esta función genera el agrupamiento necesario para el mapa
  
  agrupar <- c("YEAR", "TRIMESTER",paste('EDAD',input$variable_edad_t3,sep='_'),input$variable_zona_t3)
  grouping_vars <- quos(agrupar)
  return(grouping_vars)
}

genera_aes_pobrezaEP_plot <- function(input){
  #' @description Esta función se encarga de generar el objeto estético para el plot cantTrabEP_plot
  if(input$separar_genero_t2){ # Si separamos por sexo
      #aes( x = FECHA, color = tasa_tipo, y = tasa)
      aes_plot <- aes_(
        x = ~ FECHA,
        y = ~ tasa*100, 
        fill = ~ paste(tasa_tipo,SEXO,sep=', '))
  }else{ # Si no separamos por sexo
      aes_plot <- aes_(
        x = ~ FECHA,
        y = ~ tasa*100,
        fill = ~ tasa_tipo
      )
      
  }
  return(aes_plot)
}

genera_grouping_vars_pobrezaEP_plot <- function(input){
  #'@description Esta función genera el agrupamiento necesario para el plot cantTrabEP_plot
  if(input$separar_genero_t2){ # Si separamos por sexo
      grouping_vars <- quos('SEXO','YEAR','TRIMESTER')
  }else {
    grouping_vars <- quos('YEAR','TRIMESTER')
  }
  return(grouping_vars)
}



genera_aes_barrasEP_plot <- function(input){
  #' @description Esta función se encarga de generar el objeto estético para el plot cantTrabEP_plot
  if(input$separar_genero_t2){ # Si separamos por sexo
    #aes( x = FECHA, color = tasa_tipo, y = tasa)
    aes_plot <- aes_(
      x = ~ TIPO_INGRESO,
      y = ~ INGRESO, 
      fill = ~ SEXO)
  }else{ # Si no separamos por sexo
    aes_plot <- aes_(
      x = ~ TIPO_INGRESO,
      y = ~ INGRESO
    )
    
  }
  return(aes_plot)
}

genera_grouping_vars_barrasEP_plot <- function(input){
  #'@description Esta función genera el agrupamiento necesario para el plot cantTrabEP_plot
  if(input$separar_genero_t2){ # Si separamos por sexo
    grouping_vars <- quos('SEXO')
  }else {
    grouping_vars <- quos(NULL)
  }
  return(grouping_vars)
}


addCircleLegend_old <- function(
    map, title = "", range, scaling_fun = function(x) x, ...,
    color='gray', weight =1, fillColor ='gray', fillOpacity=1,
    position = c("topright", "bottomright", "bottomleft", "topleft"),
    data = leaflet::getMapData(map), layerId = NULL) {
  
  range <- base::pretty(sort(range), 20)
  range <- range[range != 0]
  min_n <- ceiling(min(range, na.rm = TRUE))
  med_n <- round(median(range, na.rm = TRUE), 0)
  max_n <- round(max(range, na.rm = TRUE), 0)
  n_range <- c(min_n, med_n, max_n)
  radii <- n_range
  n_range <- scales::label_number(scale_cut=scales::cut_short_scale())(n_range)
  
  circle_style <- glue::glue(
    "border-radius:50%;
    border: {weight}px solid {color};
    background: {paste0(fillColor, round(fillOpacity*100, 0))};
    position: 1px;
    bottom:1px;
    right:25%;
    left:50%;"
  )
  
  text_style <- glue::glue(
    "text-align: right;
    font-size: 11px;
    position: absolute;
    bottom: 0px;
    right:1px;"
  )
  
  circle_legend <- htmltools::HTML(glue::glue(
    '<div class="bubble-legend">
    <div id="legendTitle" style="text-align: center; font-weight: bold;">{title}</div>
    <div class="symbolsContainer" style="min-width: {radii[3]*2 + 20}px; min-height: {radii[3]*2}px;">
    <div class="legendCircle" style="width: {radii[3] * 2}px; height: {radii[3] * 2}px; margin-left: {-radii[3]}px; {circle_style}"></div>
    <div class="legendCircle" style="width: {radii[2] * 2}px; height: {radii[2] * 2}px; margin-left: {-radii[2]}px; {circle_style}"></div>
    <div class="legendCircle" style="width: {radii[1] * 2}px; height: {radii[1] * 2}px; margin-left: {-radii[1]}px; {circle_style}"></div>
    <div>
    <p class="legendValue" style="margin-bottom: {radii[1] * 2 - 20}px; {text_style}">{n_range[1]}</p>
    </div>
    <div>
    <p class="legendValue" style="margin-bottom: {radii[2] * 2 - 20}px; {text_style}">{n_range[2]}</p>
    </div>
    <div>
    <p class="legendValue" style="margin-bottom: {radii[3] * 2 - 20}px; {text_style}">{n_range[3]}</p>
    </div>
    </div>
    </div>'
  ))
  
  return(
    leaflet::addControl(map, html = circle_legend, position = position, layerId = layerId)
  )
}

addCircleLegend0 <- function(
    map, title = "", range, scaling_fun, ...,
    color, weight, fillColor, fillOpacity,
    position = c("topright", "bottomright", "bottomleft", "topleft"),
    data = leaflet::getMapData(map), layerId = NULL) {
  
  range <- base::pretty(sort(range), 20)
  range <- range[range != 0]
  min_n <- ceiling(min(range, na.rm = TRUE))
  med_n <- round(median(range, na.rm = TRUE), 0)
  max_n <- round(max(range, na.rm = TRUE), 0)
  n_range <- c(min_n, med_n, max_n)
  radii <- scaling_fun(n_range, ...)
  n_range <- scales::label_number_si()(n_range)
  
  circle_style <- glue::glue(
    "border-radius:50%;
	border: {weight}px solid {color};
	background: {paste0(fillColor, round(fillOpacity*100, 0))};
	position: absolute;
	bottom:1px;
	right:25%;
	left:50%;"
  )
  
  text_style <- glue::glue(
    "text-align: right;
	font-size: 11px;
	position: absolute;
	bottom: 0px;
	right:1px;"
  )
  
  circle_legend <- htmltools::HTML(glue::glue(
    '<div class="bubble-legend">
	<div id="legendTitle" style="text-align: center; font-weight: bold;">{title}</div>
	<div class="symbolsContainer" style="min-width: {radii[3]*2 + 20}px; min-height: {radii[3]*2}px;">
	<div class="legendCircle" style="width: {radii[3] * 2}px; height: {radii[3] * 2}px; margin-left: {-radii[3]}px; {circle_style}"></div>
	<div class="legendCircle" style="width: {radii[2] * 2}px; height: {radii[2] * 2}px; margin-left: {-radii[2]}px; {circle_style}"></div>
	<div class="legendCircle" style="width: {radii[1] * 2}px; height: {radii[1] * 2}px; margin-left: {-radii[1]}px; {circle_style}"></div>
	<div>
	<p class="legendValue" style="margin-bottom: {radii[1] * 2 - 12}px; {text_style}">{n_range[1]}</p>
	</div>
	<div>
	<p class="legendValue" style="margin-bottom: {radii[2] * 2 - 12}px; {text_style}">{n_range[2]}</p>
	</div>
	<div>
	<p class="legendValue" style="margin-bottom: {radii[3] * 2 - 12}px; {text_style}">{n_range[3]}</p>
	</div>
	</div>
	</div>'
  ))
  
  return(
    leaflet::addControl(map, html = circle_legend, position = position, layerId = layerId)
  )
}


addCircleLegend <- function(
    map, title = "", range, scaling_fun, ...,
    color='gray', weight = 1, fillColor = 'gray', fillOpacity=1,
    position = c("topright", "bottomright", "bottomleft", "topleft"),
    data = leaflet::getMapData(map), layerId = NULL) {
  
  range <- base::pretty(sort(range), 20)
  range <- range[range != 0]
  min_n <- ceiling(min(range, na.rm = TRUE))
  med_n <- round(median(range, na.rm = TRUE), 0)
  max_n <- round(max(range, na.rm = TRUE), 0)
  n_range <- c(min_n, med_n, max_n)
  radii <- n_range
  n_range <- scales::label_number(scale_cut=scales::cut_short_scale())(n_range)
  circle_style <- glue::glue(
    "border-radius:50%;
	border: {weight}px solid {color};
	background: {paste0(fillColor, round(fillOpacity*100, 0))};
	position: absolute;
	bottom: 0;
	left: 50%;
	transform: translateX(-50%);
    margin-top: {10*radii[3]}px;"
  )
  
  text_style <- glue::glue(
    "text-align: center;
	font-size: 11px;
	position: absolute;
	bottom: {radii[3] * 10}px;
	left: 0;
	right: 0;"
  )
  
  circle_legend <- htmltools::HTML(glue::glue(
    '<div class="bubble-legend">
	<div id="legendTitle" style="text-align: center; font-weight: bold;">{title}</div>
	<div class="symbolsContainer" style="min-width: {radii[3]*2 + 20}px; min-height: {radii[3]*3}px; position: relative;">
	<div class="legendCircle" style="width: {radii[3] * 2}px; height: {radii[3] * 2}px; margin-left: {-radii[3]}px; {circle_style}"></div>
	<div class="legendCircle" style="width: {radii[2] * 2}px; height: {radii[2] * 2}px; margin-left: {-radii[2]*0.75}px; {circle_style}"></div>
	<div class="legendCircle" style="width: {radii[1] * 2}px; height: {radii[1] * 2}px; margin-left: {-radii[1]*0.5}px; {circle_style}"></div>
	<div>
	<p class="legendValue" style="{text_style}">{n_range[1]}</p>
	</div>
	<div>
	<p class="legendValue" style="{text_style}">{n_range[2]}</p>
	</div>
	<div>
	<p class="legendValue" style="{text_style}">{n_range[3]}</p>
	</div>
	</div>
	</div>'
  ))
  
  return(
    leaflet::addControl(map, html = circle_legend, position = position, layerId = layerId)
  )
}