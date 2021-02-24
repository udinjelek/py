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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_01
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_02
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_03
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_04
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_05
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_06
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_07
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_08
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_09
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_10
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_11
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_12
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_13
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_14
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
	100 * convert(float,NLALOCSUCC)/NULLIF(convert(float,NLALOCTOT),0) AS LOCUP_RAT,      
    100 * convert(float,NLALPESUCC)/NULLIF(convert(float,NLALPETOT),0) AS LOCUP_PERIODIC,      
	NLAPAG1LOTOT,
	NLAPAG2LOTOT,
	NLAPAG1RESUCC,
	NLAPAG2RESUCC,
	NLAPAGERR,
	NLALOCSSRFLT,
	NLALOCTOT,
	NLALOCSUCC,
	NLALOCPRRFLT,
	NLALNOTOT,
	NLALNOSUCC,
	NLALNNTOT,
	NLALNNSUCC,
	NLALIOTOT,
	NLALIOSUCC,
	NLALPETOT,
	NLALPESUCC,
	NLAL2ONTOT,
	NLAL2NOSUCC,
	NLAL2IOTOT,
	NLAL2OISUCC,
    NLLAREGSUB,
    NLLAATTSUB,
    NLASATSGS, 
    NLASUCCCSFB, 
    NLASUCCMOCSFB, 
    NTLAPAG1CSFB, 
    NLAUSREJCSFB, 
    NLADSUCCMOCSFB, 
    NLADSUCCCSFB, 
    NTLAPAG2CSFB, 
    NSLAPAG1CSFB, 
    NSLADPAGCSFB, 
    NLAUNSUCCCSFB, 
    NSLAPAG2CSFB 
FROM
    dc.DC_E_CNAXE_LOCAREAST_RAW_15
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---

