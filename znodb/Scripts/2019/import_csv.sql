-- input variables: ZnoYear

IF ('$(ZnoYear)' <> '2019') 
BEGIN
	RAISERROR ('Wrong input param.', 16, 1); 
END

:setvar CSV_CODEPAGE 1251	
:r ..\import_csv.sql

