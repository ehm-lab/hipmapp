#' about UI Function
#'
#' @description A shiny Module.
#'
#' @param id,input,output,session Internal parameters for {shiny}.
#'
#' @noRd 
#'
#' @importFrom shiny NS tagList 
# Revised UI Function
mod_about_ui <- function(id) {
  ns <- NS(id)
  
  fluidRow(
    column(3, offset = 1,
           # Sidebar for navigation
           uiOutput(ns("sidebar_links"))
    ),
    column(7, div(style = "margin-top:-10px",
                  # Content area for displaying the selected section
                  uiOutput(ns("about_content"))
    ))
  )
}
    
#' about Server Functions
#'
#' @noRd 
mod_about_server <- function(id) {
  moduleServer(id, function(input, output, session) {
    # Reactive value to track the current section
    current_section <- reactiveVal("projections")
    
    # Dynamically generate sidebar links
    output$sidebar_links <- renderUI({
      navlistPanel(
        id = session$ns("about_nav"),
        tabPanel("Coverage", value = "coverage"),
        tabPanel("Methodology", value = "methodology"),
        tabPanel("Glossary", value = "glossary"),
        tabPanel("", value="separator"),
        tabPanel("App", value = "app"),
        tabPanel("Usage tips/Demo", value = "demo"),
        tabPanel("Source", value="source"),
        tabPanel("Feedback", value = "survey")
        
      )
    })
    
    # Update current section based on link click
    observe({
      section <- input$about_nav
      if (!is.null(section)) {
        current_section(section)
      }
    })
    
    # Render content based on current section
    output$about_content <- renderUI({
      switch(current_section(),
             "coverage" = p(align = "center", wellPanel(htmltools::includeMarkdown(system.file("app/www/coverage.md", package = "hipmapp")))),
             "methodology" = p(align = "center", wellPanel(htmltools::includeMarkdown(system.file("app/www/methodology.md", package = "hipmapp")))),
             "glossary" = p(align = "center", wellPanel(htmltools::includeMarkdown(system.file("app/www/glossary.md", package = "hipmapp")))),
             "app" = p(align = "center", wellPanel(htmltools::includeMarkdown(system.file("app/www/app.md", package = "hipmapp")))),
             "demo" = p(align = "center", wellPanel(htmltools::includeMarkdown(system.file("app/www/demo.md", package = "hipmapp")))),
             "source"= p(align = "center", wellPanel(htmltools::includeMarkdown(system.file("app/www/source.md", package = "hipmapp")))),
             #"separator"=p(align = "center", wellPanel(htmltools::includeMarkdown("inst/app/www/separator.md"))),
             "survey" = p(align="center", wellPanel(
               tags$head(
                 tags$style(HTML("
          .responsive-iframe-container {
            position: relative;
            padding-bottom: 80%;
            padding-top: 25px;
            height: 0;
          }
          .responsive-iframe-container iframe {
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
          }
        "))),div(class = "responsive-iframe-container",
                 HTML("<iframe src='https://docs.google.com/forms/d/e/1FAIpQLSdOkp6Q1ytxJSVjZrqQFlC4zYSFMX0GzZLshTl0tgt01E6TGA/viewform?embedded=true' frameborder='0' marginheight='0' marginwidth='0'>Loading...</iframe>")
               )
             ))
             
      )
    })
  })
}
    
## To be copied in the UI
# mod_about_ui("about_1")
    
## To be copied in the server
# mod_about_server("about_1")
