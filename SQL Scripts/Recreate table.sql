/****** Object: StoredProcedure [dbo].[up_AddPerson] Script Date: 2023/07/09 21:32:09 ******/
DROP PROCEDURE IF EXISTS [dbo].[up_AddPerson]
GO

/****** Object: StoredProcedure [dbo].[up_AddPerson] Script Date: 2023/07/09 21:32:09 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_AddPerson]
	@firstname VARCHAR(50),
	@lastname VARCHAR(50),
	@dteDOB DATE,
	@txtEmailAddress VARCHAR(15)  -- Increase the size to match the column size
AS
BEGIN
	INSERT INTO Person (firstname, lastName, dteDOB, txtEmailAddress)
	VALUES (@firstname, @lastname, @dteDOB, @txtEmailAddress)
END
GO

--EXEC up_AddPerson @firstname = 'Marnus', @lastname = 'Steenkamp', @dteDOB = '1996/11/25', @txtEmailAddress = 'MarnussteenkampIR@gmail.com'

EXEC up_GetAllPerson

