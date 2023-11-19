
CREATE FUNCTION [dbo].[get_score] 
(	
	@testStatus nvarchar(500),
	@ball100 decimal(4,1),
	@ball12 decimal(4,2) NULL = NULL
)
RETURNS decimal(4,1)
WITH INLINE = ON
AS
BEGIN	
	RETURN 	
	CASE WHEN @testStatus IN (SELECT [TestStatus] FROM [dbo].[Config_ValidExamStatuses] )  THEN  
		CASE 
		WHEN @ball100 >= 100.0 THEN @ball100
		WHEN @ball12 IS NULL THEN 50
		ELSE @ball12 * 20.0	
		END
	END
END

