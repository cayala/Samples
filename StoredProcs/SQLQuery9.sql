USE [DoctorWho]
GO
/****** Object:  StoredProcedure [dbo].[spSummariseEpisodes]    Script Date: 1/31/2016 1:27:43 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*Create a procedure called spSummariseEpisodes to show:

the 3 most frequently-appearing companions; then separately
the 3 most frequently-appearing enemies.*/

ALTER proc [dbo].[spSummariseEpisodes]
as

SELECT top 3
      COUNT(c.CompanionName) as compNum,
	  c.CompanionName
  FROM [DoctorWho].[dbo].[tblEpisodeCompanion] comp
  join tblCompanion c on comp.CompanionId = c.CompanionId
  join tblEpisode ep on comp.EpisodeId = ep.EpisodeId
  group by c.CompanionName
  order by compNum desc

SELECT top 3
Count(EnemyName) as number,
e.EnemyName
  FROM [DoctorWho].[dbo].[tblEnemy] e
  join tblEpisodeEnemy en on e.EnemyId = en.EnemyId
  Group by e.EnemyName
  order by number desc