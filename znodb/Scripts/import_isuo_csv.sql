-- input variables: ZnoYear

IF ('$(ZnoYear)' = '') 
BEGIN
	RAISERROR ('Wrong input param.', 16, 1); 
END

TRUNCATE TABLE [isuo$(ZnoYear)].Data_csv;

EXEC (
	N'BULK INSERT [isuo$(ZnoYear)].Data_csv
    FROM N''$(CsvFilesDir)\schools_isuo.org.$(ZnoYear).csv''	
    WITH
    (
        FORMAT = ''CSV'', 
        FIELDQUOTE = ''"'',
		FIRSTROW = 2, 
		CODEPAGE = N''65001'',
		DATAFILETYPE = ''Char'',
		FIELDTERMINATOR = '','',  --CSV field delimiter
		ROWTERMINATOR = ''\n'',   --Use to shift the control to next row	
		KEEPNULLS ,
		TABLOCK	
    )');