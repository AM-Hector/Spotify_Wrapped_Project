# SPOTIFY LIKED SONGS ANALYSIS AND MACHINE LEARNING MODELS

# Primary Objective: Analyze spotify liked songs, explore variables and correlations
# in data create a machine learning model that predicts a binary metric
# (like or not like) try to apply this model to new songs.

# Secondary/Exploratory Objectives:
# expand on algorithm to predict liking albums
# create other features to describe enjoyment from album (5-star rating)
# explore spotify listening history data and create models

# ----------------------------------------------------------------------------------

# ------------------------IMPORTING AND CLEANING DATA ------------------------------

# Importing JSON file - spotify listening history stored as json file 

library(jsonlite)
history_23 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2023_9.json", flatten=TRUE)
history_22 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2022_8.json", flatten=TRUE)
history_21 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2021_7.json", flatten=TRUE)
history_20 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2020_6.json", flatten=TRUE)
history_19 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2019_5.json", flatten=TRUE)
history_18 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2018_3.json", flatten=TRUE)
history_17 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2017_2.json", flatten=TRUE)
history_16 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2016_1.json", flatten=TRUE)
history_15 <- fromJSON("/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/raw/2015_0.json", flatten=TRUE)


# Handling missing data: -------------------------------------------------------

library(visdat) # package to help visualize missing data 
vis_miss(history_15)
history_nomiss <- na.omit(history_15) # removes entire rows with missing values 
vis_miss(history_nomiss)  

# ------------------------------------------------------------------------------
# DATA WRANGLING

# Writing a function doesn't seem to work, I guess I got to do this the hard way
library(plyr)
# 2015 -------------------------------------------------------------------------

y15 <-subset(history_15, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y15 <- plyr::rename(y15, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y15 <- na.omit(y15)
df_15 <- unique(y15[c('track', 'artist', 'album')])
freq_15 <- data.frame(table(y15$track))
freq_15<-
    plyr::rename(freq_15, c("Var1" = "track", "Freq" = "times_played"))
final_15 <- merge(data.frame(df_15, row.names=NULL), data.frame(freq_15, row.names=NULL), 
                   by = "track", all = TRUE)
final_15 

# 2016 --------------------------------------------------------------------------

y16 <-subset(history_16, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y16 <- plyr::rename(y16, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y16 <- na.omit(y16)
df_16 <- unique(y16[c('track', 'artist', 'album')])
freq_16 <- data.frame(table(y16$track))
freq_16<-
  plyr::rename(freq_16, c("Var1" = "track", "Freq" = "times_played"))
final_16 <- merge(data.frame(df_16, row.names=NULL), data.frame(freq_16, row.names=NULL), 
                  by = "track", all = TRUE)
final_16 

# 2017 ----------------------------------------------------------------------------

y17 <-subset(history_17, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y17 <- plyr::rename(y17, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y17 <- na.omit(y17)
df_17 <- unique(y17[c('track', 'artist', 'album')])
freq_17 <- data.frame(table(y17$track))
freq_17<-
  plyr::rename(freq_17, c("Var1" = "track", "Freq" = "times_played"))
final_17 <- merge(data.frame(df_17, row.names=NULL), data.frame(freq_17, row.names=NULL), 
                  by = "track", all = TRUE)
final_17 

# 2018 ---------------------------------------------------------------------------

y18 <-subset(history_18, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y18 <- plyr::rename(y18, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y18 <- na.omit(y18)
df_18 <- unique(y18[c('track', 'artist', 'album')])
freq_18 <- data.frame(table(y18$track))
freq_18<-
  plyr::rename(freq_18, c("Var1" = "track", "Freq" = "times_played"))
final_18 <- merge(data.frame(df_18, row.names=NULL), data.frame(freq_18, row.names=NULL), 
                  by = "track", all = TRUE)
final_18 

# 2019 --------------------------------------------------------------------------

y19 <-subset(history_19, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y19 <- plyr::rename(y19, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y19 <- na.omit(y19)
df_19 <- unique(y19[c('track', 'artist', 'album')])
freq_19 <- data.frame(table(y19$track))
freq_19<-
  plyr::rename(freq_19, c("Var1" = "track", "Freq" = "times_played"))
final_19 <- merge(data.frame(df_19, row.names=NULL), data.frame(freq_19, row.names=NULL), 
                  by = "track", all = TRUE)
final_19 

# 2020 ----------------------------------------------------------------------------

y20 <-subset(history_20, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y20 <- plyr::rename(y20, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y20 <- na.omit(y20)
df_20 <- unique(y20[c('track', 'artist', 'album')])
freq_20 <- data.frame(table(y20$track))
freq_20<-
  plyr::rename(freq_20, c("Var1" = "track", "Freq" = "times_played"))
final_20 <- merge(data.frame(df_20, row.names=NULL), data.frame(freq_20, row.names=NULL), 
                  by = "track", all = TRUE)
final_20 

# 2021 --------------------------------------------------------------------------------

y21 <-subset(history_21, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y21 <- plyr::rename(y21, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y21 <- na.omit(y21)
df_21 <- unique(y21[c('track', 'artist', 'album')])
freq_21 <- data.frame(table(y21$track))
freq_21<-
  plyr::rename(freq_21, c("Var1" = "track", "Freq" = "times_played"))
final_21 <- merge(data.frame(df_21, row.names=NULL), data.frame(freq_21, row.names=NULL), 
                  by = "track", all = TRUE)
final_21 

# 2022 -----------------------------------------------------------------------------

y22 <-subset(history_22, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y22 <- plyr::rename(y22, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y22 <- na.omit(y22)
df_22 <- unique(y22[c('track', 'artist', 'album')])
freq_22 <- data.frame(table(y22$track))
freq_22<-
  plyr::rename(freq_22, c("Var1" = "track", "Freq" = "times_played"))
final_22 <- merge(data.frame(df_22, row.names=NULL), data.frame(freq_22, row.names=NULL), 
                  by = "track", all = TRUE)
final_22 

# 2023 ----------------------------------------------------------------------------

y23 <-subset(history_23, select = -c(ts, username, platform, conn_country,
                                     ip_addr_decrypted, user_agent_decrypted, 
                                     episode_name, episode_show_name, 
                                     spotify_episode_uri, offline_timestamp, incognito_mode, skipped))
y23 <- plyr::rename(y23, c("master_metadata_album_artist_name" = "artist",
                           "master_metadata_track_name" = "track",
                           "master_metadata_album_album_name" = "album",
                           "spotify_track_uri" = "uri"))
y23 <- na.omit(y23)
df_23 <- unique(y23[c('track', 'artist', 'album')])
freq_23 <- data.frame(table(y23$track))
freq_23<-
  plyr::rename(freq_23, c("Var1" = "track", "Freq" = "times_played"))
final_23 <- merge(data.frame(df_23, row.names=NULL), data.frame(freq_23, row.names=NULL), 
                  by = "track", all = TRUE)
final_23 

# --------------------------------------------------------------------------------

# Write out final dataset files to csv 

library(data.table)
fwrite(final_15, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_15.csv")
fwrite(final_16, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_16.csv")
fwrite(final_17, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_17.csv")
fwrite(final_18, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_18.csv")
fwrite(final_19, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_19.csv")
fwrite(final_20, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_20.csv")
fwrite(final_21, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_21.csv")
fwrite(final_22, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_22.csv")
fwrite(final_23, "/home/mishy/Documents/GitHub/Spotify_Wrapped_Project/data/processed/final_23.csv")


