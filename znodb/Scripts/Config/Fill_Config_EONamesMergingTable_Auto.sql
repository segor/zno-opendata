/*

INSERT INTO dbo.[Schools_Composite] ( EOHashInitial, [EOHashAlternative])
SELECT EOHash, EOHash
	FROM   [zno$(PrevZnoYear)].Schools
EXCEPT
SELECT EOHashInitial, [EOHashAlternative]
FROM  dbo.[Schools_Composite]


INSERT INTO Config_EONamesMergingTable ( [EOHash], EOHashPrevYear, [Year])
SELECT C.[EOHash]      
	  ,Q.EOHash 
	  ,'$(ZnoYear)' 
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

*/
/*
INSERT INTO Config_EONamesMergedTable ( [EOHash], EOHashInitial)
SELECT EOHash, EOHashPrevYear
FROM   Config_EONamesMergingTable
WHERE [Year] = '$(ZnoYear)'

INSERT INTO Config_EONamesMergedTable ( [EOHash], EOHashInitial)
SELECT Merging.EOHash, Merged.EOHashInitial
FROM   Config_EONamesMergingTable AS Merging 
INNER JOIN Config_EONamesMergedTable AS Merged ON Merging.EOHashPrevYear = Merged.EOHash
WHERE Merging.Year = '$(ZnoYear)' AND Merging.EOHash <> Merged.EOHashInitial
*/
/*
INSERT INTO dbo.[Schools_Composite] ( EOHashInitial, [EOHashAlternative])
SELECT DISTINCT EOHashInitial, [EOHash]
FROM Config_EONamesMergedTable
EXCEPT
SELECT EOHashInitial, [EOHashAlternative]
FROM  dbo.[Schools_Composite]

*/




