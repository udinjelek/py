import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart

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

smtp_server = "smtp.gmail.com"
port = 456  # For starttls
context = ssl.create_default_context()
sender_email = "autosendmonster@gmail.com"
password = "passautosend"
receiver_email = "rizaq.prasetyo@ptnw.co.id"
	
message = MIMEMultipart("alternative")
message["Subject"] = "multipart test"
message["From"] = sender_email
message["To"] = receiver_email

# Create the plain-text and HTML version of your message
text = """\ 
Hi,
html not work!! Sorry"""
html = htmlContentNow()

# Turn these into plain/html MIMEText objects
part1 = MIMEText(text, "plain")
part2 = MIMEText(html, "html")

# Add HTML/plain-text parts to MIMEMultipart message
# The email client will try to render the last part first
message.attach(part1)
message.attach(part2)

# Create a secure SSL context
context = ssl.create_default_context()

# Try to log in to server and send email
try:
	server = smtplib.SMTP(smtp_server,port,context=context)
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
	

