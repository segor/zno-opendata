CREATE TABLE [dbo].[Config_EONamesMergedTable]
(		
	[EOHash]         VARBINARY (20) NOT NULL,
    [EOHashInitial]     VARBINARY (20) NOT NULL,  

    CONSTRAINT [PK_Config_EONamesMergedTable] PRIMARY KEY ([EOHash], [EOHashInitial]) ,
	CONSTRAINT [CK_Config_EONamesMergedTable_InitialHashShouldBeDifferent] CHECK ([EOHash] <> [EOHashInitial]),
)

GO

