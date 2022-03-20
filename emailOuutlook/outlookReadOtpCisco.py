import win32com.client
import os
import time
import datetime
import pandas as pd
from playsound import playsound
passme = 'Is@t2020*'
passme = 'Ericsson123!'
passme = 'RnLI-dJbG4'
passme = 'T@O4iD8u3T'
passme = 'Is@T**2028'
passme = 'OXIrbae@8e'
passme = 'XKcTKVB0^5'
passme = 'Kk3+USau41'
passme = 'C+DW6veukn'
passme = 'G5+BXiXQbX'
passme = 'Ev4fU5mge-'
passme = 'WyL^j3Q8bh'
passme = 'C8r+jdt2zQ'
passme = 'X-7GChEQug'
passme = 'Eqn@buPK0g'
passme = 'Oc2csuh@Bz'
passme = 'LHSJdq5LE@'
passme = 'R-ClGZpRh5'
passme = 'MSr4beF-Ux'
passme = 'H^lduIp3sn'
passme = 'X^WsE5Uma9'

df=pd.DataFrame([passme])
df.to_clipboard(index=False,header=False)

oldBody = '---Nothing---'
print(datetime.datetime.now())
print(passme + '\n')
while True:
    input("Press any key to re paste pass...")
    print(datetime.datetime.now())
    df.to_clipboard(index=False,header=False)

# while True:
    # outlook=win32com.client.Dispatch("Outlook.Application").GetNameSpace("MAPI")
    # inbox=outlook.GetDefaultFolder(6) #Inbox default index value is 6
    # message=inbox.Items
    # message2=message.GetLast()
    # subject=message2.Subject
    # body=message2.body
    # date=message2.senton.date()
    # sender=message2.Sender
    # attachments=message2.Attachments

    # nowBody = 'Nothing'
    # state = 0

    # # os.system('C:\Program Files (x86)\Cisco\Cisco AnyConnect Secure Mobility Client\vpnui.exe')
    # for m in message:
        
        # if m.Subject=="Indosatooredoo Authentication Service Email to SMS Message":# here in my requirement i will change the dates
            
            # if state == 1 :
                
                # if  dateMax < m.SentOn:
                    # nowBody = m.body
                    # dateMax =  m.SentOn
            # if state == 0 :
                
                # nowBody = m.body
                # dateMax = m.SentOn
                # state = 1        
            
            

    # if nowBody != oldBody :
        # print('x-----------------x')
        # print(dateMax)
        # print('Token iD:')
        # print('9999' + nowBody[50:58])
        # print('o-----------------o')
        # oldBody = nowBody
        # df=pd.DataFrame(['9999'+nowBody[50:58]])
        # df.to_clipboard(index=False,header=False)
        # playsound('C:\Windows\media\Alarm03.wav')
    # time.sleep(1)

