-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Scores]')
GO

CREATE VIEW [zno$(ZnoYear)].[Scores]
	AS 
	SELECT 
		[OutID], [SexTypeName], [Age], [EOHash], [Subj], [Score], [IsFailed] 	
	FROM [dbo].[Scores]
	WHERE ZnoYear = $(ZnoYear)
