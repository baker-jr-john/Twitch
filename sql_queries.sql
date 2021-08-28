--Examine stream table
SELECT TOP (20)
  * 
FROM 
  [dbo].[video_play] 
GO


--Examine chat table
SELECT TOP (20)
  * 
FROM 
  [dbo].[chat] 
GO


--Unique games in the stream table
SELECT 
  DISTINCT game 
FROM
  [dbo].[video_play]
GO


--Unique channels in the stream table
SELECT 
  DISTINCT channel 
FROM 
  [dbo].[video_play]
GO


--A list of the most popular games in the stream table in order of popularity from most popular to least
SELECT 
  game, 
  COUNT(game) AS 'viewers'
FROM 
  [dbo].[video_play] 
GROUP BY 
  game 
ORDER BY 
  2 DESC
GO


--Locations of League of Legends stream viewers in order of country with the most views to the least
SELECT 
  country, 
  COUNT(country) AS 'viewers'
FROM 
  [dbo].[video_play] 
WHERE 
  game = 'League of Legends' 
GROUP BY 
  country 
ORDER BY 
  2 DESC
GO


--A list of what device players are using to play and the number a streamers watching
SELECT 
  player, 
  COUNT(player) AS 'viewers'
FROM 
  [dbo].[video_play] 
GROUP BY 
  player 
ORDER BY 
  2 DESC
GO


--A list of games and their genre organized by popularity from most popular to least
SELECT 
  game, 
  CASE WHEN game = 'Dota 2' THEN 'MOBA' WHEN game = 'League of Legends' THEN 'MOBA' WHEN game = 'Heroes of the Storm' THEN 'MOBA' WHEN game = 'Counter-Strike: Global Offensive' THEN 'FPS' WHEN game = 'DayZ' THEN 'Survival' WHEN game = 'ARK: Survival Evolved' THEN 'Survival' ELSE 'Other' END AS 'genre', 
  COUNT(game) AS 'viewers'
FROM 
  [dbo].[video_play] 
GROUP BY 
  game 
ORDER BY 
  3 DESC
GO


--Examining the time column from the stream table
SELECT TOP (10)
  time 
FROM 
  [dbo].[video_play] 
GO


--Returning the seconds, SS, of the time column
SELECT TOP (20)
  time, 
  FORMAT(time, 'ss') AS 'seconds'
FROM 
  [dbo].[video_play] 
GROUP BY 
  time 
GO


--The number of streamers in the United States arranged by most popular streaming time
SELECT 
  FORMAT(time, 'HH') AS 'hour', 
  COUNT(time) AS 'viewers'
FROM 
  [dbo].[video_play] 
WHERE 
  country = 'US' 
GROUP BY 
  time  
ORDER BY 
  2 DESC
GO


--Combine the stream and chat tables
SELECT TOP (20)
  * 
FROM 
  [dbo].[video_play] video_play
  JOIN [dbo].[chat] chat ON video_play.device_id = chat.device_id 
GO