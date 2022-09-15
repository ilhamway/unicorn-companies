dashboardPage(
  
  skin = "blue",
  
  # ------ HEADER
  dashboardHeader(
    title = "Unicorn Companies"
  ),
  
  
  # ------ SIDEBAR
  dashboardSidebar(
    
    sidebarMenu(
      menuItem("Overview", tabName = "page1", icon = icon("building")),
      menuItem("Company Analysis", tabName = "page2", icon = icon("magnifying-glass-chart")),
      menuItem("Dataset", tabName = "page3", icon = icon("server"))
    )
  ),
  
  
  # ------ BODY
  dashboardBody(
    
      tabItems(
          tabItem(tabName = "page1",
                  #ROW1
                  fluidRow(
                    valueBox(width = 12,
                             value = ("Did you know?"),
                             subtitle = "Unicorn companies are those that reach a valuation of $1 billion without being listed on the stock market and are the dream of any tech startup",
                             icon = icon("circle-info"),
                             color = "blue")
                  ),
                  #ROW2
                  fluidRow(
                    valueBox(width = 6,
                             value =  length(unique(companies_clean$Country)),
                             subtitle = "Total Countries",
                             color = "blue",
                             icon = icon("earth-asia")),
                    valueBox(width = 6,
                             value = length(unique(companies_clean$Industry)),
                             subtitle = "Total Industries",
                             color = "blue",
                             icon = icon("industry")),
                  ),
                  #ROW3
                  fluidRow(
                    box(width = 6,
                        plotlyOutput(outputId = "plot1_category")),
                    box(width = 6,
                        plotlyOutput(outputId = "plot3_industry"))
                  ),
                  fluidRow(
                    box("Data Souce : https://www.kaggle.com/datasets/deepcontractor/unicorn-companies-dataset",
                      width = 12)
                  )
            
          ),
          tabItem(tabName = "page2",
                  
                  #ROW1
                  fluidRow(
                    valueBox(width = 4,
                            color = "blue",
                            subtitle = "Total Companies",
                            icon = icon("building"),
                            value = length(unique(companies_clean$Company))),
                    valueBox(width = 4,
                            color = "blue",
                            subtitle = "Biggest Valuation in Billion USD",
                            icon = icon("sack-dollar"),
                            value = max(companies_clean$Valuation...B.)),
                    valueBox(width = 4,
                            color = "blue",
                            subtitle = "Company with Biggest Valuation",
                            icon = icon("house-laptop"),
                            value = companies_clean$Company[companies_clean$Valuation...B.== max(companies_clean$Valuation...B.)])
                  ),
                  
                  ## --- ROW 2: PLOT 2
                  fluidRow(
                    box(width = 9,
                        plotlyOutput(outputId = "plot2_channel")),
                    box(width = 3,
                        background = "blue",
                        selectInput(inputId = "input_country",
                                    label = "Choose Country",
                                    selected = "Indonesia",
                                    choices = unique(companies_clean$Country)),
                        sliderInput(inputId = "top_n",
                                    label = "Choose Top N Companies",
                                    min = 1, max = 20, value=5),
                    )
                  ),
                  ## --- ROW 2: PLOT 1
                  fluidRow(
                    box(width = 12,
                        plotlyOutput(outputId = "plot4_founded_year"))
                  )
                  ),
          tabItem(tabName = "page3",
                  fluidRow(
                    box(width = 12,
                        title = "Data Unicorn Companies 2022",
                        DT::dataTableOutput(outputId = "dataset_table"))
                  )
          )
      )
  )
)