library(readr)
library(dplyr)
library(tidyr)
library(readxl)

data <- read_csv("/home/coral/daily_SPEC_2014.csv.bz2") 

data %>%
  filter(`Parameter Name` == "Bromine PM2.5 LC", `State Name` == "Wisconsin") %>%
  select(`Arithmetic Mean`) %>%
  summarize(amm = mean(`Arithmetic Mean`)) %>%
  View()

data %>% 
  filter(`Parameter Name` %in% c("Sodium PM2.5 LC", "EC2 PM2.5 LC", "OC CSN Unadjusted PM2.5 LC TOT",
                                 "Sulfur PM2.5 LC")) %>% 
  group_by(`Parameter Name`) %>% 
  summarize(amm = mean(`Arithmetic Mean`, na.rm = TRUE)) %>% 
  arrange(desc(amm)) %>% 
  View()

data %>% 
  filter(`Parameter Name` == "Sulfate PM2.5 LC") %>% 
  group_by(`State Code`, `County Code`, `Site Num`) %>% 
  summarize(amm = mean(`Arithmetic Mean`, na.rm = TRUE)) %>% 
  arrange(desc(amm)) %>% 
  View()

data %>% 
  filter(`Parameter Name` == "EC PM2.5 LC TOR", `State Name` %in% c("California", "Arizona") ) %>%
  group_by(`State Name`) %>% 
  summarize(amm = mean(`Arithmetic Mean`, na.rm = TRUE)) %>% 
  View()

data %>% 
  filter(`Parameter Name` == "OC PM2.5 LC TOR", `Longitude` < -100 ) %>% 
  summarize(amm = median(`Arithmetic Mean`, na.rm = TRUE)) %>% 
  View()

