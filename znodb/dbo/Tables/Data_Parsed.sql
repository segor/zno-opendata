﻿CREATE TABLE [dbo].Data_Parsed (	 
    [ZnoYear]        SMALLINT NOT NULL,
    [OutID]          UNIQUEIDENTIFIER NULL,
    [Birth]          INT              NULL,
    [SexTypeName]    NVARCHAR (500)   NULL,
    [Regname]        NVARCHAR (500)   NULL,
    [AreaName]       NVARCHAR (500)   NULL,
    [TerName]        NVARCHAR (500)   NULL,
    [RegTypeName]    NVARCHAR (500)   NULL,
	[TerTypeName]    NVARCHAR (500)   NULL,
	[ClassProfileNAME]  NVARCHAR (500) NULL,
	[ClassLangName]  NVARCHAR (500)   NULL,
    [EOName]         NVARCHAR (500)   NULL,
    [EOTypeName]     NVARCHAR (500)   NULL,
    [EORegName]      NVARCHAR (500)   NULL,
    [EOAreaName]     NVARCHAR (500)   NULL,
    [EOTerName]      NVARCHAR (500)   NULL,
    [EOParent]       NVARCHAR (500)   NULL,
    [UkrTest]        NVARCHAR (500)   NULL,
    [UkrTestStatus]  NVARCHAR (500)   NULL,
    [UkrBall100]     DECIMAL (4, 1)   NULL,
    [UkrBall12]      DECIMAL (4, 2)   NULL,
	[UkrBall]        DECIMAL (4, 1)   NULL,	
	[UkrAdaptScale]  NVARCHAR (500)   NULL,
    [UkrPTName]      NVARCHAR (500)   NULL,
    [UkrPTRegName]   NVARCHAR (500)   NULL,
    [UkrPTAreaName]  NVARCHAR (500)   NULL,
    [UkrPTTerName]   NVARCHAR (500)   NULL,
    [HistTest]       NVARCHAR (500)   NULL,
    [HistLang]       NVARCHAR (500)   NULL,
    [HistTestStatus] NVARCHAR (500)   NULL,
    [HistBall100]    DECIMAL (4, 1)   NULL,
    [HistBall12]     DECIMAL (4, 2)   NULL,
    [HistBall]       DECIMAL (4, 1)   NULL,	
	[HistPTName]     NVARCHAR (500)   NULL,
    [HistPTRegName]  NVARCHAR (500)   NULL,
    [HistPTAreaName] NVARCHAR (500)   NULL,
    [HistPTTerName]  NVARCHAR (500)   NULL,
    [MathTest]       NVARCHAR (500)   NULL,
    [MathLang]       NVARCHAR (500)   NULL,
    [MathTestStatus] NVARCHAR (500)   NULL,
    [MathBall100]    DECIMAL (4, 1)   NULL,
    [MathBall12]     DECIMAL (4, 2)   NULL,
    [MathBall]       DECIMAL (4, 1)   NULL,	
	[MathPTName]     NVARCHAR (500)   NULL,
    [MathPTRegName]  NVARCHAR (500)   NULL,
    [MathPTAreaName] NVARCHAR (500)   NULL,
    [MathPTTerName]  NVARCHAR (500)   NULL,
    [PhysTest]       NVARCHAR (500)   NULL,
    [PhysLang]       NVARCHAR (500)   NULL,
    [PhysTestStatus] NVARCHAR (500)   NULL,
    [PhysBall100]    DECIMAL (4, 1)   NULL,
    [PhysBall12]     DECIMAL (4, 2)   NULL,
    [PhysBall]       DECIMAL (4, 1)   NULL,	
	[PhysPTName]     NVARCHAR (500)   NULL,
    [PhysPTRegName]  NVARCHAR (500)   NULL,
    [PhysPTAreaName] NVARCHAR (500)   NULL,
    [PhysPTTerName]  NVARCHAR (500)   NULL,
    [ChemTest]       NVARCHAR (500)   NULL,
    [ChemLang]       NVARCHAR (500)   NULL,
    [ChemTestStatus] NVARCHAR (500)   NULL,
    [ChemBall100]    DECIMAL (4, 1)   NULL,
    [ChemBall12]     DECIMAL (4, 2)   NULL,
    [ChemBall]       DECIMAL (4, 1)   NULL,	
    [ChemPTName]     NVARCHAR (500)   NULL,
    [ChemPTRegName]  NVARCHAR (500)   NULL,
    [ChemPTAreaName] NVARCHAR (500)   NULL,
    [ChemPTTerName]  NVARCHAR (500)   NULL,
    [BioTest]        NVARCHAR (500)   NULL,
    [BioLang]        NVARCHAR (500)   NULL,
    [BioTestStatus]  NVARCHAR (500)   NULL,
    [BioBall100]     DECIMAL (4, 1)   NULL,
    [BioBall12]      DECIMAL (4, 2)   NULL,
    [BioBall]        DECIMAL (4, 1)   NULL,	
    [BioPTName]      NVARCHAR (500)   NULL,
    [BioPTRegName]   NVARCHAR (500)   NULL,
    [BioPTAreaName]  NVARCHAR (500)   NULL,
    [BioPTTerName]   NVARCHAR (500)   NULL,
    [GeoTest]        NVARCHAR (500)   NULL,
    [GeoLang]        NVARCHAR (500)   NULL,
    [GeoTestStatus]  NVARCHAR (500)   NULL,
    [GeoBall100]     DECIMAL (4, 1)   NULL,
    [GeoBall12]      DECIMAL (4, 2)   NULL,
    [GeoBall]        DECIMAL (4, 1)   NULL,	
    [GeoPTName]      NVARCHAR (500)   NULL,
    [GeoPTRegName]   NVARCHAR (500)   NULL,
    [GeoPTAreaName]  NVARCHAR (500)   NULL,
    [GeoPTTerName]   NVARCHAR (500)   NULL,
    [EngTest]        NVARCHAR (500)   NULL,
    [EngTestStatus]  NVARCHAR (500)   NULL,
    [EngBall100]     DECIMAL (4, 1)   NULL,
    [EngBall12]      DECIMAL (4, 2)   NULL,	
	[EngDPALevel]    NVARCHAR (500)   NULL,	
    [EngBall]        DECIMAL  (4, 1)  NULL,	
    [EngPTName]      NVARCHAR (500)   NULL,
    [EngPTRegName]   NVARCHAR (500)   NULL,
    [EngPTAreaName]  NVARCHAR (500)   NULL,
    [EngPTTerName]   NVARCHAR (500)   NULL,
    [FrTest]         NVARCHAR (500)   NULL,
    [FrTestStatus]   NVARCHAR (500)   NULL,
    [FrBall100]      DECIMAL (4, 1)   NULL,
    [FrBall12]       DECIMAL (4, 2)   NULL,
	[FrDPALevel]    NVARCHAR (500)   NULL,
    [FrBall]         DECIMAL (4, 1)   NULL,	
    [FrPTName]       NVARCHAR (500)   NULL,
    [FrPTRegName]    NVARCHAR (500)   NULL,
    [FrPTAreaName]   NVARCHAR (500)   NULL,
    [FrPTTerName]    NVARCHAR (500)   NULL,
    [DeuTest]        NVARCHAR (500)   NULL,
    [DeuTestStatus]  NVARCHAR (500)   NULL,
    [DeuBall100]     DECIMAL (4, 1)   NULL,
    [DeuBall12]      DECIMAL (4, 2)   NULL,
	[DeuDPALevel]    NVARCHAR (500)   NULL,
    [DeuBall]        DECIMAL (4, 1)   NULL,	
    [DeuPTName]      NVARCHAR (500)   NULL,
    [DeuPTRegName]   NVARCHAR (500)   NULL,
    [DeuPTAreaName]  NVARCHAR (500)   NULL,
    [DeuPTTerName]   NVARCHAR (500)   NULL,
    [SpTest]         NVARCHAR (500)   NULL,
    [SpTestStatus]   NVARCHAR (500)   NULL,
    [SpBall100]      DECIMAL (4, 1)   NULL,
    [SpBall12]       DECIMAL (4, 2)   NULL,
	[SpaDPALevel]    NVARCHAR (500)   NULL,
    [SpBall]         DECIMAL (4, 1)   NULL,	
    [SpPTName]       NVARCHAR (500)   NULL,
    [SpPTRegName]    NVARCHAR (500)   NULL,
    [SpPTAreaName]   NVARCHAR (500)   NULL,
    [SpPTTerName]    NVARCHAR (500)   NULL,
    [RusTest]        NVARCHAR (500)   NULL,
    [RusTestStatus]  NVARCHAR (500)   NULL,
    [RusBall100]     DECIMAL (4, 1)   NULL,
    [RusBall12]      DECIMAL (4, 2)   NULL,
    [RusPTName]      NVARCHAR (500)   NULL,
    [RusPTRegName]   NVARCHAR (500)   NULL,
    [RusPTAreaName]  NVARCHAR (500)   NULL,
    [RusPTTerName]   NVARCHAR (500)   NULL
);

