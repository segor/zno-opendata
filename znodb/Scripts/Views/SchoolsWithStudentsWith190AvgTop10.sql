EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolsWithStudentsWith190AvgTop10]')
GO

CREATE VIEW [zno$(ZnoYear)].[SchoolsWithStudentsWith190AvgTop10] AS
SELECT TOP (10) 
	COUNT(DISTINCT V.OutID) AS StudentsN
	,Schools.EOName
FROM  [zno$(ZnoYear)].PersonScoresWithAvg AS V 
	INNER JOIN [zno$(ZnoYear)].Schools ON V.EOHash = Schools.EOHash
WHERE (V.Exams >= 3) AND (V.AvgScore >= 190)
GROUP BY Schools.EOHash, Schools.EOName
ORDER BY StudentsN DESC
