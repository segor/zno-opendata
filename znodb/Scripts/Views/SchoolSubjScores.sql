-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolSubjScores]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolSubjScores]
AS
SELECT 
	A.[EOHash]
	,[Examinees]
	,[UmlAvg]
	,[UmlStDev]
	,[UmlMed]
	,[UmlN]
	,[UkrAvg]
	,[UkrStDev]
	,[UkrMed]
	,[UkrN]
	,[HistAvg]
	,[HistStDev]
	,[HistMed]
	,[HistN]
	,[MathAvg]
	,[MathStDev]
	,[MathMed]
	,[MathN]
	,[PhysAvg]
	,[PhysStDev]
	,[PhysMed]
	,[PhysN]
	,[ChemAvg]
	,[ChemStDev]
	,[ChemMed]
	,[ChemN]
	,[BioAvg]
	,[BioStDev]
	,[BioMed]
	,[BioN]
	,[GeoAvg]
	,[GeoStDev]
	,[GeoMed]
	,[GeoN]
	,[EngAvg]
	,[EngStDev]
	,[EngMed]
	,[EngN]
	,[FrAvg]
	,[FrStDev]
	,[FrMed]
	,[FrN]
	,[DeuAvg]
	,[DeuStDev]
	,[DeuMed]
	,[DeuN]
	,[SpAvg]
	,[SpStDev]
	,[SpMed]
	,[SpN]
	,[RusAvg]
	,[RusStDev]
	,[RusMed]
	,[RusN]
FROM
	(SELECT EOHash
	, COUNT(DISTINCT OutID) As Examinees
	, AVG(Uml) AS UmlAvg
	, STDEV(Uml) AS UmlStDev
	, COUNT(Uml) AS UmlN
	, AVG(Ukr) AS UkrAvg
	, STDEV(Ukr) AS UkrStDev
	, COUNT(Ukr) AS UkrN
	, AVG(Hist) AS HistAvg
	, STDEV(Hist) AS HistStDev
	, COUNT(Hist) AS HistN
	, AVG(Math) AS MathAvg
	, STDEV(Math) AS MathStDev
	, COUNT(Math) AS MathN
	, AVG(Phys) AS PhysAvg
	, STDEV(Phys) AS PhysStDev
	, COUNT(Phys) AS PhysN
	, AVG(Chem) AS ChemAvg
	, STDEV(Chem) AS ChemStDev
	, COUNT(Chem) AS ChemN
	, AVG(Bio) AS BioAvg
	, STDEV(Bio) AS BioStDev
	, COUNT(Bio) AS BioN
	, AVG(Geo) AS GeoAvg
	, STDEV(Geo) AS GeoStDev
	, COUNT(Geo) AS GeoN
	, AVG(Eng) AS EngAvg
	, STDEV(Eng) AS EngStDev
	, COUNT(Eng) AS EngN
	, AVG(Fr) AS FrAvg
	, STDEV(Fr) AS FrStDev
	, COUNT(Fr) AS FrN
	, AVG(Deu) AS DeuAvg
	, STDEV(Deu) AS DeuStDev
	, COUNT(Deu) AS DeuN
	, AVG(Sp) AS SpAvg
	, STDEV(Sp) AS SpStDev
	, COUNT(Sp) AS SpN
	, AVG(Rus) AS RusAvg
	, STDEV(Rus) AS RusStDev
	, COUNT(Rus) AS RusN
	FROM            [zno$(ZnoYear)].PersonScores
	GROUP BY EOHash) AS A
INNER JOIN 
	(SELECT DISTINCT EOHash
		, PERCENTILE_CONT(0.5) WITHIN GROUP (ORDER BY Uml) OVER (PARTITION BY EOHash) AS UmlMed
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

