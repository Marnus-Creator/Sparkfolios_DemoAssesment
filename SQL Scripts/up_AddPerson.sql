/****** Object:  StoredProcedure [dbo].[up_AddPerson]    Script Date: 2023/07/10 21:54:20 ******/
DROP PROCEDURE [dbo].[up_AddPerson]
GO

/****** Object:  StoredProcedure [dbo].[up_AddPerson]    Script Date: 2023/07/10 21:54:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER PROCEDURE [dbo].[up_AddPerson]
	@firstname VARCHAR(255),
	@lastname VARCHAR(255),
	@dteDOB DATE,
	@txtEmailAddress VARCHAR(150)  -- Increase the size to match the column size
AS
BEGIN
	INSERT INTO Person (firstname, lastName, dteDOB, txtEmailAddress)
	VALUES (@firstname, @lastname, @dteDOB, @txtEmailAddress)
END
GO


