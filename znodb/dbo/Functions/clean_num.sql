﻿
CREATE FUNCTION [dbo].[clean_num] 
(
	@num NVARCHAR(500) NULL
)
RETURNS NVARCHAR(500)
AS
BEGIN
	RETURN CASE WHEN @num <> 'null' THEN REPLACE(@num, N',', N'.') END
END

