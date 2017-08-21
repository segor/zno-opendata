EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolSubjScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolSubjScores]
AS
SELECT 
	A.[EOHash]
	,[Examinees]
	,[UkrAvg]
	,[UkrMed]
	,[UkrN]
	,[HistAvg]
	,[HistMed]
	,[HistN]
	,[MathAvg]
	,[MathMed]
	,[MathN]
	,[PhysAvg]
	,[PhysMed]
	,[PhysN]
	,[ChemAvg]
	,[ChemMed]
	,[ChemN]
	,[BioAvg]
	,[BioMed]
	,[BioN]
	,[GeoAvg]
	,[GeoMed]
	,[GeoN]
	,[EngAvg]
	,[EngMed]
	,[EngN]
	,[FrAvg]
	,[FrMed]
	,[FrN]
	,[DeuAvg]
	,[DeuMed]
	,[DeuN]
	,[SpAvg]
	,[SpMed]
	,[SpN]
	,[RusAvg]
	,[RusMed]
	,[RusN]
FROM
	(SELECT EOHash
	, COUNT(DISTINCT OutID) As Examinees
	, AVG(Ukr) AS UkrAvg
	, COUNT(Ukr) AS UkrN
	, AVG(Hist) AS HistAvg
	, COUNT(Hist) AS HistN
	, AVG(Math) AS MathAvg
	, COUNT(Math) AS MathN
	, AVG(Phys) AS PhysAvg
	, COUNT(Phys) AS PhysN
	, AVG(Chem) AS ChemAvg
	, COUNT(Chem) AS ChemN
	, AVG(Bio) AS BioAvg
	, COUNT(Bio) AS BioN
	, AVG(Geo) AS GeoAvg
	, COUNT(Geo) AS GeoN
	, AVG(Eng) AS EngAvg
	, COUNT(Eng) AS EngN
	, AVG(Fr) AS FrAvg
	, COUNT(Fr) AS FrN
	, AVG(Deu) AS DeuAvg
	, COUNT(Deu) AS DeuN
	, AVG(Sp) AS SpAvg
	, COUNT(Sp) AS SpN
	, AVG(Rus) AS RusAvg
	, COUNT(Rus) AS RusN
	FROM            [zno$(ZnoYear)].PersonScores
	GROUP BY EOHash) AS A
INNER JOIN 
	(SELECT DISTINCT EOHash
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Ukr) OVER (PARTITION BY EOHash) AS UkrMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Hist) OVER (PARTITION BY EOHash) AS HistMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Math) OVER (PARTITION BY EOHash) AS MathMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Phys) OVER (PARTITION BY EOHash) AS PhysMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Chem) OVER (PARTITION BY EOHash) AS ChemMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Bio) OVER (PARTITION BY EOHash) AS BioMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Geo) OVER (PARTITION BY EOHash) AS GeoMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Eng) OVER (PARTITION BY EOHash) AS EngMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Fr) OVER (PARTITION BY EOHash) AS FrMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Deu) OVER (PARTITION BY EOHash) AS DeuMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Sp) OVER (PARTITION BY EOHash) AS SpMed
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Rus) OVER (PARTITION BY EOHash) AS RusMed
	FROM            [zno$(ZnoYear)].PersonScores) AS M
ON A.EOHash = M.EOHash

