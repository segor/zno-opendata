:r .\fill_PersonScores.sql
GO

:r .\fill_Schools.sql
GO

:r ..\Views\SchoolScoresTotal.sql
GO

/*
PRINT N'ZNO-$(ZnoYear): Testing schools rating...'
GO
SELECT TOP 10 *
  FROM [zno$(ZnoYear)].[SchoolRating]
GO
*/