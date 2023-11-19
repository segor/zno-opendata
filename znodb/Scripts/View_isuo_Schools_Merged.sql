-- input variables: ZnoYear
EXEC ('DROP VIEW IF EXISTS [zno$(ZnoYear)].[Schools_Merged]')
GO

CREATE VIEW [isuo$(ZnoYear)].[Schools_Merged] 
AS
WITH IsuoSchoolHashes AS (
	SELECT DISTINCT  S.EOHash, S.EOHash_Merge
	FROM dbo.Schools S
	INNER JOIN [isuo$(ZnoYear)].Schools I_S ON I_S.EOHash = S.EOHash
)
,IsuoSchools AS (
	SELECT 
		EOHash_Merge
		,I_S.* 
	FROM [isuo$(ZnoYear)].Schools I_S
	INNER JOIN IsuoSchoolHashes H ON I_S.EOHash = H.EOHash
)
SELECT 
	S.*,
	[№ у системі],
	[Код ЄДРПОУ],
	[Повна назва],
	[Скорочена],
	[Тип ЗЗСО],
	[Новий тип ЗЗСО],
	[Ступiнь],
	[Форма власності],
	[Тип місцевості],
	[Індекс],
	[Поштова адреса],
	[Код КОАТУУ],
	[Телефони],
	[Вибір підручників],
	[Сайт(и)],
	[ЗЗСО на порталі «Нові знання»],
	[Електронна реєстрація в заклади загальної середньої освіти],
	[Директор],
	[Уповноважена особа],
	[Мова навчання],
	[Профілі навчання],
	[Спроможність закладу освіти (учнів)],
	[Кількість учнів],
	[Кількість персоналу],
	[Кількість класів],
	[Кількість приміщень],
	[Кількість інклюзивних класів],
	[Кількість учнів у них],
	[Бюджетування (засновник)],
	[Наявність вільних приміщень],
	[Звіти],
	[Куратор ЗЗСО],
	[Участь в регіональних проектах],
	[Участь в міжнародних проектах],
	[Можливість надання платних послуг],
	[Опорний заклад],
	[Філія опорного закладу],
	[SourceUrl],
	[Latitude],
	[Longitude]
FROM dbo.Schools_Merged S
	LEFT OUTER JOIN IsuoSchools I_S ON I_S.EOHash_Merge = S.EOHash_Merge;
