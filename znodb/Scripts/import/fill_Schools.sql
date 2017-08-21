PRINT N'ZNO-$(ZnoYear): Retreiving list of schools...'
GO

TRUNCATE TABLE [zno$(ZnoYear)].[Schools]
GO

INSERT INTO [zno$(ZnoYear)].[Schools] 
WITH(TABLOCK)  
SELECT 
	  dbo.get_eo_hash(EOName, EORegName) AS EOHash   
      ,dbo.clean_EOName(EOName) AS EOName
	  ,CASE 
			WHEN (EOTypeName = N'спеціальна загальноосвітня школа' AND EOName LIKE N'%спеціалізован%') THEN N'спеціалізована школа'
			WHEN (EOTypeName = N'спеціальна загальноосвітня школа-інтернат' AND EOName LIKE N'%спеціалізован%') THEN N'спеціалізована школа-інтернат'
			WHEN (EOTypeName = N'спеціалізована школа' AND EOName LIKE N'%спеціальн%') THEN N'спеціальна загальноосвітня школа'
			WHEN (EOTypeName = N'спеціалізована школа-інтернат' AND EOName LIKE N'%спеціальн%') THEN N'спеціальна загальноосвітня школа-інтернат'
			WHEN (EOTypeName = N'професійний ліцей відповідного профілю' AND EOName LIKE N'%ліцей%') THEN N'ліцей'
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
		, CONVERT(bit, CASE WHEN EOName LIKE N'%Приватн%' OR EOName LIKE N'ТОВ %' OR EOName LIKE N'%Товариство з обмеженою відповід%' THEN 1 ELSE 0 END) AS IsPrivate
		,EOName AS EOName_Source
  FROM  (
	 SELECT DISTINCT   
			[EOName]
		  ,[EOTypeName]
		  ,[EORegName]
		  ,[EOAreaName]
		  ,[EOTerName] 
	  FROM [dbo].[Data_Parsed]
	  WHERE ZnoYear = $(ZnoYear) AND EOName IS NOT NULL
  ) Q

GO
