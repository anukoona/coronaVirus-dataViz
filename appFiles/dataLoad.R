coronavirus = read.csv("data/coronavirus1.csv", stringsAsFactors = F) [,-1]
population = read.csv("data/population.csv",stringsAsFactors = F)[,-1]

coronavirus = coronavirus %>% 
                  dplyr::mutate(country = dplyr::if_else(countryName == "United States", "United States of America", countryName)) %>% 
              select(-countryName)


names(coronavirus) = c("date","countryCode","region","lat","lon",
                       "Confirmed","Recovered","Deaths","countryName")
#### Old data
# 
# df1 <- read.csv(file = "https://raw.githubusercontent.com/RamiKrispin/coronavirus-csv/master/coronavirus_dataset.csv", stringsAsFactors = F)
# #
# write.csv(df1,"data/coronavirus.csv")



#### New data
# 
# df1 <- read.csv(file = "https://raw.githubusercontent.com/ulklc/covid19-timeseries/master/countryReport/raw/rawReport.csv", stringsAsFactors = F)
# #
# write.csv(df1,"data/coronavirus1.csv")

hideAllBut = function(divList, butNdx) {
  library("shinyjs")
  divList[-butNdx] %>% sapply(function(x) {shinyjs::hide(x)})
  shinyjs::show(divList[butNdx])
}

#### Population load from wordometer ----

# library(XML)
# library(RCurl)
# library(rlist)
# theurl <- getURL("https://www.worldometers.info/world-population/population-by-country/" )
# tables <- readHTMLTable(theurl)
# tables <- list.clean(tables, fun = is.null, recursive = FALSE)
# data = tables$example2 %>%
#   select('Country (or dependency)',"Population (2020)") %>%
#   as.data.frame() %>%
#   write.csv(.,"data/population.csv")