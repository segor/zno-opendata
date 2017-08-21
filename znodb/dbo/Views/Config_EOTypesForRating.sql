-- school types that will receciive rating number

CREATE VIEW [dbo].[Config_EOTypesForRating] AS
SELECT N'середня загальноосвітня школа' AS [EOTypeName]
UNION 
SELECT N'навчально-виховний комплекс' AS [EOTypeName]
UNION 
SELECT N'навчально-виховне об''єднання' AS [EOTypeName]
UNION 
SELECT N'гімназія' AS [EOTypeName]
UNION 
SELECT N'спеціалізована школа' AS [EOTypeName]
UNION 
SELECT N'ліцей' AS [EOTypeName]
UNION 
SELECT N'середня загальноосвітня школа-інтернат' AS [EOTypeName]
UNION 
SELECT N'спеціалізована школа-інтернат' AS [EOTypeName]
UNION 
SELECT N'колегіум' AS [EOTypeName]


