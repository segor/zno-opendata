-- input variables: ZnoYear

TRUNCATE TABLE [zno$(ZnoYear)].Data_csv
GO

PRINT N'Importing CSV data for ZNO-$(ZnoYear)...'
GO
IF NOT EXISTS(SELECT 1 FROM [dbo].Data_Parsed WHERE ZnoYear = $(ZnoYear))
BEGIN
	:r .\$(ZnoYear)\import_csv.sql
END 

PRINT N'ZNO-$(ZnoYear): Parsing imported CSV data...'
GO
IF NOT EXISTS(SELECT 1 FROM [dbo].Data_Parsed WHERE ZnoYear = $(ZnoYear))
BEGIN
	:r .\$(ZnoYear)\fill_Data_Parsed.sql
END 

PRINT N'ZNO-$(ZnoYear): Resolving duplicated school names...';
GO
BEGIN
	:r .\resolve_duplicated_schools.sql
END 
GO


TRUNCATE TABLE [zno$(ZnoYear)].Data_csv
GO

PRINT N'Importing CSV data from ISUO-$(ZnoYear)...'
GO
IF $(ZnoYear) = 2020
BEGIN
	:r .\import_isuo_csv.sql
	:r .\fill_Schools_isuo.sql
	--:r .\View_isuo_Schools_Merged.sql
END 
