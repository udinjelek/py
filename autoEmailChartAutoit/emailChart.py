

# ====================================================================================
import os

import webbrowser as wb
import time



os.system("taskkill /im chrome.exe /f")
url='http://10.17.16.99/reports/HW_SUBSCRIBER_MSC.php'
pathBrowser="C:\\Program Files\\Google\\Chrome\\Application\\chrome.exe"
wb.register('chrome', None,wb.BackgroundBrowser(pathBrowser))
wb.get('chrome').open(url,new= 1)
time.sleep(7)
os.system("capture.au3")
os.system("taskkill /im chrome.exe /f")

# ====================================================================================
from datetime import datetime, timedelta
from ftplib import FTP

dateUse = datetime.today() - timedelta(days=1)
dateUse = (dateUse.strftime("%Y%m%d"))


# ====================================================================================


import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart





smtp_server = "10.22.254.91"
port = 25  # For starttls
sender_email = "ranperfhs@huawei-services.com"
password = "ranperfhs*123"
receiver_email = "rizaq.prasetyo@ptnw.co.id"

message = MIMEMultipart("alternative")
message["Subject"] = "VLR Info " + dateUse + " Pagi"
message["From"] = sender_email
message["To"] = receiver_email

# Create the plain-text and HTML version of your message
text = """\ 
Hi,
html not work!! Sorry"""
html = htmlContentNow()

# Turn these into plain/html MIMEText objects
part1 = MIMEText(text, "plain")
part2 = MIMEText(html, "php")

# Add HTML/plain-text parts to MIMEMultipart message
# The email client will try to render the last part first
message.attach(part1)
message.attach(part2)

with open('GDIPlus_Image.jpg', 'rb') as f:
	# set attachment mime and file name, the image type is png
	mime = MIMEBase('image', 'png', filename='img1.png')
	# add required header data:
	mime.add_header('Content-Disposition', 'attachment', filename='GDIPlus_Image.jpg')
	mime.add_header('X-Attachment-Id', '0')
	mime.add_header('Content-ID', '<0>')
	# read attachment file content into the MIMEBase object
	mime.set_payload(f.read())
	# encode with base64
	encoders.encode_base64(mime)
	# add MIMEBase object to MIMEMultipart object
	message.attach(mime)
	
# Create a secure SSL context
context = ssl.create_default_context()

# Try to log in to server and send email
try:
	server = smtplib.SMTP(smtp_server,port)
	server.ehlo() # Can be omitted
	# server.starttls(context=context) # Secure the connection
	# server.ehlo() # Can be omitted
	server.login(sender_email, password)
	server.sendmail( sender_email, receiver_email, message.as_string())
except Exception as e:
	# Print any error messages to stdout
	print(e)
finally:
	server.quit() 
	
def htmlContentNow():
	html = """\
	<!DOCTYPE html>
	<html>

	<head>
	  <meta charset="utf-8">
	  <title>simple</title>
	  <meta name="generator" content="Google Web Designer 5.0.4.0226">
	  <style type="text/css" id="gwd-text-style">
		p {
		  margin: 0px;
		}
		h1 {
		  margin: 0px;
		}
		h2 {
		  margin: 0px;
		}
		h3 {
		  margin: 0px;
		}
	  </style>
	  <style type="text/css">
		html, body {
		  width: 100%;
		  height: 100%;
		  margin: 0px;
		}
		body {
		  background-color: transparent;
		  transform: perspective(1400px) matrix3d(1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1);
		  transform-style: preserve-3d;
		}
		.gwd-div-1tm0 {
		  position: absolute;
		  width: 197px;
		  left: 46px;
		  background-image: none;
		  height: 30px;
		  top: 33px;
		  background-color: rgb(7, 239, 140);
		}
		.gwd-p-oou9 {
		  position: absolute;
		  width: 219.797px;
		  font-family: Georgia;
		  height: 30px;
		  left: 84px;
		  top: 34px;
		}
		.gwd-div-1xuh {
		  position: absolute;
		  width: 100.203px;
		  background-image: none;
		  background-color: rgb(68, 188, 216);
		  height: 40px;
		  left: 1037px;
		  top: 26px;
		}
		.gwd-div-1lna {
		  position: absolute;
		  width: 102.203px;
		  background-image: none;
		  background-color: rgb(29, 132, 169);
		  height: 50px;
		  left: 1059px;
		  top: 17px;
		}
		.gwd-div-e0zv {
		  position: absolute;
		  width: 93.109px;
		  background-image: none;
		  background-color: rgb(12, 97, 128);
		  height: 60px;
		  left: 1092px;
		  top: 7px;
		}
		.gwd-div-1cbd {
		  position: absolute;
		  width: 911px;
		  height: 5px;
		  left: 20px;
		  top: 80px;
		  background-image: none;
		  background-color: rgb(40, 218, 68);
		}
		.gwd-div-dybx {
		  left: 22px;
		  top: 90px;
		  width: 1200px;
		}
		.gwd-img-5hl4 {
		  position: absolute;
		  left: 46px;
		  top: 117px;
		  width: 1115px;
		  height: 700px;
		}
		.gwd-div-1aqj {
		  width: 1205px;
		}
	  </style>
	</head>

	<body class="htmlNoPages">
	  <div class="gwd-div-1tm0"></div>
	  <h2 class="gwd-p-oou9">Data VLR</h2>
	  <div class="gwd-div-1xuh"></div>
	  <div class="gwd-div-1lna"></div>
	  <div class="gwd-div-e0zv"></div>
	  <div class="gwd-div-1cbd gwd-div-1aqj"></div>
	  <div class="gwd-div-1cbd gwd-div-dybx"></div>
	  <img class="gwd-img-5hl4 gwd-gen-qr9rgwdanimation" src="GDIPlus_Image.jpg">
	</body>

	</html>
	"""
	return html
