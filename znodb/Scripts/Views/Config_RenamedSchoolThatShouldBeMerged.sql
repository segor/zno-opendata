EXEC ('DROP VIEW IF EXISTS [dbo].[Config_RenamedSchoolThatShouldBeMerged]')
GO

CREATE VIEW [dbo].[Config_RenamedSchoolThatShouldBeMerged] AS 
SELECT 
	   S.[EOHash]
      ,[EOName]
      ,[EORegName]
      ,[EOAreaName]
      ,[EOTerName]
	  ,S.[EOName_Source]
	FROM [zno$(ZnoYear)].[Schools] S INNER JOIN (
	  SELECT [EOHash]
	  FROM [zno$(ZnoYear)].[Schools]
	  EXCEPT
	  SELECT [EOHash]
	  FROM [zno$(PrevZnoYear)].[Schools]
	  EXCEPT
	  SELECT [EOHash]
	  FROM [dbo].[Config_EONamesMergingTable]
	) Q
	ON Q.EOHash = S.EOHash

	GO