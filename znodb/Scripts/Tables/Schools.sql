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
	CONSTRAINT [PK_Schools] PRIMARY KEY CLUSTERED 
	(
		[EOHash] ASC
	)
);

GO


