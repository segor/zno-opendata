CREATE VIEW [dbo].[Schools_Merged] AS 
  SELECT S.* FROM  [dbo].[Schools] S
  INNER JOIN 
	  (SELECT DISTINCT [ZnoYear] 
		  ,[EOHash_Merge]
      
	  FROM 
	  (SELECT [ZnoYear]     
		  ,[EOHash_Merge]     
				 ,row_number() over(partition by [EOHash_Merge] order by [ZnoYear] desc) as rn
		  FROM [dbo].[Schools]) as T
		where rn = 1  ) Q
   ON Q.[ZnoYear] = S.[ZnoYear] AND Q.[EOHash_Merge] = S.[EOHash_Merge]
