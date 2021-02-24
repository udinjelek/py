import yagmail

receiver = "rizaq.prasetyo@ptnw.co.id"
body = "Hello there from Yagmail"
filename = "document.pdf"

yag = yagmail.SMTP("autosendmonster@gmail.com")
yag.send(
	to=receiver,
	subject="Yagmail test with attachment",
	contents=body, 
	# attachments=filename,
)