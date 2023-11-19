-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Schools]')
GO

CREATE VIEW [zno$(ZnoYear)].[Schools] AS 
SELECT * FROM [dbo].[Schools]
WHERE ZnoYear = '$(ZnoYear)'

GO