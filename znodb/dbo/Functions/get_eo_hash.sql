
CREATE FUNCTION [dbo].[get_eo_hash] 
(	
	@EOName nvarchar(500),
	@EORegName nvarchar(500)
)
RETURNS varbinary(20)
AS
BEGIN	
	RETURN CASE 
		WHEN @EOName IS NOT NULL 
		THEN HASHBYTES ('SHA1', 
			LOWER(REPLACE(REPLACE(REPLACE(REPLACE(REPLACE(dbo.clean_EOName(@EOName) + @EORegName
			, N'-', N'')
			, N'.', N'')
			, N' ', N'')
			, N'«', N'')
			, N'»', N''))
		) 
	END
END

