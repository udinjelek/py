---=======================
--------------- 01
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_01
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 02
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_02
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 03
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_03
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 04
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_04
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 05
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_05
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 06
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_06
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 07
SELECT
	ELEM AS NE,
	MOID as MO,
	DATETIME_ID as [TIME],
	CASE
		WHEN PERIOD_DURATION = 60 THEN 1
		WHEN PERIOD_DURATION = 15 THEN 0
	END AS RES,
	PERIOD_DURATION AS RPL,
--------------	
	PERIOD_DURATION AS CFAIL,
	NBRMSCUGHO_NNBRBUGATOT AS NNBRBUGATOT,
	NBRMSCUGHO_NNBRBUGASUCC AS NNBRBUGASUCC,
	NBRMSCUGHO_NNBRBUGASCTOT AS NNBRBUGASCTOT,
	NBRMSCUGHO_NNBRBUGASCSUCC AS NNBRBUGASCSUCC,
	NBRMSCUGHO_NNBRSUGTOT AS NNBRSUGTOT,
	NBRMSCUGHO_NNBRSUGSUCC AS NNBRSUGSUCC,
	NBRMSCUGHO_NNBRSUGSTOT AS NNBRSUGSTOT,
	NBRMSCUGHO_NNBRSUGSSUCC AS NNBRSUGSSUCC,
	NBRMSCUGHO_NNBRBUGSTTOT AS NNBRBUGSTTOT,
	NBRMSCUGHO_NNBRBUGSTSUCC AS NNBRBUGSTSUCC,
	NBRMSCUGHO_NNBRIHOATCHTOT AS NNBRIHOATCHTOT,
	NBRMSCUGHO_NNBRSIHOATCHSUCC AS NNBRSIHOATCHSUCC,
	NBRMSCUGHO_NNBRISDHHOATOT AS NNBRISDHHOATOT,
	NBRMSCUGHO_NNBRITCHHOASUCC AS NNBRITCHHOASUCC,
	NBRMSCUGHO_NNBRUGSCATOT AS NNBRUGSCATOT,
	NBRMSCUGHO_NNBRSUGSCASUCC AS NNBRSUGSCASUCC,
	NBRMSCUGHO_NNBRNUGSCATOT AS NNBRNUGSCATOT,
	NBRMSCUGHO_NNBRNSUGSCASUCC AS NNBRNSUGSCASUCC,
	NBRMSCUGHO_NNBRUGREDREJ AS NNBRUGREDREJ
FROM
    dc.DC_E_CNAXE_MSCOBJ_RAW_07
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---

