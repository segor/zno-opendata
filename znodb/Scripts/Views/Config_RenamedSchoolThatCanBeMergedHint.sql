EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Config_RenamedSchoolThatCanBeMergedHint]')
GO

CREATE VIEW [zno$(ZnoYear)].[Config_RenamedSchoolThatCanBeMergedHint] AS 
SELECT TOP 100000
	 C.*
	 ,Q.EOHash EOHash_Prev
	 ,Q.EOName EOName_Prev
	 ,Q.EOName_Source EOName_Source_Prev
	 ,Q.EOName + N' / ' +Q.EOAreaFullName + ( CASE WHEN  CHARINDEX(Q.EOTerName, Q.EOAreaFullName) > 0 THEN '' ELSE (N', ' +Q.EOTerName) END) AS [EONameWithAddres_Prev] 
  FROM [zno$(ZnoYear)].[Config_RenamedSchoolThatShouldBeMergedTo] C
  inner join 
	(SELECT S.* 
	FROM [zno$(PrevZnoYear)].[Schools] S
	inner join 
		(SELECT COUNT ([EOHash]) N      
			  ,[EORegName]
			  ,[EOAreaName]
			  ,[EOTerName]
      
		  FROM [zno$(PrevZnoYear)].[Schools]
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