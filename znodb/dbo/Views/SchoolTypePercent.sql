CREATE VIEW [dbo].[SchoolTypePercent] AS 
SELECT TOP 10000000   
    Q1.ZnoYear, EOTypeName, 100.0 * Q2.L / Q1.T AS Rate
FROM            (SELECT        ZnoYear, COUNT(EOHash) AS T
                          FROM            Schools
                          GROUP BY ZnoYear) AS Q1 INNER JOIN
                             (SELECT        ZnoYear, EOTypeName, COUNT(EOHash) AS L
                               FROM            Schools
                               --WHERE        (EOTypeName = N'середня загальноосвітня школа')
                               GROUP BY ZnoYear, EOTypeName) AS Q2 ON Q1.ZnoYear = Q2.ZnoYear
where 100.0 * Q2.L / Q1.T >= 1
order by  Q1.ZnoYear, EOTypeName