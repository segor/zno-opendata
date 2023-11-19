
CREATE FUNCTION [dbo].[clean_str] 
(
	@str NVARCHAR(500) NULL
)
RETURNS NVARCHAR(500)
WITH INLINE = ON
AS
BEGIN
	RETURN CASE WHEN @str <> 'null' THEN TRIM(REPLACE(TRANSLATE(@str, CHAR(13) + char(10)  + char(9), '   ')
			, N'  ', ' ')) END
END

