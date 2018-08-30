CREATE TABLE [dbo].[Schools](
    [ZnoYear] SMALLINT NOT NULL,
	[EOHash] [varbinary](20) NOT NULL,
	[EOHash_Merge] [varbinary](20) NOT NULL,
	[EOName] [nvarchar](500) NOT NULL,
	[EOTypeName] [nvarchar](500) NOT NULL,
	[EORegName] [nvarchar](500) NOT NULL,
	[EOAreaName] [nvarchar](500) NOT NULL,
	[EOTerName] [nvarchar](500) NOT NULL,
	[TerType] [nvarchar](10) NOT NULL,
	[EOAreaFullName] [nvarchar](500) NULL,
	[IsPrivate] [bit] NOT NULL,
	[EOName_Source] [nvarchar](500) NOT NULL,	

	 CONSTRAINT [PK_Schools] PRIMARY KEY CLUSTERED 
	(
		[ZnoYear] ASC
		, [EOHash] ASC
	)
)
GO

