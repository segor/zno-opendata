
CREATE VIEW [dbo].[Scores] AS
 SELECT 
	ZnoYear
	,[OutID]
	,SexTypeName
	,Age	
    ,[EOHash]      
	,[Subj],
	[Score],
	CAST (CASE WHEN [Score] < 100.0 THEN 1 ELSE 0 END AS bit) AS IsFailed
FROM 
   (SELECT *   FROM [dbo].[PersonScores]) p
	UNPIVOT
	   ([Score] FOR [Subj] IN 
		  ([Ukr]
		  ,[Hist]
		  ,[Math]
		  ,[Phys]
		  ,[Chem]
		  ,[Bio]
		  ,[Geo]
		  ,[Eng]
		  ,[Fr]
		  ,[Deu]
		  ,[Sp]
		  ,[Rus])
	)AS unpvt;



