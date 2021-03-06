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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_01
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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_02
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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_03
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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_04
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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_05
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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_06
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
	GUHNDOVER_NGUHNDHRQDTOT AS NGUHNDHRQDTOT,
	GUHNDOVER_NGURELREQTOT AS NGURELREQTOT,
	GUHNDOVER_NGURELREQSUCC AS NGURELREQSUCC,
	GUHNDOVER_NGUHNDCMDTOT AS NGUHNDCMDTOT,
	GUHNDOVER_NGURELCGSSUCC AS NGURELCGSSUCC,
	GUHNDOVER_NGURELDGSSUCC AS NGURELDGSSUCC,
	GUHNDOVER_NGUHNDATTSUCC AS NGUHNDATTSUCC,
	GUHNDOVER_NGUHNDRELRR AS NGUHNDRELRR,
	GUHNDOVER_NGUHBSCRNCSUCC AS NGUHBSCRNCSUCC,
	GUHNDOVER_NGUHBSCRNCTOT AS NGUHBSCRNCTOT,
	GUHNDOVER_NGUHNDSDTOT AS NGUHNDSDTOT,
	GUHNDOVER_NGUHNDSDSUCC AS NGUHNDSDSUCC,
	GUHNDOVER_NGUHNDSHTTOT AS NGUHNDSHTTOT,
	GUHNDOVER_NGUHNDSHTSUCC AS NGUHNDSHTSUCC
FROM
    dc.DC_E_CNAXE_MSC_RAW_07
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---

