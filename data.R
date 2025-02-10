# Foreign aid per capita, 2023
# Source: Our World in Data
# URL: https://ourworldindata.org/grapher/foreign-aid-given-per-capita

library(tidyverse) ; library(httr) ; library(jsonlite)

# define the URL and query parameters
url <- "https://ourworldindata.org/grapher/foreign-aid-given-per-capita.csv"
query_params <- list(
  v = "1",
  csvType = "full",
  useColumnShortNames = "true",
  tab = "chart"
)

# get data
headers <- add_headers(`User-Agent` = "Our World In Data data fetch/1.0")
response <- GET(url, query = query_params, headers)
raw <- read_csv(content(response, as = "text", encoding = "UTF-8")) |> 
  select(country = Entity, year = Year, oda = i_oda_net_disbursements_per_capita)
