IF NOT EXISTS (
  SELECT *   FROM   sys.columns   WHERE  object_id = OBJECT_ID(N'[dbo].[Person]') AND name = 'dteDOB'
)
BEGIN
	ALTER TABLE Person
    ADD [dteDOB] DATETIME
END

IF NOT EXISTS (
  SELECT *   FROM   sys.columns   WHERE  object_id = OBJECT_ID(N'[dbo].[Person]') AND name = 'txtEmailAddress'
)
BEGIN 
	ALTER TABLE Person
    ADD [txtEmailAddress] VARCHAR(150)
END