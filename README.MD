# Spotify Wrapped: A journey through nine years of my Spotify streaming data. 

## Introduction 

Each year, Spotify provides a statistical overview, known as "Spotify Wrapped", of the user's most listened to songs, genres and artists. However, the "Spotify Wrapped" summary is only
available annually in December, and previous yearly summaries are not available for the user to view. Thankfully, each Spotify user can request their own listening history data, 
which includes data from every year since account creation. 
The motivation of this project is to explore nine years of music streaming data from my Spotify account and answer several questions regarding my personal taste in music.

## Data Sources 

There are two different sources of data for this project. The first source is my music streaming history data for the years 2015 - 2023, requested directly from Spotify. 
This dataset only includes categorical variables such as the artist, album, and track name as well as continuous variables to describe the duration of each track played. 
The second source is data requested from the Spotify Web API using Exportify, which includes numerous descriptive variables for each track such as dance-ability, energy etc.
Exportify is a web application that allows users to export descriptive data (from Spotify Web API) for songs in a designated playlist. 

## Challenges 

To combine both datasets, I determined the top 100 most played songs for each year using the streaming history data, then I manually created a Spotify playlist for each year and exported the descriptive data 
for each playlist using Exportify. Initially I attempted to create a playlist for each year, with all of the songs I've listed to that year (not just the top 100). I wrote a python script to access Spotify
API and add every song that I've listened to, using the track_uri tag. However, my script only managed to create empty playlists for me and I could not figure out how to add a list of tracks to said
playlists. In the end I manually added 100 songs to each playlist. In the future I would like to use all of the streaming data and perhaps fit some predictive models. 

Additionally, any data analysis examining music Genre was not as straight forward as I initially thought. Each song had multiple comma separated genres, 
therefore I only kept the first genre that was listed for each song. Also, the label of each genre was very specific (ex. "bubble-grunge"), as a result there were many categories. 
Genres such as “Garage Rock” and “Alternative Rock” could have been consolidated to one genre; Rock. 
It may be useful to designate general categories for genre in future analysis. 

## How to Request Your Own Spotify Streaming History 

Log into your Spotify account via web browser -> Go to Account -> Go to Privacy Settings -> Navigate to Extended Streaming History -> Check the box titled "Select Extended Streaming History"
You will receive your complete streaming history in roughly a month. Spotify will email the address linked to your Spotify account, and you will receive .json files and a pdf describing your data

## How to Export Playlist Data 

Descriptive data for songs in playlists can be exported using Exportify https://exportify.net/
You will be asked to log in to your Spotify account, once you log in you can select one of your playlists to export as a .csv file 

## Folder Contents 

Data - Processed Data 
Processed data includes the .csv files for my top 100 songs each year, and .csv files for the total streaming history for each year 

Data Analysis - R Markdown Script/PDF, Final Report  
The data analysis for this project was completed using R. This folder includes the final report I wrote for my Data Visualization class, which examines how my music taste has changed over time. 

Spotify_API - Python scripts and environment
Folder contains the python script I wrote to attempt to add all songs streamed for a given year. 








