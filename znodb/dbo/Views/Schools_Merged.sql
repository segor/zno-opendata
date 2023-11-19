CREATE VIEW [dbo].[Schools_Merged] AS 
WITH LATEST_YEARS AS (
SELECT MAX ([ZnoYear]) AS [LatestZnoYear] 
      ,[EOHash_Merge]
      
  FROM [dbo].[Schools] 
  GROUP BY [EOHash_Merge]
)
SELECT [ZnoYear]
      ,[EOHash]
      ,S.[EOHash_Merge]
      ,[EOName]
      ,[EOTypeName]
      ,[EORegName]
      ,[EOAreaName]
      ,[EOTerName]
      ,[TerType]
      ,[EOAreaFullName]
      ,[IsPrivate]
      ,[EOName_Source]
  FROM [dbo].[Schools] AS S
  INNER JOIN LATEST_YEARS ON S.ZnoYear = LATEST_YEARS.LatestZnoYear AND S.EOHash_Merge = LATEST_YEARS.EOHash_Merge
