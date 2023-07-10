/****** Object: StoredProcedure [dbo].[up_DeletePerson] Script Date: 2023/07/10 09:00:00 ******/
DROP PROCEDURE IF EXISTS [dbo].[up_DeletePerson]
GO

/****** Object: StoredProcedure [dbo].[up_DeletePerson] Script Date: 2023/07/10 09:00:00 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[up_DeletePerson]
    @personId INT
AS
BEGIN
    DELETE FROM Person
    WHERE id = @personId;
END
GO
