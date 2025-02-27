USE [DoctorWho]
GO
/****** Object:  StoredProcedure [dbo].[spEpisodes]    Script Date: 1/31/2016 1:31:09 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- create procedure to list out all episodes
ALTER PROC [dbo].[spEpisodes]
AS

SELECT 
	SeriesNumber,
	EpisodeNumber,
	Title,
	a.AuthorName,
	d.DoctorName,
	dbo.fnCompanions(e.EpisodeId) AS Companions,
	dbo.fnEnemies(e.EpisodeId) AS Enemies
FROM
	tblEpisode AS e
	INNER JOIN tblAuthor AS a ON a.AuthorId = e.AuthorId
	INNER JOIN tblDoctor AS d on e.DoctorId = d.DoctorId
ORDER BY
	EpisodeDate
