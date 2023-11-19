DECLARE @dbSchema NVARCHAR(200);
SET @dbSchema = 'dbo'  -- CHANGE TO YOUR SCHEMA

DECLARE @lastYear int;
DECLARE @SqlStatement NVARCHAR(MAX)

SELECT @lastYear = MAX (ZnoYear)
FROM [dbo].Years;

DECLARE @lastYearSchema  NVARCHAR(MAX) = N'zno' +  CAST(@lastYear AS NVARCHAR(4));


SET @SqlStatement = ''
SELECT @SqlStatement += N'DROP SYNONYM [zno_LastYear].' + QUOTENAME(SY.[name]) + N';' + CHAR(13)
  FROM [znodb].[sys].[synonyms] SY
  INNER JOIN sys.schemas SC ON SY.schema_id = SC.schema_id
  WHERE SC.name = 'zno_LastYear'

--print  @SqlStatement
EXEC sp_executesql @SqlStatement

SET @SqlStatement = ''
SELECT @SqlStatement += N'CREATE SYNONYM [zno_LastYear].' + QUOTENAME(TABLE_NAME) + N' FOR ['+@lastYearSchema+N'].' + QUOTENAME(TABLE_NAME) + N';' + CHAR(13)
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA =  @lastYearSchema

--print  @SqlStatement
EXEC sp_executesql @SqlStatement