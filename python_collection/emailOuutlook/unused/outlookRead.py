import win32com.client
import os
import datetime

outlook=win32com.client.Dispatch("Outlook.Application").GetNameSpace("MAPI")
inbox=outlook.GetDefaultFolder(6) #Inbox default index value is 6
message=inbox.Items
message2=message.GetLast()
subject=message2.Subject
body=message2.body
date=message2.senton.date()
sender=message2.Sender
attachments=message2.Attachments

dateMax = datetime.datetime.now()
nowBody = 'Nothing'

os.system('C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe')
for m in message:
    if m.Subject=="Indosatooredoo Authentication Service Email to SMS Message":# here in my requirement i will change the dates
        print(m.ReceivedTime)
        if dateMax < m.ReceivedTime.replace(tzinfo=None):
            nowBody = m.body
            datemax = date

print(nowBody)