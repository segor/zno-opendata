-- Add area name to name of duplicated school names. Duplicated schools are schools that have the same name and are located in the same region.
-- It will hepl later to identify schools from different ZNO years.

PRINT N'ZNO-$(ZnoYear): Resolving duplicated school names...'
GO
WITH schools ([EOName] ,[EORegName],[EOAreaName]) 
AS (
	SELECT DISTINCT [EOName] ,[EORegName],[EOAreaName]
	FROM [dbo].[Data_Parsed] 
	WHERE ZnoYear = $(ZnoYear) AND EOName IS NOT NULL
)
,
duplicatedSchools ([EOName] ,[EORegName]) 
AS (
	SELECT [EOName], EORegName FROM 
		(SELECT  [EOName], EORegName, count (*) N
				FROM schools
				GROUP BY [EOName], EORegName) q
				WHERE  N >1
)
UPDATE DP 
SET DP.EOName = DP.[EOName] + ', ' + Replace(DP.EOAreaName, N'район', N'р-н')
FROM [dbo].[Data_Parsed] DP
INNER JOIN (
	SELECT	schools.[EOName], schools.[EORegName], [EOAreaName]
	FROM schools
	INNER JOIN
	duplicatedSchools
	ON duplicatedSchools.EOName=schools.EOName and duplicatedSchools.EORegName=schools.EORegName
) Q
ON Q.EOName = DP.EOName AND Q.[EORegName] = DP.[EORegName] AND Q.[EOAreaName] = DP.[EOAreaName]
WHERE ZnoYear = $(ZnoYear)

GO