-- input variables: ZnoYear

DROP TABLE IF EXISTS [isuo$(ZnoYear)].Schools;

SELECT 
	$(ZnoYear) AS [ZnoYear]
	, dbo.get_eo_hash([Повна назва], TRIM((SELECT VALUE FROM STRING_SPLIT([Поштова адреса], N',') ORDER BY (SELECT NULL) OFFSET 1 ROWS FETCH NEXT 1 ROWS ONLY ))) AS [EOHash]
	, *
  INTO [isuo$(ZnoYear)].Schools
  FROM [isuo$(ZnoYear)].[Data_csv] 
  WHERE [Повна назва] NOT LIKE N'%призупинен%' AND [Повна назва] NOT LIKE N'%не працює%';