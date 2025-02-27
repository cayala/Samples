USE [DoctorWho]
GO
/****** Object:  StoredProcedure [dbo].[spMoffats]    Script Date: 1/31/2016 1:31:44 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--Using the tblAuthor and tblEpisode tables, create a stored procedure called 
--spMoffats to list out the 32 episodes written by Steven Moffat in date order (with the most recent first):

ALTER Proc [dbo].[spMoffats]

as

Select 
[EpisodeId]
      ,ep.[SeriesNumber]
      ,ep.[EpisodeNumber]
      ,ep.[EpisodeType]
      ,ep.[Title]
      ,ep.[EpisodeDate]
      ,au.AuthorName
      ,ep.[DoctorId]
      ,ep.[Notes]
From tblEpisode ep
join tblAuthor au on ep.AuthorId = au.AuthorId

where au.AuthorName = 'Steven Moffat'
order by ep.EpisodeDate desc