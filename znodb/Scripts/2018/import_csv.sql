-- input variables: ZnoYear

IF ('$(ZnoYear)' <> '2018') 
BEGIN
	RAISERROR ('Wrong input param.', 16, 1); 
END

:setvar CSV_CODEPAGE 65001	
:r ..\import_csv.sql

