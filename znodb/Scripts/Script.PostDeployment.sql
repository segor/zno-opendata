:r .\Script.AlterDbFiles.sql

TRUNCATE TABLE [dbo].[PersonScores]
GO

:setvar ZnoYear 2016
GO
:r .\import\import.2016.sql
GO
:r .\Script.CreateCommonStructure.sql
GO
:r .\import\fill_helper_tables.sql
GO

:setvar ZnoYear 2017
GO
:r .\import\import.2017.sql
GO
:r .\Script.CreateCommonStructure.sql
GO
:r .\import\fill_helper_tables.sql
GO


:setvar ZnoYear 2017
:setvar PrevZnoYear 2016
GO

:r .\Views\Config_RenamedSchoolThatShouldBeMerged.sql
GO
:r .\Views\SchoolRating_Composite.sql
GO

PRINT N'Loading renamed schools maching dictionary...'
-- it is manually prepered list. Use the view Config_RenamedSchoolThatShouldBeMerged to see what schools are not mathed between the last and previous ZNO
TRUNCATE TABLE [dbo].[Config_EONamesMergingTable]
GO
SET NOCOUNT ON
:r .\Config\Fill_Config_EONamesMergingTable.sql
SET NOCOUNT OFF
GO

PRINT N'Saving composite schools rating into a table...'
DROP TABLE IF EXISTS [zno$(ZnoYear)].[SchoolRating_Composite_Table]
GO
SELECT * INTO [zno$(ZnoYear)].[SchoolRating_Composite_Table]
  FROM [zno$(ZnoYear)].[SchoolRating_Composite]
GO

PRINT N'Shrinking database...'
GO
DBCC SHRINKDATABASE ([$(DatabaseName)], TRUNCATEONLY) WITH NO_INFOMSGS
GO
