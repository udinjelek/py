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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_01
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_02
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_03
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_04
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_05
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_06
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_07
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_08
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_09
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_10
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_11
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_12
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_13
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_14
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
	100 * (convert(float,NTRALACCI) + convert(float,NTRALACCO))/NULLIF(convert(float,NSCAN) * (convert(float,NDEV) - convert(float,BLOL)), 0) AS TRUNK_UTIL,    
    100 * convert(float,NOVERFLOWO)/NULLIF(convert(float,NCALLSO), 0) AS ROUT_CONG_RAT,     
    100 * convert(float,NANSWERSO)/NULLIF(convert(float,NCALLSO), 0) AS ASR_OUT,     
   100 * convert(float,NANSWERSI)/NULLIF(convert(float,NCALLSI), 0) AS  ASR_IN,     
   100 * (convert(float,NANSWERSO)+convert(float,NANSWERSI))/NULLIF((convert(float,NCALLSO)+convert(float,NCALLSI)), 0) AS  ASR,         100 * convert(float,NOSEIZ)/NULLIF(convert(float,NCALLSO), 0) AS SEIZ_BR,     
    convert(float,NTRALACCO)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_OUT,     
    convert(float,NTRALACCI)/NULLIF(convert(float,NSCAN), 0) AS TRAFF_IN,     
    (convert(float,NTRALACCO) + convert(float,NTRALACCI))/NULLIF(convert(float,NSCAN), 0) AS TRAFF_TOT,    
    (convert(float,NTRALACCI) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSI),0) AS MHT_IN,    
    (convert(float,NTRALACCO) /nullif(convert(float,NSCAN),0))*convert(float,PERIOD_DURATION)*60/nullif(convert(float,NCALLSO)-convert(float,NOVERFLOWO),0) AS MHT_OUT,		    
	NDEV,
	BLOL,
	TRALI,
	NCALLSI,
	NOVERFLOWI,
	NANSWERSI,
	NRESTRICTI,
	NTRALACCI,
	TRALO,
	NCALLSO,
	NOVERFLOWO,
	NANSWERSO,
	NRESTRICTO,
	BBLOL,
	NTRALACCO,
	NBLOCACC,
	NBBLOCACC,
	NSCAN,
	NSEMIPERCI,
	NSEMIPERCO,
	NC7DSEIZ,
	NOSEIZ,
	NDSEIZ,
	NISUPATPI,
	NISUPATPO,
	RESTRDEVCNT,
	THROUGHRTECNT,
	LASTCONGCNT
FROM
    dc.DC_E_CNAXE_TRUNKROUTE_RAW_15
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- End ---

