﻿
CREATE FUNCTION [dbo].[clean_str] 
(
	@str NVARCHAR(500) NULL
)
RETURNS NVARCHAR(500)
AS
BEGIN
	RETURN CASE WHEN @str <> 'null' THEN LTRIM(RTRIM(REPLACE(REPLACE(REPLACE(@str, '"', ''), CHAR(13), N''), CHAR(10), N' '))) END
END

