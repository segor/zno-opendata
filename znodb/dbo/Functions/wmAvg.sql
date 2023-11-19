
-- Weighted Moving Average of two values
CREATE FUNCTION [dbo].[wmAvg]
(
	@val1 decimal(7,4),
	@val2 decimal(7,4),
	@val3 decimal(7,4) = NULL
)
RETURNS decimal(7,4)
WITH INLINE = ON
AS
BEGIN
	RETURN CASE WHEN @val3 IS NULL 
		THEN (2 * @val1 + 1 * @val2) / 3
		ELSE  (3 * @val1 + 2 * @val2 + 1 * @val3) / 6 
	END;
END
