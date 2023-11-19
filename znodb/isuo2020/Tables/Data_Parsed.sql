CREATE TABLE [isuo2020].Data_csv (
	[№ у системі] 													INT
	,[Код ЄДРПОУ] 													NVARCHAR (20)
	,[Повна назва]                                                  NVARCHAR (500)   NULL
	,[Скорочена]                                                    NVARCHAR (500)   NULL
	,[Тип ЗЗСО]                                                     NVARCHAR (500)   NULL
	,[Новий тип ЗЗСО]                                               NVARCHAR (500)   NULL
	,[Ступiнь]                                                      NVARCHAR (500)   NULL
	,[Форма власності]                                              NVARCHAR (500)   NULL
	,[Тип місцевості]                                               NVARCHAR (500)   NULL
	,[Індекс]                                                       NVARCHAR (500)   NULL
	,[Поштова адреса]                                               NVARCHAR (500)   NULL
	,[Код КОАТУУ]                                                   NVARCHAR (500)   NULL
	,[Телефони]                                                     NVARCHAR (500)   NULL
	,[Вибір підручників]                                            NVARCHAR (500)   NULL
	,[Сайт(и)]                                                      NVARCHAR (500)   NULL
	,[ЗЗСО на порталі «Нові знання»]                                NVARCHAR (500)   NULL
	,[Електронна реєстрація в заклади загальної середньої освіти]   NVARCHAR (500)   NULL
	,[Директор]                                                     NVARCHAR (500)   NULL
	,[Уповноважена особа]                                           NVARCHAR (500)   NULL
	,[Мова навчання]                                                NVARCHAR (500)   NULL
	,[Профілі навчання]                                             NVARCHAR (500)   NULL
	,[Спроможність закладу освіти (учнів)]                          NVARCHAR (500)   NULL
	,[Кількість учнів]                                              NVARCHAR (500)   NULL
	,[Кількість персоналу]                                          NVARCHAR (500)   NULL
	,[Кількість класів]                                             NVARCHAR (500)   NULL
	,[Кількість приміщень]                                          NVARCHAR (500)   NULL
	,[Кількість інклюзивних класів]                                 NVARCHAR (500)   NULL
	,[Кількість учнів у них]                                        NVARCHAR (500)   NULL
	,[Бюджетування (засновник)]                                     NVARCHAR (500)   NULL
	,[Наявність вільних приміщень]                                  NVARCHAR (500)   NULL
	,[Звіти]                                                        NVARCHAR (500)   NULL
	,[Куратор ЗЗСО]                                                 NVARCHAR (500)   NULL
	,[Участь в регіональних проектах]                               NVARCHAR (MAX)   NULL
	,[Участь в міжнародних проектах]                                NVARCHAR (MAX)   NULL
	,[Можливість надання платних послуг]                            NVARCHAR (MAX)   NULL
	,[Опорний заклад]                                               NVARCHAR (500)   NULL
	,[Філія опорного закладу]                                       NVARCHAR (500)   NULL
	,[SourceUrl]                                                    NVARCHAR (500)   NULL
	,[Latitude]                                                     DECIMAL(12,9)	 NULL
	,[Longitude]                                                    DECIMAL(12,9)	 NULL
)