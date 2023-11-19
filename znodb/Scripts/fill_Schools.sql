-- input variables: ZnoYear

PRINT N'ZNO-$(ZnoYear): Retreiving list of schools...'
GO


INSERT INTO [dbo].[Schools] 
WITH(TABLOCK)  
SELECT 
      '$(ZnoYear)' AS ZnoYear
	  ,dbo.get_eo_hash(EOName_Adjusted, EORegName) AS EOHash 
	  ,dbo.get_eo_hash(EOName_Adjusted, EORegName) AS [EOHash_Merge]
      ,dbo.clean_EOName(EOName_Adjusted) AS EOName
	  ,CASE 
			WHEN (EOTypeName = N'спеціальна загальноосвітня школа' AND EOName_Adjusted LIKE N'%спеціалізован%') THEN N'спеціалізована школа'
			WHEN (EOTypeName = N'спеціальна загальноосвітня школа-інтернат' AND EOName_Adjusted LIKE N'%спеціалізован%') THEN N'спеціалізована школа-інтернат'
			WHEN (EOTypeName = N'спеціалізована школа' AND EOName_Adjusted LIKE N'%спеціальн%') THEN N'спеціальна загальноосвітня школа'
			WHEN (EOTypeName = N'спеціалізована школа-інтернат' AND EOName_Adjusted LIKE N'%спеціальн%') THEN N'спеціальна загальноосвітня школа-інтернат'
			WHEN (EOTypeName = N'професійний ліцей відповідного профілю' AND EOName_Adjusted LIKE N'%ліцей%') THEN N'ліцей'
			ELSE EOTypeName
	   END AS [EOTypeName]
      ,[EORegName]
      ,[EOAreaName]
      ,[EOTerName]      
	  , (CASE WHEN EOAreaName LIKE N'%м.Київ%' THEN N' столица' WHEN EOTerName LIKE N'%район міста%' THEN N'обл. центр' 
			WHEN EOTerName LIKE N'%м.%' THEN N'райцентр' WHEN EOTerName IS NULL THEN NULL ELSE N'село' END) AS TerType
	  , REPLACE(REPLACE(REPLACE(
		 EORegName + N', ' +  (
			CASE WHEN EOAreaName LIKE N'%м.Київ%' THEN EOTerName 
			WHEN EOAreaName LIKE N'%район міста%' THEN EOAreaName 
			WHEN EOTerName LIKE N'%район міста%' THEN EOAreaName + N', ' + EOTerName
			WHEN EOTerName LIKE N'%м.%'THEN EOTerName
			ELSE EOAreaName END)
		 , N'область', N'об.'), N'район міста', N'р.м.'), N'район', N'р.')
		 AS EOAreaFullName	
		, CONVERT(bit, CASE WHEN EOName_Adjusted LIKE N'%Приватн%' OR EOName_Adjusted LIKE N'ТОВ %' OR EOName_Adjusted LIKE N'%Товариство з обмеженою відповід%' THEN 1 ELSE 0 END) AS IsPrivate
		,EOName AS EOName_Source
  FROM  (
	 SELECT DISTINCT   
			[EOName]
		  ,[EOName_Adjusted]
		  ,[EOTypeName]
		  ,[EORegName]
		  ,[EOAreaName]
		  ,[EOTerName] 
	  FROM [dbo].[Data_Parsed]
	  WHERE ZnoYear = '$(ZnoYear)' AND EOName_Adjusted IS NOT NULL 
		AND ( RegTypeName = N'Випускник загальноосвітнього навчального закладу $(ZnoYear) року'
			  OR  RegTypeName = N'Випускник закладу загальної середньої освіти $(ZnoYear) року')
  ) Q

GO

PRINT N'ZNO-$(ZnoYear): Merging renamed schools using the names matching table...';

WITH ConfigMerging (EOHash, [EOHash_Merge]) AS (
	SELECT EOHash,  [EOHashPrevYear] AS [EOHash_Merge]  
	FROM  [dbo].[Config_EONamesMergingTable] C
	WHERE  [Year] = $(ZnoYear) 
		AND EXISTS 
			(SELECT EOHash FROM  [dbo].[Schools] AS S
			WHERE  ZnoYear < $(ZnoYear) AND S.EOHash = C.[EOHashPrevYear] )
)
UPDATE  S
SET S.[EOHash_Merge] = ConfigMerging.[EOHash_Merge]
FROM [dbo].[Schools] AS S
INNER JOIN ConfigMerging ON S.[EOHash_Merge] = ConfigMerging.[EOHash]
WHERE  ZnoYear = $(ZnoYear)

GO

PRINT N'ZNO-$(ZnoYear): Merging schools that were renamed many times...';

WITH PrevMerged (EOHash, [EOHash_Merge]) AS (
	SELECT DISTINCT EOHash,  [EOHash_Merge] FROM  [dbo].[Schools] 
	WHERE  ZnoYear < $(ZnoYear) AND [EOHash_Merge] <> EOHash 
)
UPDATE  S
SET S.[EOHash_Merge] = PrevMerged.[EOHash_Merge]
FROM [dbo].[Schools] AS S
INNER JOIN PrevMerged ON S.[EOHash_Merge] = PrevMerged.[EOHash]
WHERE  ZnoYear = $(ZnoYear)

GO


/*
WITH NewHashes([EOHash_Merge]) AS (
	SELECT [EOHash_Merge] FROM  [dbo].[Schools] 
	WHERE  ZnoYear = $(ZnoYear)
	EXCEPT 
	SELECT DISTINCT [EOHash_Merge] FROM  [dbo].[Schools] 
	WHERE  ZnoYear < $(ZnoYear)
)
WITH PrevMerged (ZnoYear, EOHash, [EOHash_Merge]) AS (
	SELECT ZnoYear, EOHash,  [EOHash_Merge] FROM  [dbo].[Schools] 
	WHERE  ZnoYear < $(ZnoYear) AND S.EOHash_Merge] <> S.EOHash 
)
SELECT CurrS.*, ISNULL( (SELECT TOP 1 [EOHash_Merge] FROM  PrevMerged
				WHERE EOHash = CurrS.[EOHash_Merge]
				ORDER BY ZnoYear),  CurrS.[EOHash_Merge])
(SELECT * FROM  [dbo].[Schools] S
WHERE  ZnoYear = $(ZnoYear) ) AS CurrS
INNER JOIN NewHashes ON S.[EOHash_Merge] = NewHashes.[EOHash_Merge]

*/



