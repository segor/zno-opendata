﻿CREATE FUNCTION [dbo].[canBeInSubjectRating]
(
	@subjN int
)
RETURNS BIT
WITH INLINE = ON
AS
BEGIN
	RETURN CASE WHEN @subjN>=3 THEN 1 ELSE 0 END 
END
