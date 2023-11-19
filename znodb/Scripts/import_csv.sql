-- input variables: ZnoYear, CSV_CODEPAGE

IF ('$(ZnoYear)' = '') 
BEGIN
	RAISERROR ('Wrong input param.', 16, 1); 
END

EXEC (
	N'BULK INSERT [zno$(ZnoYear)].Data_csv
	-- !!! SET PATH TO CSV FILE HERE: 	
    FROM N''$(CsvFilesDir)\OpenData$(ZnoYear).csv''	
    WITH
    (
        FORMAT = ''CSV'', 
        FIELDQUOTE = ''"'',
		FIRSTROW = 2, 
		CODEPAGE = N''$(CSV_CODEPAGE)'',
		FIELDTERMINATOR = '';'',  --CSV field delimiter
		ROWTERMINATOR = ''\n'',   --Use to shift the control to next row	
		TABLOCK	
    )')
