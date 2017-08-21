-- exam statuses to filter valid exam scores

CREATE VIEW [dbo].[Config_ValidExamStatuses] AS
SELECT  N'Не склав' AS TestStatus
UNION 
SELECT N'Отримав результат' AS TestStatus
-- In 2017 new test statuses have been introduced:
UNION 
SELECT N'Не подолав поріг' AS TestStatus
UNION 
SELECT N'Зараховано' AS TestStatus

