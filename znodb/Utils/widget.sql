SELECT 
		ROW_NUMBER() OVER (ORDER BY [EORegName]
		  ,[EOAreaName]
		  ,[EOTerName]
		  ,[EOName]
		  ,[EOHash_Merge]) AS ID	 
      ,[EOName]
      ,[EOTypeName]
      ,[EORegName]
      ,[EOAreaName]
      ,[EOTerName]
      ,[TerType]      
      ,[IsPrivate]
  FROM [dbo].[Schools_Merged];
  


WITH IDs AS (
SELECT 
		ROW_NUMBER() OVER (ORDER BY [EORegName]
		  ,[EOAreaName]
		  ,[EOTerName]
		  ,[EOName]
		  ,[EOHash_Merge]) AS ID
	 ,[EOHash_Merge]
  FROM [dbo].[Schools_Merged]
  )
SELECT
	 ID
	, [ZnoYear]
	, CompositeRank
	, TotalRank
	, cast(ROUND(AvgScore, 2) AS float) AvgScore
	, IT_CompositeRank
	, IT_Rank
	, cast(ROUND(IT_AvgScore, 2) AS float) IT_AvgScore
	, Examinees
	, cast(ROUND(PassRate, 4) AS float) PassRate
	, MathRank
	, PhysRank
	, EngRank
	, cast(ROUND(MathAvg, 2) AS float) MathAvg
	, cast(ROUND(PhysAvg, 2) AS float) PhysAvg
	, cast(ROUND(EngAvg, 2) AS float) EngAvg
  FROM [dbo].[SchoolRating_Composite_3Y] R
  INNER JOIN IDs ON IDs.EOHash_Merge=R.EOHash_Merge
  ORDER BY ID, ZnoYear DESC;
