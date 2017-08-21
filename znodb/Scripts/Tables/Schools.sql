DROP TABLE IF EXISTS [zno$(ZnoYear)].[Schools];

CREATE TABLE [zno$(ZnoYear)].[Schools] (
    [EOHash]         VARBINARY (20) NOT NULL,
    [EOName]         NVARCHAR (500) NOT NULL,
    [EOTypeName]     NVARCHAR (500) NOT NULL,
    [EORegName]      NVARCHAR (500) NOT NULL,
    [EOAreaName]     NVARCHAR (500) NOT NULL,
    [EOTerName]      NVARCHAR (500) NOT NULL,
    [TerType]        NVARCHAR (10)  NOT NULL,
    [EOAreaFullName] NVARCHAR (500) NULL,
	[IsPrivate]		 BIT			NOT NULL,
	[EOName_Source]  NVARCHAR (500) NOT NULL,    
);

GO

CREATE UNIQUE NONCLUSTERED INDEX [IX_Schools]
    ON [zno$(ZnoYear)].[Schools]([EOHash] ASC)
    INCLUDE([EOName], [TerType], [EOAreaFullName]);

GO

CREATE INDEX [IX_Schools_EOHash] ON [zno$(ZnoYear)].[Schools] ([EOHash])

GO

