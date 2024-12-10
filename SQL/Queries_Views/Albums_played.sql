/*
Date: 12/04/2024
Description: How many times has each album been listened to over the nine years of streaming, and what are the albums that have been played the most?
*/ 

SELECT 
	artist, 
	album, 
	count(album) AS album_played
	
FROM
	"streaming history"

GROUP BY
	album

ORDER BY
	album_played DESC




	

