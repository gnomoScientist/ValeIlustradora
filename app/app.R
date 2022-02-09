#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(DT)
library(shiny)
source('carga_stock.R')

ui = fluidPage(
  selectInput('stock', 'Stock', choices = categorias_stock),
  tableOutput("data")
)

server = function(input, output, session) {

  output$data <- renderTable({
    readRDS(sprintf('stock/%s',input$stock)) %>% 
      mutate_if(is.numeric, as.integer)
  })
}


# Run the application 
shinyApp(ui = ui, server = server)
