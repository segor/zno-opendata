CREATE FUNCTION [dbo].[canBeInSchoolRating](
	@ExamineesN int,
	@EOTypeName NVARCHAR (500)
)
RETURNS BIT
AS
BEGIN
	RETURN CASE WHEN				
				@ExamineesN >= 3 AND
				@EOTypeName IN  (
					SELECT [EOTypeName]
					FROM [dbo].[Config_EOTypesForRating] 
				)
			THEN 1
			ELSE 0 END
END
