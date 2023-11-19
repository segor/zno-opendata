-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Config_RenamedSchoolThatCanBeMergedHint]')
GO

CREATE VIEW [zno$(ZnoYear)].[Config_RenamedSchoolThatCanBeMergedHint] AS 
WITH PrevZnoYearSchools AS (
	SELECT *
	FROM [dbo].[Schools] 
	WHERE ZnoYear = ($(ZnoYear) - 1)
)
SELECT TOP 100000
	 C.*
	 ,Q.EOHash EOHash_Prev
	 ,Q.EOName EOName_Prev
	 ,Q.EOName_Source EOName_Source_Prev
	 ,Q.EOName + N' / ' +Q.EOAreaFullName + ( CASE WHEN  CHARINDEX(Q.EOTerName, Q.EOAreaFullName) > 0 THEN '' ELSE (N', ' +Q.EOTerName) END) AS [EONameWithAddres_Prev] 
  FROM [zno$(ZnoYear)].[Config_RenamedSchoolThatShouldBeMergedTo] C
  inner join 
	(SELECT S.* 
	FROM PrevZnoYearSchools S
	inner join 
		(SELECT COUNT ([EOHash]) N      
			  ,[EORegName]
			  ,[EOAreaName]
			  ,[EOTerName]
      
		  FROM PrevZnoYearSchools
		  group by
			   [EORegName]
			  ,[EOAreaName]
			  ,[EOTerName]
		 having COUNT ([EOHash]) =1
		 INTERSECT
		 SELECT COUNT ([EOHash]) N      
			  ,[EORegName]
			  ,[EOAreaName]
			  ,[EOTerName]
      
		  FROM [zno$(ZnoYear)].[Schools]
		  group by
			   [EORegName]
			  ,[EOAreaName]
			  ,[EOTerName]
		 having COUNT ([EOHash]) =1) Q ON Q.[EORegName]= S.EORegName AND Q.[EOAreaName]= S.[EOAreaName] AND Q.[EOTerName]= S.[EOTerName]
	 ) Q ON Q.[EORegName]= C.EORegName AND Q.[EOAreaName]= C.[EOAreaName] AND Q.[EOTerName]= C.[EOTerName]