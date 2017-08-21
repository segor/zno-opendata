EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[SchoolsWithBestPeople]')
GO


CREATE view [zno$(ZnoYear)].[SchoolsWithBestPeople] as 
SELECT TOP 10
       Count (DISTINCT [OutID]) AS N    
      ,[Schools].EOName
	  , [Schools].EOAreaFullName     
  FROM [zno$(ZnoYear)].[StudentRaitingTop1000] SR
  INNER JOIN [zno$(ZnoYear)].[Schools] on (SR.EOHash = [Schools].EOHash)
  group by [Schools].EOHash, [Schools].EOName , [Schools].EOAreaFullName
  order by N DESC

