CREATE TABLE [dbo].[Config_EONamesMergingTable]
(	
	[Year] SMALLINT NOT NULL,
	[EOHash]         VARBINARY (20) NOT NULL,
    [EOHashPrevYear]     VARBINARY (20) NOT NULL,  

    CONSTRAINT [PK_Config_EONamesMergingTable] PRIMARY KEY ([Year], [EOHash], [EOHashPrevYear]), 
    CONSTRAINT [CK_Config_EONamesMergingTable_PrevHashShouldBeDifferent] CHECK ([EOHash] <> [EOHashPrevYear]),
)

GO

CREATE UNIQUE INDEX [UK_Config_EONamesMergingTable_Year_EOHash]  
    ON [dbo].[Config_EONamesMergingTable] ([Year], [EOHash]) 
GO

CREATE UNIQUE INDEX [UK_Config_EONamesMergingTable_Year_EOHashPrevYear]  
    ON [dbo].[Config_EONamesMergingTable] ([Year], [EOHashPrevYear]) 
GO

CREATE INDEX [IX_Config_EONamesMergingTable_EOHash] ON [dbo].[Config_EONamesMergingTable] ([EOHash])

GO
