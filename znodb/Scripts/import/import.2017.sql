:setvar ZnoYear 2017

:setvar CSV_CODEPAGE 65001
:r .\import_csv.sql
GO

:r .\fill_Data_Parsed.2017.sql
GO

:r .\resolve_duplicated_schools.sql
GO