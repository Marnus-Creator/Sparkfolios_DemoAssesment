/****** Object:  StoredProcedure [dbo].[up_GetAllPerson]    Script Date: 2023/07/10 21:06:53 ******/
DROP PROCEDURE [dbo].[up_GetAllPerson]
GO

/****** Object:  StoredProcedure [dbo].[up_GetAllPerson]    Script Date: 2023/07/10 21:06:53 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE Procedure [dbo].[up_GetAllPerson]
AS
BEGIN
	SELECT firstName AS [First Name],lastName AS [Last Name], dteDOB AS [Date of Birth], txtEmailAddress AS [Email Address], id AS [EntryId] 
	from Person
END
GO


