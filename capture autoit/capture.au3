#include <ScreenCapture.au3>

; Example()

; Func Example()
    ; Local $hGUI

    ; ; Create GUI
    ; $hGUI = GUICreate("Screen Capture", 400, 300)
    ; GUISetState(@SW_SHOW)
    ; Sleep(250)

    ; ; Capture window
    ; _ScreenCapture_CaptureWnd(@MyDocumentsDir & "\GDIPlus_Image.jpg", $hGUI)

    ; ShellExecute(@MyDocumentsDir & "\GDIPlus_Image.jpg")
; EndFunc   ;==>Example


; _ScreenCapture_Capture(@MyDocumentsDir & "\GDIPlus_Image.jpg", 0,0,100,100)

 _ScreenCapture_Capture( "GDIPlus_Image.jpg", 5, 110, 1230, 810)