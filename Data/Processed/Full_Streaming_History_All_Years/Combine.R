# Combining Listing History CSVs into a single table 

library(readr)
df_15 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_15.csv")
df_15['year'] <- c(2015)

df_16 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_16.csv")
df_16['year'] <- c(2016)

df_17 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_17.csv")
df_17['year'] <- c(2017)

df_18 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_18.csv")
df_18['year'] <- c(2018)

df_19 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_19.csv")
df_19['year'] <- c(2019)

df_20 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_20.csv")
df_20['year'] <- c(2020)

df_21 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_21.csv")
df_21['year'] <- c(2021)

df_22 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_22.csv")
df_22['year'] <- c(2022)

df_23 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/final_23.csv")
df_23['year'] <- c(2023)

#---------------------------------------------------------------------------------------------------

library(dplyr)

#row bind two data frames together
df_total <- bind_rows(df_15, df_16, df_17, df_18, df_19, df_20, df_21, df_22, df_23)

#view new data frame
df_total

write_csv(df_total, "/Users/mishy/Desktop/df_final.csv")

#----------------------------------------------------------------------------------------------------


library(readr)
a_15 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2015.csv")
a_15['Year Streamed'] <- c(2015)

a_16 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2016.csv")
a_16['Year Streamed'] <- c(2016)

a_17 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2017.csv")
a_17['Year Streamed'] <- c(2017)

a_18 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2018.csv")
a_18['Year Streamed'] <- c(2018)

a_19 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2019.csv")
a_19['Year Streamed'] <- c(2019)

a_20 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2020.csv")
a_20['Year Streamed'] <- c(2020)

a_21 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2021.csv")
a_21['Year Streamed'] <- c(2021)

a_22 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2022.csv")
a_22['Year Streamed'] <- c(2022)

a_23 <- read_csv("/Users/mishy/Desktop/Spotify_Wrapped_Project-main/data/processed/listening_history_csv/2023.csv")
a_23['Year Streamed'] <- c(2023)



library(dplyr)

#row bind two data frames together
a_total <- bind_rows(a_15, a_16, a_17, a_18, a_19, a_20, a_21, a_22, a_23)

#view new data frame
a_total

write_csv(a_total, "/Users/mishy/Desktop/a_total.csv")
