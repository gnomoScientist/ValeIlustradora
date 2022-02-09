library('tidyverse')
library(readxl)


archivo <- '~/valentina ilustradora/documentos administrativos/stock.xlsx'
hojas <- readxl::excel_sheets('~/valentina ilustradora/documentos administrativos/stock.xlsx')
hojas

walk(hojas[1:12], function(hoj){ # hoj <- hojas[1]
   
  read_xlsx(archivo, sheet = hoj) %>% 
    saveRDS(sprintf('stock/%s.rds',hoj))
    
})

categorias_stock <- list.files('stock')
