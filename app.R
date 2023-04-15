library(shiny)
library(tidyquant)
library(plotly)
library(dplyr)
library(shinythemes)

# Define available companies
all_companies <- c("AAPL", "AMZN", "GOOGL", "MSFT", "NFLX", "TSLA", "NVDA")

# Define UI
ui <- fluidPage(
  theme = shinytheme("cerulean"),
  titlePanel("Technology Stocks Dashboard"),
  sidebarLayout(
    sidebarPanel(
      selectInput("company", "Select the Companies", choices = all_companies, multiple = TRUE),
      dateRangeInput("date_range", "Select Date Range",
                     start = "2010-01-01", end = Sys.Date(),
                     min = "2010-01-01", max = Sys.Date(),
                     format = "yyyy-mm-dd")
    ),
    mainPanel(
      tabsetPanel(
        tabPanel("Closing Price", plotlyOutput("closing_plot")),
        tabPanel("Volume", plotlyOutput("volume_plot"))
      )
    )
  )
)

# Define server logic
server <- function(input, output) {
  
  # Filter data based on user input
  filtered_data <- reactive({
    if (is.null(input$company))
      return(NULL)
    tq_get(input$company, get = "stock.prices",
           from = input$date_range[1],
           to = input$date_range[2]) %>%
      group_by(symbol)
  })
  
  # Create closing price plot
  output$closing_plot <- renderPlotly({
    if (is.null(input$company))
      return(NULL)
    plot_ly(filtered_data(), x = ~date, y = ~close, color = ~symbol) %>%
      add_lines() %>%
      layout(title = "Closing Price",
             xaxis = list(title = "Date"),
             yaxis = list(title = "Price ($)")) %>%
      config(displayModeBar = TRUE, responsive = TRUE)
  })
  
  # Create volume plot
  output$volume_plot <- renderPlotly({
    if (is.null(input$company))
      return(NULL)
    plot_ly(filtered_data(), x = ~date, y = ~volume, color = ~symbol) %>%
      add_lines() %>%
      layout(title = "Volume",
             xaxis = list(title = "Date"),
             yaxis = list(title = "Volume")) %>%
      config(displayModeBar = TRUE, responsive = TRUE)
  })
  
}

# Run the application
shinyApp(ui = ui, server = server)
