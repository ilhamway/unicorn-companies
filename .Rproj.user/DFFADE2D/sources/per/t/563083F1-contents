shinyServer(function(input,output){
  
  ##---PLOT 1
  output$plot1_category <- renderPlotly({
    
    companies_count <- companies_clean %>% 
      group_by(Country) %>% 
      summarise(count= n()) %>% 
      ungroup() %>% 
      arrange(-count) %>%
      head(10)
    
    companies_count2 <- companies_count %>% 
      mutate(
        label = glue(
          "Country: {Country}
                    Companies count: {count}"
        )
      )

    plot1 <- ggplot(data = companies_count2, aes(x = count, 
                                            y = reorder(Country, count),# reorder(A, berdasarkan B)
                                            text = label)) + # untuk informasi tooltip
      geom_col(aes(fill = count)) +
      scale_fill_gradient(low = "#9AD0EC", high = "#1572A1") +
      labs(title = "Top 10 Countries with Unicorn Startup",
           x = "Companies Count",
           y = NULL) +
      theme_minimal() +
      theme(legend.position = "none") 
    
    ggplotly(plot1, tooltip = "text")
    
  })
  
  ## ---- PLOT 2
  output$plot2_channel <- renderPlotly({
    
    companies_top <- companies_clean %>% 
      filter(Country == input$input_country) %>% 
      arrange(-Valuation...B.) %>%
      head(input$top_n)
    
    companies_top <- companies_top %>% 
      mutate(
        label = glue(
          "Company: {Company}
           Valuation: $ {Valuation...B.}B
           Industry: {Industry}
           City: {City}"
        ) 
      )
    
    plot2 <- ggplot(companies_top, aes(x = reorder(Company, Valuation...B.), 
                                         y = Valuation...B.,
                                         text = label)) +
      geom_segment(aes(x=reorder(Company, Valuation...B.), xend=reorder(Company, Valuation...B.), y=0,yend=Valuation...B.), color="#9AD0EC") +
      geom_point(color="#1572A1") +
      coord_flip() +
      labs(title = glue("Top {input$top_n} Unicorn Startup in {input$input_country}"),
           x = NULL,
           y = "Valuation in Billion USD") +
      scale_y_continuous(labels = comma) +
      theme_minimal()
    

    ggplotly(plot2, tooltip = "text")
    
  })
  
  ##---PLOT 3
  output$plot3_industry <- renderPlotly({
    
    industry_count <- companies_clean %>% 
      group_by(Industry) %>% 
      summarise(count= n()) %>% 
      ungroup() %>% 
      arrange(-count) %>%
      head(10)
    
    industry_count2 <- industry_count %>% 
      mutate(
        label = glue(
          "Industry: {Industry}
                    Companies count: {count}"
        )
      )
    
    plot3 <- ggplot(data = industry_count2, aes(x = count, 
                                                 y = reorder(Industry, count),# reorder(A, berdasarkan B)
                                                 text = label)) + # untuk informasi tooltip
      geom_col(aes(fill = count)) +
      scale_fill_gradient(low="#9AD0EC", high="#1572A1") +
      labs(title = "Top 10 Types of Industries",
           x = "Companies Count",
           y = NULL) +
      theme_minimal() +
      theme(legend.position = "none")
    
    ggplotly(plot3, tooltip = "text")
  
  })
  
  ##---PLOT 4
  output$plot4_founded_year <- renderPlotly({
    
    year_count <- companies_clean %>% 
      filter(Founded.Year != "None") %>% 
      group_by(Founded.Year) %>% 
      summarise(count= n()) %>% 
      ungroup()
    
    year_count2 <- year_count %>% 
      mutate(
        label = glue(
          "Year: {Founded.Year}
                    Companies count: {count}"
        )
      )
    
    plot3 <- ggplot(data = year_count2, aes(x = count, 
                                                y = Founded.Year,# reorder(A, berdasarkan B)
                                                text = label)) + # untuk informasi tooltip
      geom_col(aes(fill = count)) +
      scale_fill_gradient(low="#1572A1", high="#1572A1") +
      labs(title = "Number of unicorn companies found per year",
           x = "Companies Count",
           y = NULL) +
      theme_minimal() +
      theme(legend.position = "none", axis.text.x = element_text(angle = 90, vjust = 0.5, hjust=1)) +
      coord_flip() 
    
    ggplotly(plot3, tooltip = "text")
    
  })
  
  ##DATASET
  output$dataset_table <- DT::renderDataTable(companies_clean,
                                              options = list(scrollX=T,
                                                             scrollY=T))
  
})