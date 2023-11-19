-- input variables: ZnoYear

:r .\import.sql
GO
:r .\Script.CreateCommonStructure.sql
GO
SET NOCOUNT ON
-- it is manually prepared list. Use the view Config_RenamedSchoolThatShouldBeMergedTo to see what schools are not matched between the last and previous ZNO
:r .\$(ZnoYear)\Fill_Config_EONamesMergingTable.sql
GO
:r .\fill_helper_tables.sql
GO


PRINT N'Loading matching dictionary of schools renamed in  $(ZnoYear)...'
GO
:r .\Views\Config_RenamedSchoolThatShouldBeMergedFrom.sql
GO
:r .\Views\Config_RenamedSchoolThatShouldBeMergedTo.sql
GO
:r .\Views\Config_RenamedSchoolThatCanBeMergedHint.sql
GO

:r .\fill_SchoolRatingShort_Table.sql
GO

:r .\Views\SchoolRating_Composite_3Y.sql
GO

:r .\Views\FastestFallingTop20.sql
GO
:r .\Views\FastestGrowingSchoolsTop20.sql
GO