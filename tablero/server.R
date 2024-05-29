# Función server.
# Objeto output contiene:
#' @param cantTrabEP_plot Plot de la cantidad de trabajadorxs participando de la economía popular.

# Objeto input contiene:
#' @param separar_genero Si es verdadero, se separan las líneas de los datos en base al sexo de las personas.
#' @param regiones Las regiones a considerar cuando graficamos. En caso de que sea NULL, consideramos todas las regiones.
#' @param separar_zonas Si es verdadero, consideramos una curva distinta para cada una de las regiones consideradas.


shinyServer(function(input, output) {
  #### Primer panel
  output$zonas_posibles <- renderUI({
    opciones <- individual_03.hoy %>% 
      select_at(input$variable_zona) %>%
      unique %>% unlist %>% as.character %>% setdiff('N/A')
    
    selectInput(
      inputId = "zonas",
      label = "Zonas consideradas",
      choices = opciones,
      multiple = TRUE,
      selected = c() )
  })
  
  
  output$edades_posibles <- renderUI({
    opciones <- individual_03.hoy %>% 
      select_at(paste('EDAD',input$variable_edad,sep='_')) %>%
      unique %>% unlist %>% as.character %>% discard(is.na)
    
    selectInput(
      inputId = "edades",
      label = "Edades consideradas",
      choices = opciones,
      multiple = TRUE,
      selected = c() )
  })
  
  dataset_p1 <- reactive({
    if(input$paneles == 'mercado_laboral'){
      zonas <- unique(input$zonas)
      if( length(zonas) == 0 ) 
        zonas <- individual_03.hoy %>% 
          select_at(input$variable_zona) %>%
          unique %>% unlist 
      
      edades <- unique(input$edades)
      if( length(edades) == 0 ) 
        edades <- individual_03.hoy %>% 
        select_at(paste('EDAD',input$variable_edad,sep='_')) %>%
        unique %>% unlist 
      
      grouping_vars <- genera_grouping_vars_cantTrabEP_plot(input)
      
      
      individual_03.hoy %>% ungroup() %>%
        filter(
          YEAR >= input$slider_años[1],
          YEAR <= input$slider_años[2],
          across(input$variable_zona, ~.x %in% zonas),
          across(paste('EDAD',input$variable_edad,sep='_'), ~.x %in% edades)
        ) %>%
        filter(SEXO != 'N/A') %>%
        group_by_at(grouping_vars) %>%
        summarise(
          ECONOMIA_POPULAR = sum(ECONOMIA_POPULAR),
          RESTO_CUENTAPROPISTAS = sum(RESTO_CUENTAPROPISTAS),
          ASALARIADOS_REGISTRADOS = sum(ASALARIADOS_REGISTRADOS),
          ASALARIADOS_NOREGISTRADOS = sum(ASALARIADOS_NOREGISTRADOS),
          PATRONES = sum(PATRONES),
          DESOCUPADES = sum(DESOCUPADES),
          PEA = sum(ECONOMICAMENTE_ACTIVES)
        ) %>% 
        pivot_longer(cols = c(
          'ECONOMIA_POPULAR',
          'RESTO_CUENTAPROPISTAS',
          'ASALARIADOS_REGISTRADOS',
          'ASALARIADOS_NOREGISTRADOS',
          'PATRONES',
          'DESOCUPADES'),
          names_to = 'OCUPACIONES',
          values_to = 'PERSONAS') %>% 
        ungroup() %>%
        filter(OCUPACIONES %in% c('ECONOMIA_POPULAR',input$ocupaciones)) %>%
        mutate(PORC_PEA = PERSONAS/PEA*100) %>%
        mutate(FECHA = as.Date(paste(YEAR,3*TRIMESTER,1,sep='-')))
    }else{
      NULL
    }
  })
  
  output$cantTrabEP_plot <- renderPlot({
    if(input$paneles == 'mercado_laboral'){
      # La lógica es que construimos un vector grouping_vars y otro aes_plot que nos permita indicar qué variables usar para agrupar (a la hora de construir el dataset resumido, grouping vars) y qué graficar (aes_plot)
      ocupa_labels <- case_when(
        input$ocupaciones == 'RESTO_CUENTAPROPISTAS' ~ 'RESTO CP',
        input$ocupaciones == 'ASALARIADOS_REGISTRADOS' ~ 'Asal R',
        input$ocupaciones == 'ASALARIADOS_NOREGISTRADOS' ~ 'Asal NR',
        input$ocupaciones == 'PATRONES' ~ 'Pat',
        input$ocupaciones == 'DESOCUPADES' ~ 'DesOcup'
      )
      names(ocupa_labels) <- input$ocupaciones
      ocupa_labels <- c(ocupa_labels, 'ECONOMIA_POPULAR' = 'EP')
      
      aes_plot <- genera_aes_cantTrabEP_plot(input)
      
      dataset_p1() %>% 
        ggplot(aes_plot) +
        geom_point() +
        geom_line() +
        theme_light() +
        theme(axis.title = element_text(size=15),
              axis.text = element_text(size=12)) +
        scale_color_discrete(labels = function(x) ocupa_labels[x]) +
        scale_shape(name = 'GÉNERO') +
        scale_x_date(
          name = '',
          date_breaks = '6 months',
          labels = function(x) {
            xy <- as.numeric(format(x,'%Y'))
            xm <- as.numeric(format(x,'%m'))
            xtri <-case_when(
              xm <= 3 ~ 'I',
              xm <= 6 ~ 'II',
              xm <= 9 ~ 'III',
              TRUE ~ 'IV'
            )
            paste(xy,xtri,sep='-')
          }
        ) +
        scale_y_continuous(name = ifelse(input$usar_porcentaje_pea,'% PEA','Millones de personas')) +
        theme(axis.text.x = element_text(angle = 90,vjust=0.5))
      
    }
    
    
  })
  
  output$descarga_p1 <- downloadHandler(
    filename = 'datos_pestaña1.csv',
    content = function(file) write.csv(dataset_p1(),file,row.names=FALSE)
  )
  
  
  ##### SEGUNDO PANEL
  
  output$zonas_posibles_t2 <- renderUI({
    opciones <- individual_03.hoy %>% 
      select_at(input$variable_zona_t2) %>%
      unique %>% unlist %>% as.character %>% setdiff('N/A')
    
    selectInput(
      inputId = "zonas_t2",
      label = "Zonas consideradas",
      choices = opciones,
      multiple = TRUE,
      selected = c() )
  })
  
  
  output$edades_posibles_t2 <- renderUI({
    opciones <- individual_03.hoy %>% 
      select_at(paste('EDAD',input$variable_edad_t2,sep='_')) %>%
      unique %>% unlist %>% as.character %>% discard(is.na)
    
    selectInput(
      inputId = "edades_t2",
      label = "Edades consideradas",
      choices = opciones,
      multiple = TRUE,
      selected = c() )
  })
  
  dataset_p2 <- reactive({
    if(input$paneles == 'pobreza'){
      zonas <- unique(input$zonas_t2)
      if( length(zonas) == 0 ) 
        zonas <- individual_03.hoy %>% 
          select_at(input$variable_zona_t2) %>%
          unique %>% unlist 
      
      edades <- unique(input$edades_t2)
      if( length(edades) == 0 ) 
        edades <- individual_03.hoy %>% 
        select_at(paste('EDAD',input$variable_edad_t2,sep='_')) %>%
        unique %>% unlist 
      
      if(input$tasa_tipo == 'POBREZA'){
        situaciones <- c('pobre','indigente')
      }else{
        situaciones <- c('indigente')
      }
      
      
      grouping_vars <- genera_grouping_vars_pobrezaEP_plot(input)
      
      individual_03.hoy %>%
        filter(!is.na(situacion)) %>%
        filter(
          YEAR >= input$slider_años_t2[1],
          YEAR <= input$slider_años_t2[2],
          across(input$variable_zona_t2, ~.x %in% zonas),
          across(paste('EDAD',input$variable_edad_t2,sep='_'), ~.x %in% edades)
        ) %>%
        group_by(YEAR,TRIMESTER) %>%
        mutate(POB_TOT = sum(POBLACION_PONDIH,na.rm=TRUE)) %>%
        mutate(SIT_TOT = sum(POBLACION_PONDIH[situacion %in% situaciones],na.rm=TRUE)) %>%
        mutate(SIT_TASA = SIT_TOT/POB_TOT) %>%
        group_by_at(grouping_vars) %>%
        # summarise(
        #   tasa_EP = sum(ECONOMIA_POPULAR_PONDIH[situacion %in% situaciones],na.rm=TRUE)/POB_TOT,
        #   tasa_OCU_NEP = sum(OCUPADES_NO_EP_PONDIH[situacion %in% situaciones],na.rm=TRUE)/POB_TOT,
        #   tasa_PEI = sum((POBLACION_PONDIH-ECONOMIA_POPULAR_PONDIH-OCUPADES_NO_EP_PONDIH)[situacion %in% situaciones],na.rm=TRUE)/POB_TOT
        # ) %>%
        summarise(    
          across(
            c(input$ocupaciones_t2,"ECONOMIA_POPULAR_PONDIH"),
            function(x){
              sum(x[situacion %in% situaciones],na.rm=TRUE)/POB_TOT
            } 
          ),
          SIT_TASA = first(SIT_TASA)
        ) %>%
        mutate(FECHA = as.Date(paste(YEAR,3*TRIMESTER,'1',sep='-'))) %>%
        pivot_longer(
          cols =
            c(input$ocupaciones_t2,"ECONOMIA_POPULAR_PONDIH",'SIT_TASA'),
          names_to = 'tasa_tipo',
          values_to = 'tasa'
        ) %>%
        # pivot_longer(cols = c(tasa_EP,
        #                       tasa_OCU_NEP,
        #                       tasa_PEI),
        #              names_to = 'tasa_tipo',
        #              values_to = 'tasa') %>%
        drop_na() 
    }
  })
  
  
  output$pobrezaEP_plot <- renderPlot({
    if(input$paneles == 'pobreza'){
      # La lógica es que construimos un vector grouping_vars y otro aes_plot que nos permita indicar qué variables usar para agrupar (a la hora de construir el dataset resumido, grouping vars) y qué graficar (aes_plot)
      aes_plot <- genera_aes_pobrezaEP_plot(input)
      
      dataset_p2() %>%
        filter(is.element(tasa_tipo,c(input$ocupaciones_t2,'ECONOMIA_POPULAR_PONDIH'))) %>%
        mutate(
          tasa_tipo = str_replace_all(str_remove(tasa_tipo,"PONDIH"),'_',' ')
        ) %>%
        ggplot(aes_plot) +
        # geom_point() +
        # geom_line()+
        geom_area()+
        scale_fill_brewer(name = 'GRUPO', palette="Set2",na.translate=FALSE) +
        {
          dataset_p2() %>%
            filter(tasa_tipo == 'SIT_TASA') %>%
            mutate(tasa_tipo = 'POB. GEN.') %>%
            group_by(YEAR,TRIMESTER) %>%
            summarise(FECHA=first(FECHA),tasa_tipo = first(tasa_tipo), tasa = first(tasa)) %>%
            geom_line(data=.,mapping=aes(x=FECHA,y=tasa*100,fill=NA),color='black')
        } +
        ylab('Porcentaje') +
        theme_light() +
        theme(axis.title = element_text(size=15),
              axis.text = element_text(size=12)) +
        theme(axis.text.x = element_text(angle = 90)) +
        scale_shape(name = 'GÉNERO') +
        scale_x_date(
          name = '',
          date_breaks = '6 months',
          labels = function(x) {
            xy <- as.numeric(format(x,'%Y'))
            xm <- as.numeric(format(x,'%m'))
            xtri <-case_when(
              xm <= 3 ~ 'I',
              xm <= 6 ~ 'II',
              xm <= 9 ~ 'III',
              TRUE ~ 'IV'
            )
            paste(xy,xtri,sep='-')
          }
        ) +
        labs(title = paste0("Porcentaje de ",input$tasa_tipo, " en zona: ",paste(unlist(ifelse(all(is.null(input$zonas_t2)),'NACIONAL',list(input$zonas_t2))),collapse=',')),caption  = "Citar estos datos como: OCEPP y TDDP (2022). Tablero del nuevo mercado laboral argentino.") + 
        guides(fill = guide_legend(reverse=TRUE))
    }
  })
  
  # output$barrasEP_plot <- renderPlot({
  #   zonas <- unique(input$zonas_t2)
  #   if( length(zonas) == 0 ) 
  #     zonas <- individual_03.hoy %>% 
  #       select_at(input$variable_zona_t2) %>%
  #       unique %>% unlist 
  #   
  #   edades <- unique(input$edades_t2)
  #   if( length(edades) == 0 ) 
  #     edades <- individual_03.hoy %>% 
  #     select_at(paste('EDAD',input$variable_edad_t2,sep='_')) %>%
  #     unique %>% unlist
  #   
  #   aes_plot <- genera_aes_barrasEP_plot(input)
  #   grouping_vars <- genera_grouping_vars_barrasEP_plot(input)
  #   
  #   
  #   individual_03.hoy %>%
  #     group_by(YEAR,TRIMESTER) %>%
  #     filter(max(CB_ECONOMIA_POPULAR) > 0) %>%
  #     ungroup() %>%
  #     filter(YEAR == max(YEAR)) %>%
  #     filter(TRIMESTER == max(TRIMESTER)) %>%
  #     filter(
  #       across(input$variable_zona_t2, ~.x %in% zonas),
  #       across(paste('EDAD',input$variable_edad_t2,sep='_'), ~.x %in% edades)
  #     ) %>%
  #     group_by_at(grouping_vars) %>%
  #     summarise(
  #       IT = sum(IT_ECONOMIA_POPULAR)/sum(ECONOMIA_POPULAR),
  #       LABORAL = sum(IL_ECONOMIA_POPULAR)/sum(ECONOMIA_POPULAR),
  #       NO_LABORAL = sum(INL_ECONOMIA_POPULAR)/sum(ECONOMIA_POPULAR)
  #     ) %>%
  #     mutate(LABORAL_porc = LABORAL/(LABORAL+NO_LABORAL)*100,
  #            NO_LABORAL_porc = NO_LABORAL/(LABORAL+NO_LABORAL)*100) %>%
  #     pivot_longer(cols = c('LABORAL_porc','NO_LABORAL_porc'),names_to = 'TIPO_INGRESO',values_to = 'INGRESO') %>%
  #     mutate(TIPO_INGRESO = str_remove(TIPO_INGRESO,'_porc')) %>%
  #     mutate(TIPO_INGRESO = str_replace(TIPO_INGRESO,'_',' ')) %>%
  #     ggplot(aes_plot) +
  #     geom_bar(stat='identity',position='dodge') +
  #     scale_x_discrete(name = 'INGRESO') +
  #     scale_y_continuous(name = '% del ingreso') +
  #     scale_fill_discrete(name = 'GENERO') +
  #     scale_fill_manual(values=c("#999999", "#E69F00"))+
  #    # scale_fill_brewer(palette="Set1")+
  #     theme_light()+
  #     labs(title = paste0("Porcentage del ingreso según origen"),caption  = "Citar estos datos como: OCEPP y TDDP (2022). Tablero del nuevo mercado laboral argentino. Recuperado de: https://arielolafsalgado.shinyapps.io/tablero_prototipo/")
  #   
  # })
  #   
  # output$plata_para_salir <- renderText({
  #   zonas <- unique(input$zonas_t2)
  #   if( length(zonas) == 0 ) 
  #     zonas <- individual_03.hoy %>% 
  #       select_at(input$variable_zona_t2) %>%
  #       unique %>% unlist 
  #   
  #   edades <- unique(input$edades_t2)
  #   if( length(edades) == 0 ) 
  #     edades <- individual_03.hoy %>% 
  #     select_at(paste('EDAD',input$variable_edad_t2,sep='_')) %>%
  #     unique %>% unlist 
  #   
  #   individual_03.hoy %>%
  #     group_by(YEAR,TRIMESTER) %>%
  #     filter(max(CB_ECONOMIA_POPULAR) > 0) %>%
  #     ungroup() %>%
  #     filter(YEAR == max(YEAR)) %>%
  #     filter(TRIMESTER == max(TRIMESTER)) %>%
  #     filter(
  #       across(input$variable_zona_t2, ~.x %in% zonas),
  #       across(paste('EDAD',input$variable_edad_t2,sep='_'), ~.x %in% edades)
  #     ) %>%
  #     summarise(
  #       IT_EP = sum(IT_ECONOMIA_POPULAR[situacion %in% c('pobre','indigente')],na.rm=TRUE),
  #       CB_EP = sum(CB_ECONOMIA_POPULAR[situacion %in% c('pobre','indigente')],na.rm=TRUE),
  #       EP_POB = sum(ECONOMIA_POPULAR[situacion %in% c('pobre','indigente')],na.rm=TRUE),
  #       TRIMESTER = unique(TRIMESTER),
  #       YEAR = unique(YEAR)
  #     ) %>%
  #     mutate(IFE_EP = CB_EP-IT_EP) %>%
  #     mutate(IFE_PROM = IFE_EP/EP_POB, IT_EP_PROM = IT_EP/EP_POB, CB_EP_PROM = CB_EP/EP_POB) -> resu_IFE
  #   paste('La persona promedio perteneciente a la EP en las regiones consideradas, y en los periodos etarios elegidos necesita (en el año ',resu_IFE$YEAR,' y el trimestre ',resu_IFE$TRIMESTER,') $',ceiling(resu_IFE$CB_EP_PROM),' para no ser pobre. El ingreso promedio de una persona perteneciente a la EP es $',ceiling(resu_IFE$IT_EP_PROM),', y por lo tanto le faltan $',ceiling(resu_IFE$IFE_PROM),' para salir de la pobreza.',sep='')  
  # })
  
  output$descarga_p2 <- downloadHandler(
    filename = 'datos_pestaña2.csv',
    content = function(file) write.csv(dataset_p2(),file,row.names=FALSE)
  )
  
  
  #############################################
  ############ TERCER PANEL ###################
  #############################################
  
  output$edades_posibles_t3 <- renderUI({
    opciones <- individual_03.hoy %>% 
      select_at(paste('EDAD',input$variable_edad_t3,sep='_')) %>%
      unique %>% unlist %>% as.character %>% discard(is.na)
    
    selectInput(
      inputId = "edades_posibles_t3",
      label = "Edades consideradas",
      choices = opciones,
      multiple = TRUE,
      selected = c() )
  })
  
  
  output$variables_posibles_color_t3 <- renderUI({
    opciones <- dataset_p3() %>% 
      colnames() %>% setdiff(c('lon','lat','geometry',input$variable_zona_t3))
    names(opciones) <- str_replace_all(opciones,'_',' ')
    
    selectInput(
      inputId = "variable_color_t3",
      label = "Variable para color",
      choices = opciones,
      multiple = FALSE,
      selected = opciones[1] )
  })
  
  output$variables_posibles_size_t3 <- renderUI({
    opciones <- dataset_p3() %>% 
      colnames() %>% setdiff(c('lon','lat','geometry',input$variable_zona_t3))
    
    
    selectInput(
      inputId = "variable_size_t3",
      label = "Variable para el radio del circulo",
      choices = opciones,
      multiple = FALSE,
      selected = opciones[1] )
  })
  geometrias <- reactive({
    if(input$variable_zona_t3 == 'REGION'){
      st_read('data/regiones.geojson')
    }else{
      st_read('data/aglomerados.geojson')
    }
  })
  
  dataset_p3 <- reactive({
    if(input$paneles == 'mapa'){
      edades <- unique(input$edades_t3)
      if( length(edades) == 0 ) 
        edades <- individual_03.hoy %>% 
          select_at(paste('EDAD',input$variable_edad_t3,sep='_')) %>%
          unique %>% unlist 
      
      
      left_join(
        geometrias(),
        individual_03.hoy %>%
          mutate(YEAR.TRIM = as.numeric(paste(YEAR,TRIMESTER,sep='.'))) %>%
          filter(
            YEAR.TRIM >= as.numeric(input$slider_años_t3[1]),
            YEAR.TRIM <= as.numeric(input$slider_años_t3[2]),
            across(paste('EDAD',input$variable_edad_t3,sep='_'), ~.x %in% edades),
            SEXO %in% unlist(ifelse(input$genero_t3 == 'AMBOS', list(c('VARON','MUJER')), input$genero_t3))
          ) %>%
          group_by_at(input$variable_zona_t3) %>%
          drop_na() %>%
          summarise(
            ECONOMIA_POPULAR = mean(ECONOMIA_POPULAR),
            RESTO_CUENTAPROPISTAS = mean(RESTO_CUENTAPROPISTAS),
            ASALARIADOS_REGISTRADOS = mean(ASALARIADOS_REGISTRADOS),
            ASALARIADOS_NOREGISTRADOS = mean(ASALARIADOS_NOREGISTRADOS),
            PATRONES = mean(PATRONES),
            DESOCUPADES = mean(DESOCUPADES),
            PEA = mean(ECONOMICAMENTE_ACTIVES)
          ),
        by = input$variable_zona_t3) 
    }
  })
  
  output$mapa_p3 <- renderLeaflet({
    leaflet() %>%
      addTiles('https://wms.ign.gob.ar/geoserver/gwc/service/tms/1.0.0/capabaseargenmap@EPSG%3A3857@png/{z}/{x}/{-y}.png', 
               attribution = '<a href="http://leafletjs.com" title="<a href="http://www.ign.gob.ar/AreaServicios/Argenmap/IntroduccionV2" target="_blank">Instituto Geográfico Nacional</a> + <a href="http://www.osm.org/copyright" target="_blank">OpenStreetMap</a>') %>%
      setView(-60,-40, zoom = 3)
  })
  
  colorPal <- reactive({
    x <- as.data.frame(dataset_p3())[[ifelse(is.null(input$variable_color_t3),'ECONOMIA_POPULAR',input$variable_color_t3)]]
    colorNumeric(c('blue','red'),x)
  })
  
  
  observe({
    if(input$paneles == 'mapa'){
      x <- as.data.frame(dataset_p3())[[ifelse(is.null(input$variable_color_t3),'ECONOMIA_POPULAR',input$variable_color_t3)]]
      y <- as.data.frame(dataset_p3())[[ifelse(is.null(input$variable_size_t3),'ECONOMIA_POPULAR',input$variable_size_t3)]]
      titulo <- ifelse(is.null(input$variable_color_t3),'ECONOMIA POPULAR',str_replace_all(input$variable_color_t3,'_',' ')) 
      if(input$mapa_pp == 'Circulos' & input$variable_zona_t3 == 'AGLOMERADO'){
        leafletProxy('mapa_p3') %>%
          clearShapes() %>%
          clearMarkers() %>%
          clearControls() %>%
          addCircleMarkers(data=as.data.frame(dataset_p3()),lng= ~lon,lat = ~lat,
                           color = colorPal()(x),
                           radius = scales::rescale(y,c(1,10))) %>%
          addLegend('topright',pal = colorPal(),values = x,title = titulo) #%>%
        # addCircleLegend(position='topright',range = scales::rescale(y,c(1,10)), scaling_fun = function(x) x)
        
      }else{
        leafletProxy('mapa_p3') %>%
          clearShapes() %>%
          clearMarkers() %>%
          clearControls() %>%
          addPolygons(data=dataset_p3(),
                      color = colorPal()(x)) %>%
          addLegend('topright',pal = colorPal(),values = x,title = titulo) 
      }
    }
  })
})
