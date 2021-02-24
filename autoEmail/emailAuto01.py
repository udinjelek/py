import smtplib, ssl
from email.mime.text import MIMEText
from email.mime.multipart import MIMEMultipart
from email.mime.image import MIMEImage
from email.mime.base import MIMEBase
from email import encoders 

from datetime import datetime, timedelta

dateUse = datetime.now()
dateUse = (dateUse.strftime("%Y%m%d"))

sender_email = "autosendmonster@gmail.com"
receiver_email = "ganip.xra@gmail.com"

message = MIMEMultipart("alternative")
message["Subject"] = "Data KPI Animal Kingdom " + dateUse
message["From"] = sender_email
message["To"] = receiver_email

# Create the plain-text and HTML version of your message
html = """\
<html>
	<body>
	<p> <br>Dear All
        <br>
        <br>Adalah Brikut Data dan Grafik dari Performance All KPI di Animal Kingdom selama 7 hari kebelakang
		<br><img src="cid:image1">
		<br><img src="cid:image2">
        <br><img src="cid:image3">
        <br>Sekian dan Terima kasih
        <br>
        <br>Best regard, 
        <br>Auto Mail Mechine
	</p>
	</body>
</html>
"""

text = """\
Jika Gambar Tidak tampil coba buka email ini dengan HTML format atau hubungi admin dari pengirim email. Terima Kasih"""

part1 = MIMEText(text, "plain")
part2 = MIMEText(html, "html")

# Add HTML dan plain-text via MIMEMultipart message
message.attach(part1)
message.attach(part2)

# Image Attach ke Body Email
for i in range(1 , 4):
    fp = open('E:/py/runExcel/myChart0'+str(i)+'.png', 'rb')
    msgImage = MIMEImage(fp.read())
    fp.close()
    # Define the image's ID as referenced above
    msgImage.add_header('Content-ID', '<image'+str(i)+'>')
    message.attach(msgImage)

# Atatch file ke email
filename = "masterMacro.xlsm"
attachment = open("E:/py/runExcel/" + filename, "rb") 
p = MIMEBase('application', 'octet-stream') 
p.set_payload((attachment).read()) 
encoders.encode_base64(p) 
p.add_header('Content-Disposition', "attachment; filename= %s" % filename) 
message.attach(p) 







































password = "passautosend"

# Create secure connection with server and send email
context = ssl.create_default_context()
with smtplib.SMTP_SSL("smtp.gmail.com", 465, context=context) as server:
	server.login(sender_email, password)
	server.sendmail(
		sender_email, receiver_email, message.as_string()
	)
	