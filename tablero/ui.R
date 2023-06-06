
library(shiny)

# Define UI for application that draws a histogram
shinyUI(navbarPage("La Economía Popular",
                   
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
  <p style='font-weight: 400;'><img class='CENy8b' src='https://lh4.googleusercontent.com/QYb8KSZB1FFCuFcYq3Y6Mq6k4Sjs-s9AmBzwmAUOthFcGI3pS9xMFcEGVrUVjLP9aoXbSLNhYkfAHK_MQKcQ07JKySbG1EV8d7dWq_BuD0AHE96wL_uenbtyRI-H9i1bhw=w1280' alt='' width='162' height='55' /></p>
    <p style='font-weight: 400;'><a href='https://sites.google.com/view/tallerdedatospopulares/inicio?authuser=0&amp;pli=1'>El Taller de Datos Populares (TDDP)</a>&nbsp;agrupa a graduades, docentes, investigadores y estudiantes de la Facultad de Ciencias Exactas y Naturales de la Universidad de Buenos Aires (FCEN-UBA) en&nbsp;un espacio de vinculaci&oacute;n para trabajar junto a cooperativas, movimientos sociales,&nbsp; agrupaciones ambientales, etc, generando herramientas y respuestas para aportar a problem&aacute;ticas sociales desde la Ciencia de Datos, la programaci&oacute;n y la tecnolog&iacute;a. El&nbsp;&ldquo;Tablero del nuevo mercado laboral argentino&rdquo;&nbsp;es uno de los proyectos que hemos desarrollado en vinculaci&oacute;n con el OCEPP y organizaciones sociales de la Econom&iacute;a Popular.&nbsp;</p>
      <p style='font-weight: 400;'><img src='https://static.wixstatic.com/media/54048a_ed2d21d85fe94a469cefc0b7cab738dc~mv2.png/v1/crop/x_1,y_17,w_799,h_208/fill/w_430,h_114,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo2.png' srcset='https://static.wixstatic.com/media/54048a_ed2d21d85fe94a469cefc0b7cab738dc~mv2.png/v1/crop/x_1,y_17,w_799,h_208/fill/w_430,h_114,al_c,q_85,usm_0.66_1.00_0.01,enc_auto/logo2.png' alt='logo2.png' width='177' height='47' /></p>
        <p style='font-weight: 400;'>El&nbsp;<a href='https://www.ocepp.com/'>OCEPP</a>&nbsp;es un espacio de economistas y profesionales de otras disciplinas que nos desempe&ntilde;amos tanto del &aacute;mbito acad&eacute;mico como t&eacute;cnico. Desde el OCEPP integramos la Fundaci&oacute;n Igualdad realizamos informes peri&oacute;dicos, capacitaciones, desarrollo de indicadores e informes sobre temas de Econom&iacute;a Popular, Desarrollo Econ&oacelute;mico y Macroeconom&iacute;a. En particular, el desarrollo de una&nbsp;<a href='https://www.ocepp.com/post/la-econom%C3%ADa-popular-total-de-trabajadorxs-ingresos-y-transiciones-laborales'>estimaci&oacute;n propia sobre el universo de la Econom&iacute;a Popular</a>, diversos&nbsp;<a href='https://www.ocepp.com/economia-popular'>documentos</a>&nbsp;que buscan conceptualizar este fen&oacute;meno, y el informe trimestral&nbsp;<a href='https://www.ocepp.com/post/monitor-de-la-economia-popular-agosto-2022'>&ldquo;Monitor de la Econom&iacute;a Popular&rdquo;</a>&nbsp;forman parte de los antecedentes e insumos en los que se basa el&nbsp;&ldquo;Tablero del nuevo mercado laboral argentino&rdquo;.&nbsp;</p>
          <p style='font-weight: 400;'><img class='header_logo header-logo' src='data:image/png;base64,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' alt='' width='173' height='173' /><br />ENOCEP se fundó con el objetivo de fortalecer a los movimientos populares contribuyendo a la formación de trabajadores y trabajadoras de la economía popular, dirigentes y militantes.  Es una iniciativa de la Secretaría de Formación de la Unión de Trabajadores de la Economía Popular (UTEP) . Por las características del universo de trabajadores que representamos y las reivindicaciones mezclan atributos políticos y gremiales, por lo tanto el análisis y comprensión de las políticas públicas es fundamental a la hora de proponer e influir en la definición de políticas públicas. </p>
  
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
           ),
           
           #Texto interpretatitivo 
           mainPanel(HTML("<h3 style='text-align: center;'><strong>Breve an&aacute;lisis de los datos por OCEPP</strong></h3>
  <p style='text-align: justify;'><span style='font-weight: 400;'>Si bien la EP como fen&oacute;meno social en Argentina se da a partir del sistema de acumulaci&oacute;n basado en la valorizaci&oacute;n financiera impuesto en la d&eacute;cada del setenta, y se expande durante el proceso desindustrializador de la convertibilidad, resulta interesante analizar el per&iacute;odo inmediatamente posterior, desde 2003 hasta 2020, porque el mismo abarca un ciclo econ&oacute;mico completo (crecimiento, estancamiento y recesi&oacute;n). Esto nos permite observar, en primer lugar, cu&aacute;l fue la din&aacute;mica del sector en un contexto en el que el mercado de trabajo argentino mostr&oacute; notables signos de recuperaci&oacute;n. Y a su vez, c&oacute;mo respondi&oacute; la EP a partir del estancamiento y posterior crisis del &uacute;ltimo lustro.&nbsp;</span></p>
    <p style='text-align: justify;'>De acuerdo a los datos de la EPH, al comienzo del per&iacute;odo en consideraci&oacute;n se puede observar una poblaci&oacute;n ocupada de casi 9 millones de personas, donde aproximadamente el 20% corresponde al universo de la EP. Durante los primeros a&ntilde;os, como consecuencia de la recuperaci&oacute;n econ&oacute;mica, el mercado laboral argentino mostr&oacute; fuertes signos de recuperaci&oacute;n. Entre el a&ntilde;o 2003 y 2011, la tasa de desocupaci&oacute;n se redujo en 10 puntos porcentuales (p.p.) -llegando a representar el 7% de la PEA- y se incrementaron las tasas de actividad y de empleo. Sin embargo, en este per&iacute;odo las transiciones laborales desde la EP hacia el sector formal fueron reducidas, lo cual se observa en la rigidez a la baja de la EP como porcentaje de la PEA y la poblaci&oacute;n ocupada. De acuerdo a las estimaciones realizadas, entre 2003 y 2011 la proporci&oacute;n de individuos de la EP como porcentaje de la poblaci&oacute;n ocupada s&oacute;lo se redujo en 2 pp., representando el 15,6% en el a&ntilde;o 2011, que a su vez es el valor m&aacute;s bajo de toda la serie.</p>
      <p style='text-align: justify;'>Si analizamos la evoluci&oacute;n de la cantidad de personas ocupadas en los diferentes segmentos ocupacionales (gr&aacute;fico 2), se aprecia que la EP se mantiene relativamente estable entre 2003 y 2011 (con una leve ca&iacute;da), mientras que se observa un importante crecimiento de la cantidad de asalariadxs registrados. Por otro lado, se verifica una tendencia decreciente en la cantidad de asalariadxs no registrados. Si bien esta apreciaci&oacute;n no implica desconocer la existencia de transiciones laborales virtuosas en cascada -desde la inactividad y desempleo hacia la EP y desde all&iacute; hacia el empleo asalariado formal-, &eacute;sta resulta d&eacute;bil y no suficiente para reducir el peso relativo de la EP en la estructura ocupacional de forma significativa.</p>
        <p style='text-align: justify;'>Durante los &uacute;ltimos a&ntilde;os del gobierno kirchnerista la econom&iacute;a argentina comenz&oacute; a experimentar un estancamiento debido a cuestiones estructurales y a un contexto internacional m&aacute;s desfavorable. Asimismo, con el triunfo de la Alianza Cambiemos en las elecciones de 2015, se dio inicio a un nuevo plan econ&oacute;mico que volv&iacute;a al esquema de valorizaci&oacute;n financiera de d&eacute;cadas anteriores. Como era de esperarse, este modelo redund&oacute; en una profunda recesi&oacute;n econ&oacute;mica, con ca&iacute;da del poder adquisitivo, regresividad distributiva y la apertura de un nuevo ciclo de deterioro del mercado laboral argentino.</p>
          <p style='text-align: justify;'><span style='font-weight: 400;'>En este nuevo contexto, el sector de la EP comenz&oacute; a registrar un incremento, no s&oacute;lo en t&eacute;rminos absolutos, sino tambi&eacute;n relativos con respecto al total de ocupados y la PEA. De hecho, tal como puede observarse en el gr&aacute;fico 2, a partir de 2016 se aceler&oacute; la tasa de crecimiento de trabajadoras y trabajadores de la EP. Este efecto pareciera indicar que ante los ciclos recesivos, la EP absorbe a parte de lxs trabajadorxs que pierden su puesto de trabajo, fundamentalmente del sector informal.&nbsp;</span></p>
            <p style='text-align: justify;'><span style='font-weight: 400;'>Al observar la evoluci&oacute;n del sector durante casi las &uacute;ltimas dos d&eacute;cadas se puede afirmar que se trata de un fen&oacute;meno estructural, que no necesariamente sigue las tendencias del resto del mercado laboral cuando &eacute;ste se recompone, pero s&iacute; supone una fuente de subsistencia para muchas personas que son excluidas del sector formal.</span></p>
              <p style='text-align: justify;'><br style='font-weight: 400;' /><br style='font-weight: 400;' /></p>"),width = 12)
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
           ),mainPanel(HTML("<h3 style='text-align: center;'><strong>Recuadro Gr&aacute;fico 1: Breve an&aacute;lisis de los datos por OCEPP</strong></h3>
  <p style='text-align: justify;'><span style='font-weight: 400;'>En este apartado presentamos las tasas de pobreza e indigencia de lxs trabajadorxs de la EP y del resto de los ocupadxs (esto es, los que no forman parte de la Econom&iacute;a Popular) . Esta comparaci&oacute;n resulta adecuada dado que la EP es un conjunto que se define a partir de una condici&oacute;n de ocupaci&oacute;n efectiva.&nbsp;</span></p>
    <p style='text-align: justify;'><span style='font-weight: 400;'>La primera cuesti&oacute;n a remarcar es la mayor incidencia de la pobreza y la indigencia en las personas que forman parte de la EP, aun teniendo en cuenta que se trata de personas ocupadas, como ya mencionamos. Adem&aacute;s de esta diferencia en los niveles, las variaciones son mucho m&aacute;s elevadas para dicho sector, lo que da cuenta de la variabilidad en el nivel de ingreso que suele caracterizar a estos empleos. Si se focaliza en la tasa de pobreza de ambos sectores, vemos una clara vinculaci&oacute;n con el ciclo econ&oacute;mico nacional, pudiendo identificar un primer momento -desde el II-2016 hasta el III-2017- con reducciones de relevancia tanto para lxs ocupadxs de la EP como para los que est&aacute;n por fuera (-10pp y -5pp, respectivamente). Esta ca&iacute;da, sostenida durante varios trimestres, no volver&aacute; a verse en el resto de la serie. En rigor, desde all&iacute; hasta fines de 2020 los porcentajes para ambos grupos crecen marcadamente, con algunos pocos trimestre de reducci&oacute;n, lo que coloca al sector EP con un 44,7% en el IV-2020 y a lxs ocupadxs no EP en 28,9% -en este caso, valor m&aacute;ximo de la serie-. De esta manera, el primer grupo crece alrededor de 8,8pp respecto del comienzo de la serie mientras que el segundo lo hace en 9,6pp. Referido a quienes se encuentran en la EP, el pico m&aacute;s elevado de incidencia de la pobreza se da durante la pandemia, con una tasa del 52,2%. De igual forma, como fue se&ntilde;alado en el apartado anterior, este n&uacute;mero debe ser tomado con cautela, ya que importantes segmentos &ldquo;pasaron&rdquo; a la inactividad durante la vigencia del aislamiento, lo que sin duda impact&oacute; en sus ingresos totales pero, dada la delimitaci&oacute;n de la EP -personas efectivamente ocupadas-, no est&aacute;n consideradas en el gr&aacute;fico.</span></p>
      <p style='text-align: justify;'><span style='font-weight: 400;'>Si ponemos el foco en la indigencia, veremos que la trayectoria de lxs ocupadxs en la EP es m&aacute;s err&aacute;tica, con modificaciones de un trimestre al otro en pr&aacute;cticamente todos los per&iacute;odos desde II-2016 hasta II-2018, si bien en los &uacute;ltimos trimestres se consolida una tendencia a la baja que deja la tasa en 4,5%, la menor de toda la serie para este grupo y 1,5pp por debajo de la inicial. En ese pasaje del segundo trimestre al tercero del 2018 evidenciamos la suba m&aacute;s pronunciada, ya que en esos tres meses la tasa crece 3pp y si bien se reducir&aacute; los trimestres siguientes, nunca perforar&aacute; el piso de 6,4% alcanzado en III-2019. De all&iacute; en m&aacute;s, con oscilaciones, la tendencia es a la suba, finalizando el 2020 en 9,5%, 3,5pp por encima de los valores iniciales en 2016. Para lxs ocupadxs por fuera de la EP, adem&aacute;s de exhibir niveles marcadamente inferiores, la tendencia es algo menos err&aacute;tica: una primera etapa hasta IV-2017 de marcada baja (de 2,5% a 1,5%) y de all&iacute; en m&aacute;s sostenido crecimiento, con s&oacute;lo tres trimestres de reducci&oacute;n. De esta manera, para IV-2020 la tasa se ubica en 3,8%, 1,3pp por encima del nivel del II-2020.</span></p>
        <h3 style='text-align: center;'><br style='font-weight: 400;' /><br style='font-weight: 400;' /><br /></h3>"),width = 6),
  mainPanel(HTML("<h3 style='text-align: center;'><strong>Recuadro Gr&aacute;fico 2: Breve an&aacute;lisis de los datos por OCEPP</strong></h3>
  <p style='text-align: justify;'><span style='font-weight: 400;'>Un aspecto de suma relevancia para la caracterizaci&oacute;n del sector lo constituye la composici&oacute;n de los ingresos. A esta cuesti&oacute;n se suma el hecho de que, desde algunos sectores, existen prejuicios respecto de que la Econom&iacute;a Popular sobrevive a partir de las transferencias del Estado.</span></p>
    <p style='text-align: justify;'><span style='font-weight: 400;'>Teniendo en cuenta los datos de la EPH, entre los a&ntilde;os 2016 y 2022 se puede observar que los ingresos provenientes de la actividad laboral representan la mayor parte de lo percibido por lxs trabajadorxs de la EP. En el a&ntilde;o 2022 el 87% del total del ingreso individual de lxs trabajadorxs de la EP corresponde a fuentes laborales. En lo que refiere a los ingresos no laborales, el rubro mayoritario lo constituye &ldquo;jubilaciones y pensiones&rdquo; (7% del total del ingreso individual). S&oacute;lo el 3% del ingreso se explica por &ldquo;Ayuda Social&rdquo;.&nbsp;</span></p>
  <p style='text-align: justify;'><span style='font-weight: 400;'>En cuanto a las brechas existentes entre los varones y mujeres al interior de la EP, la primera cuesti&oacute;n evidente refiere a que los ingresos de los primeros son ampliamente superiores. En efecto, el ingreso laboral de las mujeres es s&oacute;lo un 63% del ingreso de los varones. En paralelo, los ingresos no laborales de las mujeres son 85% superiores a los de los varones, lo que resulta consistente con la titularidad femenina de diversos tipos de transferencias.</span></p>
    <h3 style='text-align: center;'><br /><br style='font-weight: 400;' /><br /></h3>"),width = 6)
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
