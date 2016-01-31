USE [DoctorWho]
GO
/****** Object:  StoredProcedure [dbo].[MattSmithFinder]    Script Date: 1/31/2016 1:30:28 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER Proc [dbo].[MattSmithFinder]

as

Select *
From tblEpisode as ep
join tblAuthor au on ep.AuthorId = au.AuthorId
join tblDoctor doc on ep.DoctorId = doc.DoctorId
where DoctorName = 'Matt Smith'
