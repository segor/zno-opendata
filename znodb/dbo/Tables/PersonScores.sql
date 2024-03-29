﻿CREATE TABLE [dbo].[PersonScores] (
    [ZnoYear] SMALLINT NOT NULL,
	[OutID]       NVARCHAR (200) NOT NULL,
    [SexTypeName] NVARCHAR (500) NULL,
    [Age]         INT            NULL,
    [EOHash]      VARBINARY (20) NOT NULL,
    [Uml]         DECIMAL (4, 1) NULL,
    [Ukr]         DECIMAL (4, 1) NULL,
    [Hist]        DECIMAL (4, 1) NULL,
    [Math]        DECIMAL (4, 1) NULL,
    [Phys]        DECIMAL (4, 1) NULL,
    [Chem]        DECIMAL (4, 1) NULL,
    [Bio]         DECIMAL (4, 1) NULL,
    [Geo]         DECIMAL (4, 1) NULL,
    [Eng]         DECIMAL (4, 1) NULL,
    [Fr]          DECIMAL (4, 1) NULL,
    [Deu]         DECIMAL (4, 1) NULL,
    [Sp]          DECIMAL (4, 1) NULL,
    [Rus]         DECIMAL (4, 1) NULL,
	 CONSTRAINT [PK_PersonScores] PRIMARY KEY CLUSTERED 
		(
			[ZnoYear] ASC,
			[EOHash] ASC,
			[OutID] ASC
		)
);


GO
CREATE NONCLUSTERED INDEX [IX_EO]
    ON [dbo].[PersonScores]([EOHash] ASC)
    INCLUDE([OutID], [Uml], [Ukr], [Hist], [Math], [Phys], [Chem], [Bio], [Geo], [Eng], [Fr], [Deu], [Sp], [Rus]);


GO
CREATE NONCLUSTERED INDEX [IX_ID]
    ON [dbo].[PersonScores]([OutID] ASC)
    INCLUDE([EOHash], [Uml], [Ukr], [Hist], [Math], [Phys], [Chem], [Bio], [Geo], [Eng], [Fr], [Deu], [Sp], [Rus]);


GO
