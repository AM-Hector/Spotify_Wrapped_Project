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
history_23 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2023_9.json", flatten=TRUE)
history_22 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2022_8.json", flatten=TRUE)
history_21 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2021_7.json", flatten=TRUE)
history_20 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2020_6.json", flatten=TRUE)
history_19 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2019_5.json", flatten=TRUE)
history_18 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2018_3.json", flatten=TRUE)
history_17 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2017_2.json", flatten=TRUE)
history_16 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2016_1.json", flatten=TRUE)
history_15 <- fromJSON("/Users/alarahector/Desktop/Fall 2023/Music Analysis /2015_0.json", flatten=TRUE)

# Handling missing data: -------------------------------------------------------

library(visdat) # package to help visualize missing data 
vis_miss(history_rename)
history_nomiss <- na.omit(history_rename) # removes entire rows with missing values 
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

# SOME PLOTS 

library(ggplot2)


#Write a function that creates several plots, basic statistical summary of each year


#density plot 
ggplot(final_23, aes(times_played, after_stat(density))) + geom_freqpoly(binwidth = 30)

# Create a chart of quantiles by year 
quantile(final_23$times_played, probs = seq(.1, .9, by = .1))
quantile(final_22$times_played, probs = seq(.1, .9, by = .1))
quantile(final_21$times_played, probs = seq(.1, .9, by = .1))
quantile(final_20$times_played, probs = seq(.1, .9, by = .1))
quantile(final_19$times_played, probs = seq(.1, .9, by = .1))
quantile(final_18$times_played, probs = seq(.1, .9, by = .1))
quantile(final_17$times_played, probs = seq(.1, .9, by = .1))
quantile(final_16$times_played, probs = seq(.1, .9, by = .1))
quantile(final_15$times_played, probs = seq(.1, .9, by = .1))
# Subset: Songs that are in the 80th+ percentile by number of times played
songs_most_listened_23 <- subset(final_23, times_played > 5) 
songs_most_listened_22 <- subset(final_22, times_played > 7)
songs_most_listened_21 <- subset(final_21, times_played > 6)
songs_most_listened_20 <- subset(final_20, times_played > 6)
songs_most_listened_19 <- subset(final_19, times_played > 5)
songs_most_listened_18 <- subset(final_18, times_played > 5)
songs_most_listened_17 <- subset(final_17, times_played > 5)
songs_most_listened_16 <- subset(final_16, times_played > 9)
songs_most_listened_15 <- subset(final_15, times_played > 7)
# Subset: list of the albums that have songs that I've played the most 
fav_albums_23 <- unique(songs_most_listened_23[c('album', 'artist')]) #315
fav_albums_22 <- unique(songs_most_listened_22[c('album', 'artist')]) #186
fav_albums_21 <- unique(songs_most_listened_21[c('album', 'artist')]) #335
fav_albums_20 <- unique(songs_most_listened_20[c('album', 'artist')]) #365
fav_albums_19 <- unique(songs_most_listened_19[c('album', 'artist')]) #481
fav_albums_18 <- unique(songs_most_listened_18[c('album', 'artist')]) #401
fav_albums_17 <- unique(songs_most_listened_17[c('album', 'artist')]) #323
fav_albums_16 <- unique(songs_most_listened_16[c('album', 'artist')]) #316
fav_albums_15 <- unique(songs_most_listened_15[c('album', 'artist')]) #246
# write to excel

library(openxlsx)

# Comma as separator and dot as decimal separator
write.xlsx(x=fav_albums_15,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2015.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           overwrite = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_16,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2016.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_17,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2017.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_18,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2018.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_19,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2019.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_20,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2020.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_21,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2021.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_22,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2022.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)
write.xlsx(x=fav_albums_23,                    
           file = "/Users/alarahector/Desktop/Fall 2023/Music Analysis /excel/2023.xlsx",       
           sheetName = "Sheet1", 
           rowNames = FALSE, 
           colNames = TRUE,
           append = TRUE)


library(data.table)
dfsongs_15 <- data.table(unique(y15$uri))
dfsongs_16 <- data.table(unique(y16$uri))
dfsongs_17 <- data.table(unique(y17$uri))
dfsongs_18 <- data.table(unique(y18$uri))
dfsongs_19 <- data.table(unique(y19$uri))
dfsongs_20 <- data.table(unique(y20$uri))
dfsongs_21 <- data.table(unique(y21$uri))
dfsongs_22 <- data.table(unique(y22$uri))
dfsongs_23 <- data.table(unique(y23$uri))

fwrite(dfsongs_15, "/Users/alarahector/Desktop/Fall 2023/dfsongs_15.csv")
fwrite(dfsongs_16, "/Users/alarahector/Desktop/Fall 2023/dfsongs_16.csv")
fwrite(dfsongs_17, "/Users/alarahector/Desktop/Fall 2023/dfsongs_17.csv")
fwrite(dfsongs_18, "/Users/alarahector/Desktop/Fall 2023/dfsongs_18.csv")
fwrite(dfsongs_19, "/Users/alarahector/Desktop/Fall 2023/dfsongs_19.csv")
fwrite(dfsongs_20, "/Users/alarahector/Desktop/Fall 2023/dfsongs_20.csv")
fwrite(dfsongs_21, "/Users/alarahector/Desktop/Fall 2023/dfsongs_21.csv")
fwrite(dfsongs_22, "/Users/alarahector/Desktop/Fall 2023/dfsongs_22.csv")
fwrite(dfsongs_23, "/Users/alarahector/Desktop/Fall 2023/dfsongs_23.csv")

# Create a summary dataset
# How many unique albums did I listen to, by year?

# year: albums, artist, songs
# 2023: 1739, 1109, 4023
# 2022: 1112, 760, 2941
# 2021: 1904, 1278, 3802
# 2020: 2240, 1528, 3918
# 2019: 2112, 1280, 4418
# 2018: 1783, 1148, 3867
# 2017: 1579, 1029, 4439
# 2016: 1432, 895, 2886
# 2015: 1411, 915, 3096


