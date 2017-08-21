EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[PersonScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[PersonScores]
	AS 
	SELECT 
		[OutID], [SexTypeName], [Age], [EOHash], 
		[Ukr], [Hist], [Math], [Phys], [Chem], [Bio], [Geo], [Eng], [Fr], [Deu], [Sp], [Rus] 
	FROM [dbo].[PersonScores]
	WHERE ZnoYear = $(ZnoYear)
