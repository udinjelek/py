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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_01
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_02
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_03
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_04
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_05
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_06
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_07
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_08
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_09
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_10
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_11
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_12
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_13
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_14
	
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
	CODERASGN_NBSFRV1ANPTOT as NBSFRV1ANPTOT,
    CODERASGN_NBSFRV1ATOT as NBSFRV1ATOT,
    CODERASGN_NBSFRV1PTOT as NBSFRV1PTOT,
    CODERASGN_NBSFRV2ANPTOT as NBSFRV2ANPTOT,
    CODERASGN_NBSFRV2ATOT as NBSFRV2ATOT,
    CODERASGN_NBSFRV2PTOT as NBSFRV2PTOT,
    CODERASGN_NBSFRV3ANPTOT as NBSFRV3ANPTOT,
    CODERASGN_NBSFRV3ATOT as NBSFRV3ATOT,
    CODERASGN_NBSFRV3PTOT as NBSFRV3PTOT,
    CODERASGN_NBSHRV1ANPTOT as NBSHRV1ANPTOT,
    CODERASGN_NBSHRV1ATOT as NBSHRV1ATOT,
    CODERASGN_NBSHRV1PTOT as NBSHRV1PTOT,
    CODERASGN_NBSHRV2ANPTOT as NBSHRV2ANPTOT,
    CODERASGN_NBSHRV2ATOT as NBSHRV2ATOT,
    CODERASGN_NBSHRV2PTOT as NBSHRV2PTOT,
    CODERASGN_NBSHRV3ANPTOT as NBSHRV3ANPTOT,
    CODERASGN_NBSHRV3ATOT as NBSHRV3ATOT,
    CODERASGN_NBSHRV3PTOT as NBSHRV3PTOT,
    CODERASGN_NBSDFR5PRE as NBSDFR5PRE,
    CODERASGN_NBSDFRV5SUCC as NBSDFRV5SUCC,
    CODERASGN_NBNOFR5PFR5ASG as NBNOFR5PFR5ASG,
    CODERASGN_NBGSMHRASSUCC as NBGSMHRASSUCC,
    CODERASGN_NBGSMFRASSUCC as NBGSMFRASSUCC,
    CODERASGN_NBGSMEFRASSUCC as NBGSMEFRASSUCC,
    CODERASGN_NBFRAMRASSUCC as NBFRAMRASSUCC,
    CODERASGN_NBHRAMRASSUCC as NBHRAMRASSUCC,
    CODERASGN_NBFRWBAMRASSUCC as NBFRWBAMRASSUCC,
    CODERASGN_NBCLEARASSUCC as NBCLEARASSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_15
	
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---

