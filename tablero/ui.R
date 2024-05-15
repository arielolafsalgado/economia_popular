
library(shiny)
library(shinyWidgets)

shinyUI(
  navbarPage(
    title = "EquiLab",
    ### Primer panel
    tabPanel(
      title = "PRESENTACION", 
      mainPanel(
        HTML(
          "<h1><strong>Presentaci&oacute;n</strong></h1>
  <h3 style='text-align: justify;'><span style='font-weight: 400;'>La economía popular (EP) en el nuevo mercado de trabajo es una iniciativa desarrollada por EquiLab en el marco del Proyecto \"Tablero del nuevo mercado laboral argentino\". Quienes integramos <strong>Equilab</strong> somos un conjunto de profesionales de provenientes de diferentes disciplinas y organizaciones, iniciativas colectivas y centros de estudio tales como <a href='https://sites.google.com/view/tallerdedatospopulares/inicio?authuser=0'>Taller de Datos Populares (TDDP)</a>, el <a href='https://www.ocepp.com/quienes-somos'>Observatorio de Coyuntura Econ&oacute;mica y Pol&iacute;ticas P&uacute;blicas (OCEPP)</a> y la <a href='https://www.facebook.com/enocepnacional/?locale=es_LA'> Escuela Nacional de Organización Comunitaria y Economía Popular (ENOCEP)</a> .&nbsp;</span>&nbsp;</h3>
    <p style='text-align: justify;'>&nbsp;</p>
      <ul style='text-align: justify;'>
        <li style='font-weight: 400;'>
          <h4><strong>La Econom&iacute;a Popular es un fen&oacute;meno estructural que responde a la exclusi&oacute;n del trabajo con derechos de una parte relevante de la poblaci&oacute;n en edad de trabajar. </strong><span style='font-weight: 400;'>Este fen&oacute;meno en nuestro pa&iacute;s tiene un origen hist&oacute;rico que se remonta a la introducci&oacute;n del modelo de valorizaci&oacute;n financiera a mediados de la d&eacute;cada del 70 y sufri&oacute; una fuerte expansi&oacute;n durante la desindustrializaci&oacute;n y las pol&iacute;ticas de desregulaci&oacute;n y flexibilizaci&oacute;n laboral de los 90, con su correlato de enorme crisis del mercado laboral. Durante la recuperaci&oacute;n econ&oacute;mica de la primera d&eacute;cada del siglo XXI la EP se redujo, pero actualmente sigue representando una porci&oacute;n relevante de la PEA, por lo que consideramos que es necesario concebir e incorporar a este sector como parte constitutiva del mercado de trabajo actual en Argentina.&nbsp;</span>&nbsp;</h4>
            </li>
            </ul>
            <ul style='text-align: justify;'>
              <li style='font-weight: 400;'>
                <h4><span style='font-weight: 400;'>Sin embargo, en contraste con su importancia en t&eacute;rminos econ&oacute;micos y sociales, persiste un </span><strong>problema de invisibilizaci&oacute;n de este sector de la econom&iacute;a,</strong><span style='font-weight: 400;'> aun cuando en los &uacute;ltimos a&ntilde;os haya cobrado cierto protagonismo en t&eacute;rminos reivindicativos y medi&aacute;ticos a partir de las demandas llevadas adelante por la organizaci&oacute;n sindical de la Uni&oacute;n de Trabajadores y Trabajadoras de la Econom&iacute;a Popular (UTEP) y diversas organizaciones.</span></h4>
                  </li>
                  </ul>
                  <ul style='text-align: justify;'>
                    <li style='font-weight: 400;'>
                      <h4><span style='font-weight: 400;'>La </span><strong>enorme magnitud y relativa estabilidad de este segmento ocupacional</strong><span style='font-weight: 400;'> debe alertar acerca de la necesidad de implementar pol&iacute;ticas p&uacute;blicas espec&iacute;ficamente dise&ntilde;adas para afrontar los desaf&iacute;os del sector.</span></h4>
                        </li>
                        </ul>
                        <h4 style='text-align: justify;'><br /><strong>El presente Tablero</strong> tiene el objetivo de poner a disposición de investigadorxs de diferentes disciplinas, profesionales técnicos y hacedores de políticas públicas (y de todxs aquellos interesadxs en la temática) datos actualizados, estimaciones y proyecciones que puedan ser de utilidad para analizar el mercado de trabajo en Argentina, incluyendo al universo de la Economía Popular, sus características, y la situación de su inserción en el mercado laboral actual.</h4>
                          <p>&nbsp;</p>"
        ),
        ### Recuadro 1: ¿Qué es la Economía Popular?
        h4(strong('Para más información:')),
        a(h4(strong("Informes OCCEP"), 
             class = "btn btn-default action-button" , 
             style = "fontweight:600"),
          target = "_blank",
          href = "https://www.ocepp.com/economia-popular"),
        a(h4(strong("Formulario de contacto"),
             class = "btn btn-default action-button" , 
             style = "fontweight:600"),
          target = "_blank",
          href = "https://forms.gle/HChBpeEXJ52YWpFG8"),width=15),
      mainPanel(
        HTML(
          "<h1 style='text-align: justify;'><strong>&iquest;Qu&eacute; es la Econom&iacute;a Popular?</strong></h1>
  <h4 style='text-align: justify;'><span style='font-weight: 400;'>Tres aspectos centrales definen si una actividad se desarrolla en el marco de la EP: </span><span style='font-weight: 400;'><br /></span></h4>
    <ol style='text-align: justify;'>
      <li>
      <h4><span style='font-weight: 400;'>Inexistencia de relaci&oacute;n laboral asalariada.&nbsp;</span></h4>
        </li>
        <li>
        <h4><span style='font-weight: 400;'> Actividad trabajo-intensiva con bajo nivel de productividad.&nbsp;</span></h4>
          </li>
          <li>
        <h4><span style='font-weight: 400;'> Desarrollado en la cultura popular
.&nbsp;</span></h4>
          </li>
          </ol>
          <h4 style='text-align: justify;'><span style='font-weight: 400;'>Otras caracter&iacute;sticas distintivas de la EP son: la obsolescencia o baja complejidad de las m&aacute;quinas y herramientas; la autogesti&oacute;n (individual o colectiva), por lo general sin derechos laborales b&aacute;sicos; y el hecho de consistir en estrategias defensivas de supervivencia, frente a la imposibilidad de acceder al empleo asalariado.</span></h4>
            <h4 style='text-align: justify;'><span style='font-weight: 400;'>Adem&aacute;s de los criterios &ldquo;objetivos&rdquo; que delimitan el sector, pueden destacarse caracter&iacute;sticas socioculturales que afectan transversalmente en mayor o menor grado a las personas que realizan actividades en el marco de la EP (aunque no refieran a aspectos espec&iacute;ficos de la misma). En forma muy sint&eacute;tica puede mencionarse la falta de reconocimiento institucional (informalidad de las actividades y de los espacios de trabajo), la inseguridad habitacional, la existencia de importantes grupos de poblaci&oacute;n migrante, entre otras. As&iacute;, la EP abarca un conjunto enormemente heterog&eacute;neo de actividades, con caracter&iacute;sticas muy dis&iacute;miles entre s&iacute;: la recolecci&oacute;n de residuos urbanos, la agricultura familiar, la comercializaci&oacute;n informal en la v&iacute;a p&uacute;blica y medios de transporte, la producci&oacute;n textil, y muchas otras ramas de actividad.</span></h4>
              <h4 style='text-align: justify;'><span style='font-weight: 400;'> La EP abarca un conjunto enormemente heterogéneo de actividades, con características muy disímiles entre sí: la recolección de residuos urbanos, la agricultura familiar, la comercialización informal en la vía pública y medios de transporte, la producción textil, y muchas otras ramas de actividad.</span></h4>
              <h4 style='text-align: justify;'><span style='font-weight: 400;'>Fuente: OCEPP (2021) La Econom&iacute;a Popular. Total de trabajadorxs, ingresos y transiciones laborales. <a href='https://www.ocepp.com/post/la-econom%C3%ADa-popular-total-de-trabajadorxs-ingresos-y-transiciones-laborales'>[Link]</a></span></h4>
"
        ),
        width = 6), # Fin recuadro 1
      
      ###Recuadro 2: ¿Quiénes somos?
      mainPanel(
        HTML(
          "<h2 style='font-weight: 400;'><strong>&iquest;Qui&eacute;nes somos?</strong></h2>
  <p style='font-weight: 400;'><img src='https://github.com/ipatop/economia_popular/blob/main/tablero/logos/taller.png?raw=true' alt='' width='162' height='55' /></p>
    <p style='font-weight: 400;'><a href='https://sites.google.com/view/tallerdedatospopulares/inicio?authuser=0&amp;pli=1'>El Taller de Datos Populares (TDDP)</a>&nbsp;agrupa a graduades, docentes, investigadores y estudiantes de la Facultad de Ciencias Exactas y Naturales de la Universidad de Buenos Aires (FCEN-UBA) en&nbsp;un espacio de vinculaci&oacute;n para trabajar junto a cooperativas, movimientos sociales,&nbsp; agrupaciones ambientales, etc, generando herramientas y respuestas para aportar a problem&aacute;ticas sociales desde la Ciencia de Datos, la programaci&oacute;n y la tecnolog&iacute;a. El&nbsp;&ldquo;Tablero del nuevo mercado laboral argentino&rdquo;&nbsp;es uno de los proyectos que hemos desarrollado en vinculaci&oacute;n con el OCEPP y organizaciones sociales de la Econom&iacute;a Popular.&nbsp;</p>
      <p style='font-weight: 400;'><img src='https://github.com/ipatop/economia_popular/blob/main/tablero/logos/OCEPP.png?raw=true' srcset='https://static.wixstatic.com/media/54048a_ed2d21d85fe94a469cefc0b7cab738dc~mv2.png/v1/crop/x_1,y_17,w_799,h_208/fill/w_430,h_114,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo2.png' alt='logo2.png' width='177' height='47' /></p>
        <p style='font-weight: 400;'>El&nbsp;<a href='https://www.ocepp.com/'>OCEPP</a>&nbsp;es un espacio de economistas y profesionales de otras disciplinas que nos desempe&ntilde;amos tanto del &aacute;mbito acad&eacute;mico como t&eacute;cnico. Desde el OCEPP integramos la Fundaci&oacute;n Igualdad realizamos informes peri&oacute;dicos, capacitaciones, desarrollo de indicadores e informes sobre temas de Econom&iacute;a Popular, Desarrollo Econ&oacelute;mico y Macroeconom&iacute;a. En particular, el desarrollo de una&nbsp;<a href='https://www.ocepp.com/post/la-econom%C3%ADa-popular-total-de-trabajadorxs-ingresos-y-transiciones-laborales'>estimaci&oacute;n propia sobre el universo de la Econom&iacute;a Popular</a>, diversos&nbsp;<a href='https://www.ocepp.com/economia-popular'>documentos</a>&nbsp;que buscan conceptualizar este fen&oacute;meno, y el informe trimestral&nbsp;<a href='https://www.ocepp.com/post/monitor-de-la-economia-popular-agosto-2022'>&ldquo;Monitor de la Econom&iacute;a Popular&rdquo;</a>&nbsp;forman parte de los antecedentes e insumos en los que se basa el&nbsp;&ldquo;Tablero del nuevo mercado laboral argentino&rdquo;.&nbsp;</p>
          <p style='font-weight: 400;'><img class='header_logo header-logo' src='https://github.com/ipatop/economia_popular/blob/main/tablero/logos/ENOCEPchico.jpg?raw=true' alt='' width='180' height='80' /><br />ENOCEP se fundó con el objetivo de fortalecer a los movimientos populares contribuyendo a la formación de trabajadores y trabajadoras de la economía popular, dirigentes y militantes.  Es una iniciativa de la Secretaría de Formación de la Unión de Trabajadores de la Economía Popular (UTEP) . Por las características del universo de trabajadores que representamos y las reivindicaciones mezclan atributos políticos y gremiales, por lo tanto el análisis y comprensión de las políticas públicas es fundamental a la hora de proponer e influir en la definición de políticas públicas. </p>"
        ),
        width=6)
    ), # Fin panel 1
    # Comienzo panel 2
    tabPanel(
      title = "La EP en el mercado de trabajo", 
      # Sidebar con inputs
      sidebarLayout(
        sidebarPanel(
          checkboxInput("separar_genero",
                        "¿Separar por género?",
                        value=FALSE),
          checkboxInput("separar_zonas",
                        "¿Separar por zonas?",
                        value=FALSE),
          checkboxInput("usar_porcentaje_pea",
                        "¿Graficar como porcentaje de la PEA?",
                        value=TRUE),
          checkboxGroupInput("ocupaciones",
                             "Categorías ocupacionales",
                             choiceNames = c("RESTO CUENTAPROPISTAS",
                                             "ASALARIADOS REGISTRADOS", 
                                             "ASALARIADOS NO REGISTRADOS",
                                             "PATRONES",
                                             'DESOCUPADOS'),
                             choiceValues = c("RESTO_CUENTAPROPISTAS",
                                              "ASALARIADOS_REGISTRADOS",
                                              "ASALARIADOS_NOREGISTRADOS", 
                                              "PATRONES",
                                              "DESOCUPADES")
          ),
          sliderInput("slider_años", 
                      label = 'Rango de años',
                      min = 2003, 
                      max = 2024, 
                      value = c(2003, 2024),
                      step = 1,
                      sep = ''),
          selectInput(
            inputId = "variable_zona",
            label = "Zonas a considerar",
            choices = c("REGION","AGLOMERADO"),
            multiple = FALSE,
            selected = "REGION"),
          uiOutput("zonas_posibles"),
          selectInput(
            inputId = "variable_edad",
            label = "Partición de la edad",
            choices = c("QUINQUENIO","DECENIO"),
            multiple = FALSE,
            selected = "QUINQUENIO"),
          uiOutput("edades_posibles"),
          downloadButton("descarga_p1", "Descargar dataset")
        ),
        
        # Gráfico de cantidad de personas participando de la economía popular
        mainPanel(
          plotOutput("cantTrabEP_plot")
        )
      )
    ),
    # Comienzo panel 3
    tabPanel("Pobreza e indigencia en la EP",
             # Sidebar con inputs
             sidebarLayout(
               sidebarPanel(
                 selectInput(
                   inputId = "tasa_tipo",
                   label = "TASA",
                   choices = c("POBREZA","INDIGENCIA"),
                   multiple = FALSE,
                   selected = "POBREZA"),
                 checkboxInput("separar_genero_t2",
                               "¿Separar por género?",
                               value=FALSE),
                 sliderInput("slider_años_t2", 
                             label = 'Rango de años',
                             min = 2016, 
                             max = 2024, 
                             value = c(2016, 2024),
                             step = 1,
                             sep = ''),
                 checkboxGroupInput("ocupaciones_t2", 
                                    "CATEGORIAS OCUPACIONALES",
                                    choiceNames = c("OCUPADOS (NO EP)",
                                                    "CUENTAPROPISTAS (NO EP)",
                                                    "ASALARIADOS REGISTRADOS",
                                                    "ASALARIADOS NO REGISTRADOS",
                                                    "PATRONES",
                                                    "DESOCUPADOS",
                                                    "ECONOMICAMENTE INACTIVOS"),
                                    choiceValues = c("OCUPADES_NO_EP_PONDIH",
                                                     "RESTO_CUENTAPROPISTAS_PONDIH",
                                                     "ASALARIADOS_REGISTRADOS_PONDIH",
                                                     "ASALARIADOS_NOREGISTRADOS_PONDIH",
                                                     "PATRONES_PONDIH",
                                                     "DESOCUPADES_PONDIH",
                                                     "ECONOMICAMENTE_INACTIVES_PONDIH")
                 ),
                 selectInput(
                   inputId = "variable_zona_t2",
                   label = "Zonas a considerar",
                   choices = c("REGION","AGLOMERADO"),
                   multiple = FALSE,
                   selected = "REGION"),
                 uiOutput("zonas_posibles_t2"),
                 selectInput(
                   inputId = "variable_edad_t2",
                   label = "Partición de la edad",
                   choices = c("QUINQUENIO","DECENIO"),
                   multiple = FALSE,
                   selected = "QUINQUENIO"),
                 uiOutput("edades_posibles_t2"),
                 downloadButton("descarga_p2", "Descargar dataset")
               ),
               # Gráfico de cantidad de personas participando de la economía popular
               mainPanel(
                 plotOutput("pobrezaEP_plot")
               )
             )
    ),
    tabPanel(
      "EP en el espacio",
      # Sidebar con inputs
      sidebarLayout(
        sidebarPanel(
          selectInput(
            inputId = "mapa_pp",
            label = "Elementos en mapa",
            choices = c("Circulos","Poligonos"),
            multiple = FALSE,
            selected = "SELECCIONAR"),
          selectInput(
            inputId = "genero_t3",
            label = "Genero",
            choices = c("VARON","MUJER","AMBOS"),
            multiple = FALSE,
            selected = "AMBOS"),
          sliderTextInput("slider_años_t3", 
                      label = 'Agregar sobre rango de años:',
                      choices = c(sapply(2016:2022,function(x) paste(x,1:4,sep='.'))),
                      selected = c('2022.1','2022.2')),
          uiOutput("variables_posibles_color_t3"),
          uiOutput("variables_posibles_size_t3"),
          selectInput(
            inputId = "variable_zona_t3",
            label = "Tipo de zonas",
            choices = c("REGION","AGLOMERADO"),
            multiple = FALSE,
            selected = "AGLOMERADO"),
          selectInput(
            inputId = "variable_edad_t3",
            label = "Partición de la edad",
            choices = c("QUINQUENIO","DECENIO"),
            multiple = FALSE,
            selected = "QUINQUENIO"),
          uiOutput("edades_posibles_t3"),
          downloadButton("descarga_p3", "Descargar mapa")
        ),
        # Gráfico de cantidad de personas participando de la economía popular
        mainPanel(
          leafletOutput("mapa_p3")
        )
        
      )
    )
  )
)