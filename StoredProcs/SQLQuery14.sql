USE [Library]
GO
/****** Object:  StoredProcedure [dbo].[AddBook]    Script Date: 1/31/2016 1:35:01 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROC [dbo].[AddBook](
@Title nvarchar(max),
@Author nvarchar(max),
@Genre nvarchar(max),
@ISBN int,
@Summary nvarchar(max)
)
AS

BEGIN

DECLARE @genreID as int
DECLARE @authorID as int

IF EXISTS 
(
SELECT [ID]
FROM Authors
WHERE Author = @Author 
)
BEGIN

SET @authorID = 
(
SELECT [ID]
FROM Authors
WHERE Author = @Author
)

END

ELSE
BEGIN

INSERT INTO [Authors]
VALUES (@Author)

SET @authorID = SCOPE_IDENTITY()

END

IF EXISTS 
(
SELECT [ID]
FROM Genre
WHERE Genre = @Genre 
)
BEGIN

SET @genreID = 
(
SELECT [ID]
FROM Genre
WHERE Genre = @Genre
)

END

ELSE
BEGIN

INSERT INTO [Genre]
VALUES (@Genre)

SET @genreID = SCOPE_IDENTITY()

END

INSERT INTO [Books] (Author, Genre, Summary, ISBN, Title)
VALUES(@authorID, @genreID, @Summary, @ISBN, @Title)

END