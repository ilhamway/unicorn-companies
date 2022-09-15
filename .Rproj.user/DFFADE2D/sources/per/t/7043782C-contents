library(shiny)
library(shinydashboard)

# load library
library(tidyverse)
library(scales)
library(glue)
library(plotly)
library(lubridate)

# Read data
companies <- read.csv("data_input/Unicorn_Companies.csv", stringsAsFactors = T)

# Cleansing data
companies_clean <- companies %>%
  mutate(
    # mengubah tipe data
    Valuation...B. = as.numeric(Valuation...B.),
    Date.Joined = mdy(Date.Joined),
    
  )