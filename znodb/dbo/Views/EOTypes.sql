
CREATE VIEW [dbo].[EOTypes] AS
SELECT  EOTypeName, count(*) AS N
  FROM [dbo].Data_Parsed  
  WHERE EOTypeName IS NOT NULL
  group by EOTypeName
