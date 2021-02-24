---=======================
--------------- xxx
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
	BSCSTAT_NBSTRHRTOT AS NBSTRHRTOT,
	BSCSTAT_NBSTSHRTOT AS NBSTSHRTOT,
	BSCSTAT_NBSTIHBSUCC AS NBSTIHBSUCC,
	BSCSTAT_NBSTOHBSUCC AS NBSTOHBSUCC,
	BSCSTAT_NBSTRHPTOT AS NBSTRHPTOT,
	BSCSTAT_NBSTRRMTOT AS NBSTRRMTOT,
	BSCSTAT_NBSPCHACMTOT AS NBSPCHACMTOT,
	BSCSTAT_NBSPCHAFMTOT AS NBSPCHAFMTOT,
	BSCSTAT_NBSPCHAFSWTOT AS NBSPCHAFSWTOT,
	BSCSTAT_NBSPEHNDTOT AS NBSPEHNDTOT,
	BSCSTAT_NBSFRTOT AS NBSFRTOT,
	BSCSTAT_NBSFRFRSUCC AS NBSFRFRSUCC,
	BSCSTAT_NBSHRTOT AS NBSHRTOT,
	BSCSTAT_NBSHRHRSUCC AS NBSHRHRSUCC,
	BSCSTAT_NBSDFRTOT AS NBSDFRTOT,
	BSCSTAT_NBSDFRFRSUCC AS NBSDFRFRSUCC,
	BSCSTAT_NBSDFRHRSUCC AS NBSDFRHRSUCC,
	BSCSTAT_NBSDHRTOT AS NBSDHRTOT,
	BSCSTAT_NBSDHRFRSUCC AS NBSDHRFRSUCC,
	BSCSTAT_NBSDHRHRSUCC AS NBSDHRHRSUCC,
	BSCSTAT_NBSDTOT AS NBSDTOT,
	BSCSTAT_NBSDFRSUCC AS NBSDFRSUCC,
	BSCSTAT_NBSDHRSUCC AS NBSDHRSUCC,
	BSCSTAT_NBSMSLTOT AS NBSMSLTOT,
	BSCSTAT_NBSMSLSUCC AS NBSMSLSUCC,
	BSCSTAT_NBSTSMITTOT AS NBSTSMITTOT,
	BSCSTAT_NBSCOINSNTTOT AS NBSCOINSNTTOT,
	BSCSTAT_NBSCOINRCVSUCC AS NBSCOINRCVSUCC,
	BSCSTAT_NBSTSUGHRTOT AS NBSTSUGHRTOT,
	BSCSTAT_NBSTIUGHBSUCC AS NBSTIUGHBSUCC
FROM
    dc.DC_E_CNAXE_BSC_RAW_xxx
---------------	
	WHERE DATETIME_ID >= (SELECT S_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND DATETIME_ID<(SELECT E_TIME FROM dcpublic.T_TIME_TRANSFER_D1) 
	AND PERIOD_DURATION=60 
	AND (ELEM LIKE 'M%' OR ELEM LIKE 'T%' OR ELEM LIKE 'H%') 
	AND ROWSTATUS!='DUPLICATE' 
	AND ROWSTATUS!='SUSPECTED'
	
--- x-x ---
