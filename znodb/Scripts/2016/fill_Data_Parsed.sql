﻿-- input variables: ZnoYear

IF ('$(ZnoYear)' <> '2016') 
BEGIN
	RAISERROR ('Wrong input param.', 16, 1); 
END

INSERT INTO [dbo].Data_Parsed
 WITH(TABLOCK)
SELECT 
	$(ZnoYear) AS ZnoYear,
	dbo.clean_str(OutID) AS OutID,
	dbo.clean_str(Birth) AS Birth,
	dbo.clean_str(SexTypeName) AS SexTypeName,
	dbo.clean_str(Regname) AS Regname,
	dbo.clean_str(AreaName) AS AreaName,
	dbo.clean_str(TerName) AS TerName,
	dbo.clean_str(RegTypeName) AS RegTypeName,
	NULL AS TerTypeName,
	NULL AS ClassProfileNAME,
	NULL AS ClassLangName,
	dbo.clean_str(EOName) AS EOName,
	dbo.clean_str(EOTypeName) AS EOTypeName,
	dbo.clean_str(EORegName) AS EORegName,
	dbo.clean_str(EOAreaName) AS EOAreaName,
	dbo.clean_str(EOTerName) AS EOTerName,
	dbo.clean_str(EOParent) AS EOParent,
	dbo.clean_str(UkrTest) AS UmlTest,
	dbo.clean_str(UkrTestStatus) AS UmlTestStatus,
	dbo.clean_num(UkrBall100) AS UmlBall100,
	dbo.clean_num(UkrBall12) AS UmlBall12,
	NULL AS UmlBall,
	NULL AS UmlAdaptScale,
	dbo.clean_str(UkrPTName) AS UmlPTName,
	dbo.clean_str(UkrPTRegName) AS UmlPTRegName,
	dbo.clean_str(UkrPTAreaName) AS UmlPTAreaName,
	dbo.clean_str(UkrPTTerName) AS UmlPTTerName,
	NULL AS UkrTest,
	NULL AS UkrSubTest,
	NULL AS UkrTestStatus,
	NULL AS UkrBall100,
	NULL AS UkrBall12,
	NULL AS UkrBall,
	NULL AS UkrAdaptScale,
	NULL AS UkrPTName,
	NULL AS UkrPTRegName,
	NULL AS UkrPTAreaName,
	NULL AS UkrPTTerName,
	dbo.clean_str(HistTest) AS HistTest,
	dbo.clean_str(HistLang) AS HistLang,
	dbo.clean_str(HistTestStatus) AS HistTestStatus,
	dbo.clean_num(HistBall100) AS HistBall100,
	dbo.clean_num(HistBall12) AS HistBall12,
	NULL AS HistBall,
	dbo.clean_str(HistPTName) AS HistPTName,
	dbo.clean_str(HistPTRegName) AS HistPTRegName,
	dbo.clean_str(HistPTAreaName) AS HistPTAreaName,
	dbo.clean_str(HistPTTerName) AS HistPTTerName,
	dbo.clean_str(MathTest) AS MathTest,
	dbo.clean_str(MathLang) AS MathLang,
	dbo.clean_str(MathTestStatus) AS MathTestStatus,
	dbo.clean_num(MathBall100) AS MathBall100,
	dbo.clean_num(MathBall12) AS MathBall12,
	NULL AS MathDpaLevel,
	NULL AS MathBall,
	dbo.clean_str(MathPTName) AS MathPTName,
	dbo.clean_str(MathPTRegName) AS MathPTRegName,
	dbo.clean_str(MathPTAreaName) AS MathPTAreaName,
	dbo.clean_str(MathPTTerName) AS MathPTTerName,
	NULL AS MathStTest,
	NULL AS MathStLang,
	NULL AS MathStTestStatus,
	NULL AS MathStBall12,
	NULL AS MathStBall,
	NULL AS MathStPTName,
	NULL AS MathStPTRegName,
	NULL AS MathStPTAreaName,
	NULL AS MathStPTTerName,
	dbo.clean_str(PhysTest) AS PhysTest,
	dbo.clean_str(PhysLang) AS PhysLang,
	dbo.clean_str(PhysTestStatus) AS PhysTestStatus,
	dbo.clean_num(PhysBall100) AS PhysBall100,
	NULL AS PhysBall12,
	NULL AS PhysBall,
	dbo.clean_str(PhysPTName) AS PhysPTName,
	dbo.clean_str(PhysPTRegName) AS PhysPTRegName,
	dbo.clean_str(PhysPTAreaName) AS PhysPTAreaName,
	dbo.clean_str(PhysPTTerName) AS PhysPTTerName,
	dbo.clean_str(ChemTest) AS ChemTest,
	dbo.clean_str(ChemLang) AS ChemLang,
	dbo.clean_str(ChemTestStatus) AS ChemTestStatus,
	dbo.clean_num(ChemBall100) AS ChemBall100,
	NULL AS ChemBall12,
	NULL AS ChemBall,
	dbo.clean_str(ChemPTName) AS ChemPTName,
	dbo.clean_str(ChemPTRegName) AS ChemPTRegName,
	dbo.clean_str(ChemPTAreaName) AS ChemPTAreaName,
	dbo.clean_str(ChemPTTerName) AS ChemPTTerName,
	dbo.clean_str(BioTest) AS BioTest,
	dbo.clean_str(BioLang) AS BioLang,
	dbo.clean_str(BioTestStatus) AS BioTestStatus,
	dbo.clean_num(BioBall100) AS BioBall100,
	NULL AS BioBall12,
	NULL AS BioBall,
	dbo.clean_str(BioPTName) AS BioPTName,
	dbo.clean_str(BioPTRegName) AS BioPTRegName,
	dbo.clean_str(BioPTAreaName) AS BioPTAreaName,
	dbo.clean_str(BioPTTerName) AS BioPTTerName,
	dbo.clean_str(GeoTest) AS GeoTest,
	dbo.clean_str(GeoLang) AS GeoLang,
	dbo.clean_str(GeoTestStatus) AS GeoTestStatus,
	dbo.clean_num(GeoBall100) AS GeoBall100,
	NULL AS GeoBall12,
	NULL AS GeoBall,
	dbo.clean_str(GeoPTName) AS GeoPTName,
	dbo.clean_str(GeoPTRegName) AS GeoPTRegName,
	dbo.clean_str(GeoPTAreaName) AS GeoPTAreaName,
	dbo.clean_str(GeoPTTerName) AS GeoPTTerName,
	dbo.clean_str(EngTest) AS EngTest,
	dbo.clean_str(EngTestStatus) AS EngTestStatus,
	dbo.clean_num(EngBall100) AS EngBall100,
	NULL AS EngBall12,
	NULL AS EngDPALevel,
	NULL AS EngBall,
	dbo.clean_str(EngPTName) AS EngPTName,
	dbo.clean_str(EngPTRegName) AS EngPTRegName,
	dbo.clean_str(EngPTAreaName) AS EngPTAreaName,
	dbo.clean_str(EngPTTerName) AS EngPTTerName,
	dbo.clean_str(FrTest) AS FrTest,
	dbo.clean_str(FrTestStatus) AS FrTestStatus,
	dbo.clean_num(FrBall100) AS FrBall100,
	NULL AS FrBall12,
	NULL AS FrDPALevel,
	NULL AS FrBall,
	dbo.clean_str(FrPTName) AS FrPTName,
	dbo.clean_str(FrPTRegName) AS FrPTRegName,
	dbo.clean_str(FrPTAreaName) AS FrPTAreaName,
	dbo.clean_str(FrPTTerName) AS FrPTTerName,
	dbo.clean_str(DeuTest) AS DeuTest,
	dbo.clean_str(DeuTestStatus) AS DeuTestStatus,
	dbo.clean_num(DeuBall100) AS DeuBall100,
	NULL AS DeuBall12,
	NULL AS DeuDPALevel,
	NULL AS DeuBall,
	dbo.clean_str(DeuPTName) AS DeuPTName,
	dbo.clean_str(DeuPTRegName) AS DeuPTRegName,
	dbo.clean_str(DeuPTAreaName) AS DeuPTAreaName,
	dbo.clean_str(DeuPTTerName) AS DeuPTTerName,
	dbo.clean_str(SpTest) AS SpTest,
	dbo.clean_str(SpTestStatus) AS SpTestStatus,
	dbo.clean_num(SpBall100) AS SpBall100,
	NULL AS SpBall12,
	NULL AS SpDPALevel,
	NULL AS SpBall,
	dbo.clean_str(SpPTName) AS SpPTName,
	dbo.clean_str(SpPTRegName) AS SpPTRegName,
	dbo.clean_str(SpPTAreaName) AS SpPTAreaName,
	dbo.clean_str(SpPTTerName) AS SpPTTerName,
	dbo.clean_str(RusTest) AS RusTest,
	dbo.clean_str(RusTestStatus) AS RusTestStatus,
	dbo.clean_num(RusBall100) AS RusBall100,
	NULL AS RusBall12,
	dbo.clean_str(RusPTName) AS RusPTName,
	dbo.clean_str(RusPTRegName) AS RusPTRegName,
	dbo.clean_str(RusPTAreaName) AS RusPTAreaName,
	dbo.clean_str(RusPTTerName) AS RusPTTerName,

	dbo.clean_str(EOName) AS [EOName_Adjusted]
FROM [zno$(ZnoYear)].Data_csv
