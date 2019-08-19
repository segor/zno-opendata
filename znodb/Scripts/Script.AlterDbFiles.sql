PRINT N'Reserving space for database...'
GO

IF N'$(DO_NOT_IMPORT_CSV)' NOT LIKE N'True' BEGIN
ALTER DATABASE [$(DatabaseName)]
MODIFY FILE
( NAME = N'$(DatabaseName)', SIZE = 6000MB, FILEGROWTH = 10% )
ALTER DATABASE [$(DatabaseName)]
MODIFY FILE
( NAME = N'$(DatabaseName)_log', SIZE = 1024MB, FILEGROWTH = 10% )
END 
GO