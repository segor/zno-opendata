
-- Weighted Moving Average of two values
CREATE FUNCTION [dbo].[wmAvg]
(
	@val1 decimal(7,4),
	@val2 decimal(7,4)
)
RETURNS decimal(7,4) AS
BEGIN
	RETURN (2 * @val1 + 1 * @val2) / 3;
END

