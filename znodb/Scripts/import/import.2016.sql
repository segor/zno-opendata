:setvar ZnoYear 2016

:setvar CSV_CODEPAGE 1251
:r .\import_csv.sql
GO

:r .\fill_Data_Parsed.2016.sql
GO

:r .\resolve_duplicated_schools.sql
GO
