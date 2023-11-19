:r .\Script.AlterDbFiles.sql

TRUNCATE TABLE [dbo].[PersonScores]
GO
TRUNCATE TABLE [dbo].[Schools]
GO
TRUNCATE TABLE [dbo].[Config_EONamesMergedTable]
GO
TRUNCATE TABLE [dbo].[SchoolRatingShort]
GO
TRUNCATE TABLE [dbo].[Config_EONamesMergingTable]
GO

:setvar ZnoYear 2016
GO
:r .\PrepareDataForTheYear.sql
GO

:setvar ZnoYear 2017
GO
:r .\PrepareDataForTheYear.sql
GO

:setvar ZnoYear 2018
GO
:r .\PrepareDataForTheYear.sql
GO

:setvar ZnoYear 2019
GO
:r .\PrepareDataForTheYear.sql
GO

:setvar ZnoYear 2020
GO
:r .\PrepareDataForTheYear.sql
GO

:setvar ZnoYear 2021
GO
:r .\PrepareDataForTheYear.sql
GO


:r .\CreateSynonymsForLastYearSchema.sql
GO

:setvar YearColumns "[2016], [2017], [2018], [2019], [2020], [2021]"
:setvar YearNullColumns "NULL AS [2016], NULL AS [2017], NULL AS [2018], NULL AS [2019], NULL AS [2020], NULL AS [2021]"
GO

:r .\Views\SchoolsWithRatingHistory.sql
GO