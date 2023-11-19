
CREATE FUNCTION [dbo].[get_eo_hash] 
(	
	@EOName nvarchar(500),
	@EORegName nvarchar(500)
)
RETURNS varbinary(20)
WITH INLINE = ON
AS
BEGIN	
	RETURN CASE 
		WHEN @EOName IS NOT NULL 
		THEN HASHBYTES ('SHA1', 
			LOWER(REPLACE(REPLACE(
                    TRANSLATE(dbo.clean_EOName(@EOName) + @EORegName, N'-.,:''"«»`’', N'          ')
				, N'I', N'І') --U+0049 -> U+0406 Ukranian I
                , N' ', N''))
		) 
	END
END

