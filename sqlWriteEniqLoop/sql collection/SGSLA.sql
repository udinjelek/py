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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_01
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_02
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_03
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_04
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_05
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_06
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_07
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 08
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_08
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 09
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_09
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 10
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_10
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 11
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_11
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 12
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_12
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 13
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_13
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 14
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_14
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
UNION ALL

---=======================
--------------- 15
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
	SGSLA_NTLANLREGSGS as NTLANLREGSGS,
	SGSLA_NSLANLREGSGS as NSLANLREGSGS,
	SGSLA_NTLANLNREGSGS as NTLANLNREGSGS,
	SGSLA_NSLANLNREGSGS as NSLANLNREGSGS,
	SGSLA_NTLAATREGSGS as NTLAATREGSGS,
	SGSLA_NSLAATREGSGS as NSLAATREGSGS,
	SGSLA_NTLAATNREGSGS as NTLAATNREGSGS,
	SGSLA_NSLAATNREGSGS as NSLAATNREGSGS
	fROM
	dc.DC_E_CNAXE_SGCSFB_RAW_15
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---
