PRINT N'Importing CSV data for ZNO-$(ZnoYear)...'
GO

TRUNCATE TABLE [zno$(ZnoYear)].Data_csv
GO

IF N'$(DO_NOT_IMPORT_CSV)' NOT LIKE N'True'
EXEC (
	N'BULK INSERT [zno$(ZnoYear)].Data_csv
	-- !!! SET PATH TO CSV FILE HERE: 	
    FROM N''$(CsvFilesDir)\OpenData$(ZnoYear).csv''	
    WITH
    (
		FIRSTROW = 2, 
		CODEPAGE = N''$(CSV_CODEPAGE)'',
		FIELDTERMINATOR = '';'',  --CSV field delimiter
		ROWTERMINATOR = ''\n'',   --Use to shift the control to next row	
		TABLOCK	
    )')
GO