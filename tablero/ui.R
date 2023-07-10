
library(shiny)

# Define UI for application that draws a histogram
shinyUI(
  navbarPage("La Economía Popular",
             tabPanel("PRESENTACION", 
                      #primera pagina
                      HTML("<h1><strong>Presentaci&oacute;n</strong></h1>
  <h3 style='text-align: justify;'><span style='font-weight: 400;'>&ldquo;La econom&iacute;a popular en el nuevo mercado de trabajo&rdquo; es una iniciativa desarrollada en conjunto por una red de profesionales de diferentes disciplinas y por organizaciones, iniciativas colectivas y centros de estudio como <a href='https://sites.google.com/view/tallerdedatospopulares/inicio?authuser=0'>Taller de Datos Populares (TDDP)</a>, el <a href='https://www.ocepp.com/quienes-somos'>Observatorio de Coyuntura Econ&oacute;mica y Pol&iacute;ticas P&uacute;blicas (OCEPP)</a> y la <a href='https://www.facebook.com/enocepnacional/?locale=es_LA'> Escuela Nacional de Organziación Comunitaria y Economía Popular (ENOCEP)</a> .&nbsp;</span>&nbsp;</h3>
    <p style='text-align: justify;'>&nbsp;</p>
      <ul style='text-align: justify;'>
        <li style='font-weight: 400;'>
          <h4><strong>La Econom&iacute;a Popular es un fen&oacute;meno estructural que responde a la exclusi&oacute;n del trabajo con derechos de una parte relevante de la poblaci&oacute;n en edad de trabajar. </strong><span style='font-weight: 400;'>Este fen&oacute;meno en nuestro pa&iacute;s tiene un origen hist&oacute;rico que se remonta a la introducci&oacute;n del modelo de valorizaci&oacute;n financiera a mediados de la d&eacute;cada del setenta y sufri&oacute; una fuerte expansi&oacute;n durante la desindustrializaci&oacute;n y las pol&iacute;ticas de desregulaci&oacute;n y flexibilizaci&oacute;n laboral de los noventa, con su correlato de enorme crisis del mercado laboral. Durante la recuperaci&oacute;n econ&oacute;mica de la primera d&eacute;cada del siglo XXI la EP se redujo, pero actualmente sigue representando una porci&oacute;n relevante de la PEA, por lo que consideramos que es necesario concebir e incorporar a este sector como parte constitutiva del mercado de trabajo actual en Argentina.&nbsp;</span>&nbsp;</h4>
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
                        <h4 style='text-align: justify;'><br /><strong>El presente Tablero tiene el objetivo de poner a disposici&oacute;n</strong><span style='font-weight: 400;'> de investigadorxs de diferentes disciplinas, profesionales t&eacute;cnicos y hacedores de pol&iacute;ticas p&uacute;blicas (y de todxs aquellos interesadxs en la tem&aacute;tica) </span><strong>datos actualizados, estimaciones y proyecciones</strong><span style='font-weight: 400;'> que puedan ser de utilidad para analizar el universo de la EP, sus caracter&iacute;sticas, las especificidades de este sector y la situaci&oacute;n de su inserci&oacute;n en el mercado de trabajo argentino actual. &nbsp;</span></h4>
                          <p>&nbsp;</p>"
                      ),
                      #Recuadro 1: ¿Qué es la Economía Popular?
                      
                      mainPanel(HTML("<h1 style='text-align: justify;'><strong>&iquest;Qu&eacute; es la Econom&iacute;a Popular?</strong></h1>
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
              <h4 style='text-align: justify;'><span style='font-weight: 400;'>Fuente: OCEPP (2021) La Econom&iacute;a Popular. Total de trabajadorxs, ingresos y transiciones laborales. </span></h4>
                <h4 style='text-align: justify;'><span style='font-weight: 400;'>Disponible en:&nbsp;</span><a href='https://www.ocepp.com/post/la-econom%C3%ADa-popular-total-de-trabajadorxs-ingresos-y-transiciones-laborales'><span style='font-weight: 400;'>https://www.ocepp.com/post/la-econom%C3%ADa-popular-total-de-trabajadorxs-ingresos-y-transiciones-laborales</span></a><br style='font-weight: 400;' /><br style='font-weight: 400;' /><br /></h4>"),width = 6),
                      
                      #Recuadro 2: ¿Quiénes somos?
                      mainPanel(HTML("<h2 style='font-weight: 400;'><strong>&iquest;Qui&eacute;nes somos?</strong></h2>
  <p style='font-weight: 400;'><img src='https://github.com/ipatop/economia_popular/blob/main/tablero/logos/taller.png?raw=true' alt='' width='162' height='55' /></p>
    <p style='font-weight: 400;'><a href='https://sites.google.com/view/tallerdedatospopulares/inicio?authuser=0&amp;pli=1'>El Taller de Datos Populares (TDDP)</a>&nbsp;agrupa a graduades, docentes, investigadores y estudiantes de la Facultad de Ciencias Exactas y Naturales de la Universidad de Buenos Aires (FCEN-UBA) en&nbsp;un espacio de vinculaci&oacute;n para trabajar junto a cooperativas, movimientos sociales,&nbsp; agrupaciones ambientales, etc, generando herramientas y respuestas para aportar a problem&aacute;ticas sociales desde la Ciencia de Datos, la programaci&oacute;n y la tecnolog&iacute;a. El&nbsp;&ldquo;Tablero del nuevo mercado laboral argentino&rdquo;&nbsp;es uno de los proyectos que hemos desarrollado en vinculaci&oacute;n con el OCEPP y organizaciones sociales de la Econom&iacute;a Popular.&nbsp;</p>
      <p style='font-weight: 400;'><img src='https://github.com/ipatop/economia_popular/blob/main/tablero/logos/OCEPP.png?raw=true' srcset='https://static.wixstatic.com/media/54048a_ed2d21d85fe94a469cefc0b7cab738dc~mv2.png/v1/crop/x_1,y_17,w_799,h_208/fill/w_430,h_114,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo2.png' alt='logo2.png' width='177' height='47' /></p>
        <p style='font-weight: 400;'>El&nbsp;<a href='https://www.ocepp.com/'>OCEPP</a>&nbsp;es un espacio de economistas y profesionales de otras disciplinas que nos desempe&ntilde;amos tanto del &aacute;mbito acad&eacute;mico como t&eacute;cnico. Desde el OCEPP integramos la Fundaci&oacute;n Igualdad realizamos informes peri&oacute;dicos, capacitaciones, desarrollo de indicadores e informes sobre temas de Econom&iacute;a Popular, Desarrollo Econ&oacelute;mico y Macroeconom&iacute;a. En particular, el desarrollo de una&nbsp;<a href='https://www.ocepp.com/post/la-econom%C3%ADa-popular-total-de-trabajadorxs-ingresos-y-transiciones-laborales'>estimaci&oacute;n propia sobre el universo de la Econom&iacute;a Popular</a>, diversos&nbsp;<a href='https://www.ocepp.com/economia-popular'>documentos</a>&nbsp;que buscan conceptualizar este fen&oacute;meno, y el informe trimestral&nbsp;<a href='https://www.ocepp.com/post/monitor-de-la-economia-popular-agosto-2022'>&ldquo;Monitor de la Econom&iacute;a Popular&rdquo;</a>&nbsp;forman parte de los antecedentes e insumos en los que se basa el&nbsp;&ldquo;Tablero del nuevo mercado laboral argentino&rdquo;.&nbsp;</p>
          <p style='font-weight: 400;'><img class='header_logo header-logo' src='https://github.com/ipatop/economia_popular/blob/main/tablero/logos/ENOCEPchico.jpg?raw=true' alt='' width='180' height='80' /><br />ENOCEP se fundó con el objetivo de fortalecer a los movimientos populares contribuyendo a la formación de trabajadores y trabajadoras de la economía popular, dirigentes y militantes.  Es una iniciativa de la Secretaría de Formación de la Unión de Trabajadores de la Economía Popular (UTEP) . Por las características del universo de trabajadores que representamos y las reivindicaciones mezclan atributos políticos y gremiales, por lo tanto el análisis y comprensión de las políticas públicas es fundamental a la hora de proponer e influir en la definición de políticas públicas. </p>
  
            <h4 style='font-weight: 400;'><span style='font-weight: 400;'>&iquest;Te interesa sumarte a la red? Escribinos!&nbsp;</span></h4>
              <p style='font-weight: 400;'><span style='font-weight: 400;'><a href='mailto:observatoriocoyunturaeconomica@gmail.com'>observatoriocoyunturaeconomica@gmail.com</a>&nbsp;</span></p>
                  <p style='font-weight: 400;'><span style='font-weight: 400;'><a href='mailto:tallerdedatospopulares@gmail.com'>tallerdedatospopulares@gmail.com</a>&nbsp;</span></p>"),width = 6),
                      
             ),
             
             tabPanel("La Economía Popular en el tiempo",
                      
                      # Sidebar with a slider input for number of bins
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
                                             "¿Separar por ocupación?",
                                             choiceNames = c("RESTO CUENTAPROPISTAS", 
                                                             "ASALARIADOS REGISTRADOS", 
                                                             "ASALARIADOS NO REGISTRADOS",
                                                             "PATRONES",
                                                             'DESOCUPADES'),
                                             choiceValues = c("RESTO_CUENTAPROPISTAS",
                                                              "ASALARIADOS_REGISTRADOS",
                                                              "ASALARIADOS_NOREGISTRADOS", 
                                                              "PATRONES",
                                                              "DESOCUPADES")
                          ),
                          
                          sliderInput("slider_años", 
                                      label = 'Rango de años',
                                      min = 2003, 
                                      max = 2022, 
                                      value = c(2003, 2022),
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
                      
                      #Texto interpretatitivo 
                      #          mainPanel(HTML("<h3 style='text-align: center;'><strong>Breve an&aacute;lisis de los datos por OCEPP</strong></h3>
                      # <p style='text-align: justify;'><span style='font-weight: 400;'>Si bien la EP como fen&oacute;meno social en Argentina se da a partir del sistema de acumulaci&oacute;n basado en la valorizaci&oacute;n financiera impuesto en la d&eacute;cada del setenta, y se expande durante el proceso desindustrializador de la convertibilidad, resulta interesante analizar el per&iacute;odo inmediatamente posterior, desde 2003 hasta 2020, porque el mismo abarca un ciclo econ&oacute;mico completo (crecimiento, estancamiento y recesi&oacute;n). Esto nos permite observar, en primer lugar, cu&aacute;l fue la din&aacute;mica del sector en un contexto en el que el mercado de trabajo argentino mostr&oacute; notables signos de recuperaci&oacute;n. Y a su vez, c&oacute;mo respondi&oacute; la EP a partir del estancamiento y posterior crisis del &uacute;ltimo lustro.&nbsp;</span></p>
                      #   <p style='text-align: justify;'>De acuerdo a los datos de la EPH, al comienzo del per&iacute;odo en consideraci&oacute;n se puede observar una poblaci&oacute;n ocupada de casi 9 millones de personas, donde aproximadamente el 20% corresponde al universo de la EP. Durante los primeros a&ntilde;os, como consecuencia de la recuperaci&oacute;n econ&oacute;mica, el mercado laboral argentino mostr&oacute; fuertes signos de recuperaci&oacute;n. Entre el a&ntilde;o 2003 y 2011, la tasa de desocupaci&oacute;n se redujo en 10 puntos porcentuales (p.p.) -llegando a representar el 7% de la PEA- y se incrementaron las tasas de actividad y de empleo. Sin embargo, en este per&iacute;odo las transiciones laborales desde la EP hacia el sector formal fueron reducidas, lo cual se observa en la rigidez a la baja de la EP como porcentaje de la PEA y la poblaci&oacute;n ocupada. De acuerdo a las estimaciones realizadas, entre 2003 y 2011 la proporci&oacute;n de individuos de la EP como porcentaje de la poblaci&oacute;n ocupada s&oacute;lo se redujo en 2 pp., representando el 15,6% en el a&ntilde;o 2011, que a su vez es el valor m&aacute;s bajo de toda la serie.</p>
                      #     <p style='text-align: justify;'>Si analizamos la evoluci&oacute;n de la cantidad de personas ocupadas en los diferentes segmentos ocupacionales (gr&aacute;fico 2), se aprecia que la EP se mantiene relativamente estable entre 2003 y 2011 (con una leve ca&iacute;da), mientras que se observa un importante crecimiento de la cantidad de asalariadxs registrados. Por otro lado, se verifica una tendencia decreciente en la cantidad de asalariadxs no registrados. Si bien esta apreciaci&oacute;n no implica desconocer la existencia de transiciones laborales virtuosas en cascada -desde la inactividad y desempleo hacia la EP y desde all&iacute; hacia el empleo asalariado formal-, &eacute;sta resulta d&eacute;bil y no suficiente para reducir el peso relativo de la EP en la estructura ocupacional de forma significativa.</p>
                      #       <p style='text-align: justify;'>Durante los &uacute;ltimos a&ntilde;os del gobierno kirchnerista la econom&iacute;a argentina comenz&oacute; a experimentar un estancamiento debido a cuestiones estructurales y a un contexto internacional m&aacute;s desfavorable. Asimismo, con el triunfo de la Alianza Cambiemos en las elecciones de 2015, se dio inicio a un nuevo plan econ&oacute;mico que volv&iacute;a al esquema de valorizaci&oacute;n financiera de d&eacute;cadas anteriores. Como era de esperarse, este modelo redund&oacute; en una profunda recesi&oacute;n econ&oacute;mica, con ca&iacute;da del poder adquisitivo, regresividad distributiva y la apertura de un nuevo ciclo de deterioro del mercado laboral argentino.</p>
                      #         <p style='text-align: justify;'><span style='font-weight: 400;'>En este nuevo contexto, el sector de la EP comenz&oacute; a registrar un incremento, no s&oacute;lo en t&eacute;rminos absolutos, sino tambi&eacute;n relativos con respecto al total de ocupados y la PEA. De hecho, tal como puede observarse en el gr&aacute;fico 2, a partir de 2016 se aceler&oacute; la tasa de crecimiento de trabajadoras y trabajadores de la EP. Este efecto pareciera indicar que ante los ciclos recesivos, la EP absorbe a parte de lxs trabajadorxs que pierden su puesto de trabajo, fundamentalmente del sector informal.&nbsp;</span></p>
                      #           <p style='text-align: justify;'><span style='font-weight: 400;'>Al observar la evoluci&oacute;n del sector durante casi las &uacute;ltimas dos d&eacute;cadas se puede afirmar que se trata de un fen&oacute;meno estructural, que no necesariamente sigue las tendencias del resto del mercado laboral cuando &eacute;ste se recompone, pero s&iacute; supone una fuente de subsistencia para muchas personas que son excluidas del sector formal.</span></p>
                      #             <p style='text-align: justify;'><br style='font-weight: 400;' /><br style='font-weight: 400;' /></p>"),width = 12)
             ),
             
             tabPanel("Pobreza e indigencia en la EP",
                      
                      
                      # Sidebar with a slider input for number of bins
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
                                      max = 2022, 
                                      value = c(2016, 2022),
                                      step = 1,
                                      sep = ''),
                          
                          checkboxGroupInput("ocupaciones_t2", 
                                             "¿Separar por ocupación?",
                                             choiceNames = c("OCUPADES NO EP", 
                                                             "OCUPADES"),
                                             choiceValues = c("tasa_OCU_NEP",
                                                              "tasa_OCU")
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
                          plotOutput("pobrezaEP_plot"),
                          plotOutput("barrasEP_plot"),
                          textOutput("plata_para_salir")
                        )
                      ),
                      tabPanel("Informes y Contacto",
                               
                               mainPanel("Para ver todolos los informes accede a https://www.ocepp.com/economia-popular"),
                               shiny::a(h4("Informes OCCEP", class = "btn btn-default action-button" , 
                                           style = "fontweight:600"), target = "_blank",
                                        href = "https://www.ocepp.com/economia-popular"),
                               mainPanel("Para contactarnos escribí un mail a observatoriocoyunturaeconomica@gmail.com, tallerdedatospopulares@gmail.com, o accedé al siguient link: https://forms.gle/HChBpeEXJ52YWpFG8"),
                               shiny::a(h4("Formulario de contacto", class = "btn btn-default action-button" , 
                                           style = "fontweight:600"), target = "_blank",
                                        href = "https://forms.gle/HChBpeEXJ52YWpFG8"))
                      
             )
  )
)