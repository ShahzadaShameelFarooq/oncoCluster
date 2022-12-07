# This example is adapted from
# Grolemund, G. (2015). Learn Shiny - Video Tutorials. URL:https://shiny.rstudio.com/tutorial/

library(shiny)

# Define UI
ui <- fluidPage(

  # Change title
  titlePanel("oncoCluster"),

  # Sidebar layout with input and output definitions ----
  sidebarLayout(

    # Sidebar panel for inputs ----
    sidebarPanel(

      tags$p("This is a simple Shiny App that is part of the oncoCluster in R.
             Its purpose is to illustrate the functionality of a simple
             Shiny App."),
      # br() element to introduce extra vertical spacing ----
      br(),

      tags$b("Description: oncoCluster is an R package that identifies cancer
             sub-types using DNA methylation data. It employs different
             clustering algorithms and allows users to compare the results. It
             also allows for visualisation of results through creating plots."),

      # br() element to introduce extra vertical spacing ----
      br(),
      br(),

      # input
      tags$p("Instructions: Below, enter or select values required to perform the analysis. Default
             values are shown. Then press 'Run'. Navigate through
             the different tabs to the right to explore the results."),

      # br() element to introduce extra vertical spacing ----
      br(),

      # input
      shinyalert::useShinyalert(force = TRUE),  # Set up shinyalert
      fileInput(inputId = "file1",
                label = "Select a Dna Methylation dataset.",
                accept = c(".csv")),
      fileInput(inputId = "file2",
                label = "Select a Dna Methylation significant sites dataset.",
                accept = c(".csv")),


      # br() element to introduce extra vertical spacing ----
      br(),

      # actionButton
      actionButton(inputId = "button2",
                   label = "Run"),

    ),

    # Main panel for displaying outputs ----
    mainPanel(

      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",

                  tabPanel("Results of ClusterAnalysis",
                           h3("Instructions: Enter values and click 'Run'
                              at the bottom left side."),
                           verbatimTextOutput("textOutCA")),
                  tabPanel("Results of ClusterAnalysisTwo",
                           h3("Instructions: Enter values and click 'Run'
                              at the bottom left side."),
                           verbatimTextOutput("textOutCATwo")),
                  tabPanel("Results of ClusterComparison",
                           h3("Instructions: Enter values and click 'Run'
                              at the bottom left side."),
                           verbatimTextOutput("textOutCAComparison")),
                  tabPanel("Plot of ClusterAnalysis",
                           h3("Instructions: Enter values and click 'Run'
                              at the bottom left side."),
                           br(),
                           plotOutput("clusterAnalysisPlot")),
                  tabPanel("Plot of ClusterAnalysisTwo",
                           h3("Instructions: Enter values and click 'Run'
                              at the bottom left side."),
                           br(),
                           plotOutput("clusterAnalysisTwoPlot")),
                  tabPanel("Plot of compareClusterPlot",
                           h3("Instructions: Enter values and click 'Run'
                              at the bottom left side."),
                           br(),
                           plotOutput("comparisonPlot"))
      )

    )
  )
)

# Define server logic for random distribution app ----
server <- function(input, output) {

  # Save input csv as a reactive
  matrixInputOne <- eventReactive(eventExpr = input$button2, {
    if (! is.null(input$file1))
      read.csv(input$file1$datapath)
  })

  matrixInputTwo <- eventReactive(eventExpr = input$button2, {
    if (! is.null(input$file2))
      read.csv(input$file2$datapath)
  })

  # Calculate information criteria value
  resultsOne <- eventReactive(eventExpr = input$button2, {

    oncoCluster::clusterAnalysis(dnaMethylationData = matrixInputOne(),
                                 dnaMethylationSites = matrixInputTwo())

  })

  resultsTwo <- eventReactive(eventExpr = input$button2, {

    oncoCluster::clusterAnalysisTwo(dnaMethylationData = matrixInputOne(),
                                 dnaMethylationSites = matrixInputTwo())
  })

  resultsComparison <- eventReactive(eventExpr = input$button2, {

    oncoCluster::clusterComparison(clusterAnalysisRes = resultsOne(),
                                   clusterAnalysisTwoRes = resultsTwo())
  })

  clusterPlotResultsOne <- eventReactive(eventExpr = input$button2, {

    oncoCluster::clusterPlot(dnaMethylationData = matrixInputOne(),
                             dnaMethylationSites = matrixInputTwo(),
                             clusterResults = resultsOne())
  })

  clusterPlotResultsTwo <- eventReactive(eventExpr = input$button2, {

    oncoCluster::clusterPlot(dnaMethylationData = matrixInputOne(),
                             dnaMethylationSites = matrixInputTwo(),
                             clusterResults = resultsTwo())
  })

  compareClusterPlotResults <- eventReactive(eventExpr = input$button2, {

    oncoCluster::compareClusterPlot(clusterResults = resultsOne(),
                                    clusterResultsTwo = resultsTwo())

  })


  # Text output
  output$textOutCA <- renderPrint({
    if (! is.null(resultsOne))
      resultsOne()
  })

  output$textOutCATwo <- renderPrint({
    if (! is.null(resultsTwo))
      resultsTwo()
  })

  output$textOutCAComparison <- renderPrint({
    if (! is.null(resultsComparison))
      resultsComparison()
  })

  # Plot output
  output$clusterAnalysisPlot <- renderPlot({
    if (! is.null(clusterPlotResultsOne))
      clusterPlotResultsOne()
  })

  output$clusterAnalysisTwoPlot <- renderPlot({
    if (! is.null(clusterPlotResultsTwo))
      clusterPlotResultsTwo()
  })

  output$comparisonPlot <- renderPlot({
    if (! is.null(compareClusterPlotResults))
      compareClusterPlotResults()
  })

}

# Create Shiny app ----
shiny::shinyApp(ui, server)

# [END]
