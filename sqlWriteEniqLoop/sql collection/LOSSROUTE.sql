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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_01
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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_02
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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_03
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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_04
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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_05
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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_06
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
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_07
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_08
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_09
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_10
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_11
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_12
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_13
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_14
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
	PERIOD_DURATION AS CFAIL,
	NDEV,
	BLOL,
	TRAL,
	NCALLS,
	NOVERFLOW,
	NTRALACC,
	NBLOCACC,
	NSCAN,
	NANSW,
	MBLOL,
	OBLOL,
	ABLOL,
	NMBLOCACC,
	NOBLOCACC,
	NABLOCACC
FROM
    dc.DC_E_CNAXE_LOSSROUTE_RAW_15
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---

