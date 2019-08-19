PRINT N'Saving 3-years composite schools rating $(ZnoYear) into a table...'
DROP TABLE IF EXISTS [zno$(ZnoYear)].[SchoolRating_Composite_2Y_Table]
GO
SELECT * INTO [zno$(ZnoYear)].[SchoolRating_Composite_2Y_Table]
  FROM [zno$(ZnoYear)].[SchoolRating_Composite_2Y]
GO
CREATE UNIQUE INDEX [UK_SchoolRating_Composite_2Y_Table_EOHash]   
    ON [zno$(ZnoYear)].[SchoolRating_Composite_2Y_Table] (EOHash) 
GO
CREATE UNIQUE INDEX [UK_SchoolRating_Composite_2Y_Table_EOHash_Merge]   
    ON [zno$(ZnoYear)].[SchoolRating_Composite_2Y_Table] (EOHash_Merge) 
GO
