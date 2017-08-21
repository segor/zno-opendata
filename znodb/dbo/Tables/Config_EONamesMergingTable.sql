CREATE TABLE [dbo].[Config_EONamesMergingTable]
(
	[EOHash]         VARBINARY (20) NOT NULL,
    [EOHashPrevYear]     VARBINARY (20) NOT NULL, 
    CONSTRAINT [AK_Config_EONamesMergingTable_EOHash] UNIQUE ([EOHash])
)
