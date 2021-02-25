import urllib.request 
from datetime import datetime, timedelta
dateUse = datetime.today() - timedelta(days=0)
dateUse = (dateUse.strftime("%Y%m%d"))

headerPath = "http://osspm.indosatooredoo.com:8080/proptima/scheduled_reports/Putut_Purnama/RAW_DATA_DB_DAILY/"
urllib.request.urlretrieve(headerPath + dateUse + "/" +  dateUse +"_KALSPP_REGIONAL_Level_Dashboard_Raw.csv", "../a.csv")
# outpul would be like http://osspm.indosatooredoo.com:8080/proptima/scheduled_reports/Putut_Purnama/RAW_DATA_DB_DAILY/20200120/20200120_KALSPP_REGIONAL_Level_Dashboard_Raw.csv