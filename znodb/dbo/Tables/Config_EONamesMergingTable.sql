CREATE TABLE [dbo].[Config_EONamesMergingTable]
(
	[EOHash]         VARBINARY (20) NOT NULL,
    [EOHashPrevYear]     VARBINARY (20) NOT NULL, 
    CONSTRAINT [PK_Config_EONamesMergingTable] PRIMARY KEY ([EOHash]) 
)
