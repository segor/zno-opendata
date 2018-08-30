CREATE TABLE [dbo].[Schools_Composite]
(	
	[EOHashInitial]     VARBINARY (20) NOT NULL,  
	[EOHashAlternative]         VARBINARY (20) NOT NULL,
   

    CONSTRAINT [PK_Schools_Composite] PRIMARY KEY ([EOHashInitial],[EOHashAlternative])
)

GO


CREATE UNIQUE INDEX [UK_Schools_Composite_EOHashAlternative]  
    ON [dbo].[Schools_Composite] ([EOHashAlternative]) 
