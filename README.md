# DV-Lab-Assignment-9

## Technology Stocks Dashboard 
This is a Shiny app that allows users to visualize the stock prices and trading volumes of popular technology companies. Users can select one or more companies, as well as a date range, and the app will display the corresponding stock prices and volumes in interactive plots.
To use this app, you need to have the following packages installed in R:
- shiny
- tidyquant
- plotly
- dplyr
- shinythemes
These packages can be installed by running the following command:

`install.packages(c("shiny", "tidyquant", "plotly", "dplyr", "shinythemes"))`

Once the packages have been installed, the app starts by running the following commands in R:

`library(shiny)` and then `runApp("app.R")`.

After running the code above, the following dashboard can be seen:

<img width="770" alt="Screenshot 2023-04-16 at 12 30 27" src="https://user-images.githubusercontent.com/84466567/232278834-736605ac-9d7d-4a02-a9d5-f25b65a6a698.png">

## How to Use

1. Select one or more companies from the dropdown menu on the left sidebar.
2. Select a date range by clicking and dragging on the calendar on the left sidebar.
3. The Closing Price tab will display a plot of the selected companies' closing prices over time.
4. The Volume tab will display a plot of the selected companies' trading volumes over time.

## Demo 

https://user-images.githubusercontent.com/84466567/232279871-b88dc6f9-8867-4139-9498-909e80e0f920.mov

