PRINT N'ZNO-$(ZnoYear): Calculating exam scores...'
GO

INSERT INTO [dbo].[PersonScores] 
 WITH(TABLOCK)  
SELECT  
	ZnoYear
	, OutID
	, SexTypeName
	, $(ZnoYear) - Birth AS Age
	, dbo.get_eo_hash(EOName, EORegName) AS EOHash
	, dbo.get_score(UkrTestStatus, UkrBall100, UkrBall12) AS Ukr
	, dbo.get_score(HistTestStatus, HistBall100, HistBall12) AS Hist
	, dbo.get_score(MathTestStatus, MathBall100, MathBall12) AS Math
	, dbo.get_score(PhysTestStatus, PhysBall100, PhysBall12) AS Phys
	, dbo.get_score(ChemTestStatus, ChemBall100, ChemBall12) AS Chem
	, dbo.get_score(BioTestStatus, BioBall100, BioBall12) AS Bio
	, dbo.get_score(GeoTestStatus, GeoBall100, GeoBall12) AS Geo
	, dbo.get_score(EngTestStatus, EngBall100, EngBall12) AS Eng
	, dbo.get_score(FrTestStatus, FrBall100, FrBall12) AS Fr
	, dbo.get_score(DeuTestStatus, DeuBall100, DeuBall12) AS Deu
	, dbo.get_score(SpTestStatus, SpBall100, SpBall12) AS Sp
	, dbo.get_score(RusTestStatus, RusBall100, RusBall12) AS Rus
FROM            [dbo].Data_Parsed
WHERE	
		ZnoYear = $(ZnoYear) AND
		EXISTS(
			(SELECT UkrTestStatus AS TestStatus UNION 
			SELECT HistTestStatus AS TestStatus UNION 
			SELECT MathTestStatus AS TestStatus UNION 
			SELECT PhysTestStatus  AS TestStatus UNION 
			SELECT ChemTestStatus  AS TestStatus UNION 
			SELECT BioTestStatus  AS TestStatus UNION 
			SELECT GeoTestStatus  AS TestStatus UNION 
			SELECT EngTestStatus  AS TestStatus UNION 
			SELECT FrTestStatus   AS TestStatus UNION 
			SELECT DeuTestStatus  AS TestStatus UNION 
			SELECT SpTestStatus   AS TestStatus UNION 
			SELECT RusTestStatus) 
			INTERSECT 
			(SELECT TestStatus FROM [dbo].[Config_ValidExamStatuses] ) 
		)
		AND RegTypeName = N'Випускник загальноосвітнього навчального закладу $(ZnoYear) року'

GO
