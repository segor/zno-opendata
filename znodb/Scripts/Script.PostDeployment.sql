:r .\Script.AlterDbFiles.sql

TRUNCATE TABLE [dbo].[PersonScores]
GO
TRUNCATE TABLE [dbo].[Schools]
GO
TRUNCATE TABLE [dbo].[Schools_Composite]
GO
-- it is manually prepered list. Use the view Config_RenamedSchoolThatShouldBeMergedTo to see what schools are not mathed between the last and previous ZNO
TRUNCATE TABLE [dbo].[Config_EONamesMergingTable]
GO

:setvar ZnoYear 2016
GO
:r .\import\import.2016.sql
GO
:r .\Script.CreateCommonStructure.sql
GO
SET NOCOUNT OFF
:r .\import\fill_helper_tables.sql
GO

:setvar ZnoYear 2017
GO
:r .\import\import.2017.sql
GO
:r .\Script.CreateCommonStructure.sql
GO
SET NOCOUNT ON
:r .\Config\Fill_Config_EONamesMergingTable.2017.sql
SET NOCOUNT OFF
:r .\import\fill_helper_tables.sql
GO

:setvar ZnoYear 2018
GO
:r .\import\import.2018.sql
GO
:r .\Script.CreateCommonStructure.sql
GO
SET NOCOUNT ON
:r .\Config\Fill_Config_EONamesMergingTable.2018.sql
SET NOCOUNT OFF
:r .\import\fill_helper_tables.sql
GO


TRUNCATE TABLE [dbo].[Config_EONamesMergedTable]
GO


:setvar ZnoYear 2017
:setvar PrevZnoYear 2016
GO

PRINT N'Loading matching dictionary of schools renamed in  $(ZnoYear)...'
:r .\Views\Config_RenamedSchoolThatShouldBeMergedFrom.sql
GO
:r .\Views\Config_RenamedSchoolThatShouldBeMergedTo.sql
GO
:r .\Views\Config_RenamedSchoolThatCanBeMergedHint.sql
GO


:r .\Views\SchoolRating_Composite.sql
GO

:r .\Tables\SchoolRating_Composite_Table.sql
GO

:setvar ZnoYear 2018
:setvar PrevZnoYear 2017
:setvar ZnoYearBeforePrev 2016
GO

PRINT N'Loading maching dictionary of schools renamed in  $(ZnoYear)...'
:r .\Views\Config_RenamedSchoolThatShouldBeMergedFrom.sql
GO
:r .\Views\Config_RenamedSchoolThatShouldBeMergedTo.sql
GO
:r .\Views\Config_RenamedSchoolThatCanBeMergedHint.sql
GO

:r .\Views\SchoolRating_Composite.sql
GO
:r .\Views\SchoolRating_Composite_3Y.sql
GO

:r .\Tables\SchoolRating_Composite_Table.sql
GO
:r .\Tables\SchoolRating_Composite_3Y_Table.sql
GO

PRINT N'Shrinking database...'
GO
DBCC SHRINKDATABASE ([$(DatabaseName)], TRUNCATEONLY) WITH NO_INFOMSGS
GO
