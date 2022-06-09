REM Start of script
REM Create text widget to display onscreen messaging
mode=CreateObject("roVideoMode")
registry = createobject("roRegistry")

rect1 = CreateObject("roRectangle", mode.GetSafeWidth()/4, mode.GetSafeHeight()/2, 500, 40)
rect2 = CreateObject("roRectangle", mode.GetSafeWidth()/4, mode.GetSafeHeight()/2+42, 500, 40)
text1 = CreateObject("roTextWidget", rect1, 1, 1, 0)
text2 = CreateObject("roTextWidget", rect2, 2, 1, 0)
text1.Show()
text2.Show()

text1.PushString("Enabling Web Server")
sleep(5000)

registrySection = CreateObject("roRegistrySection", "networking")
if type(registrySection) = "roRegistrySection" then 
' write web server enable
registrySection.Write("http_server", "80")
endif
registry.Flush()

text2.PushString("Web Server Enabled. Rebooting.")
sleep(10000)
DeleteFile("autorun.brs")
RebootSystem()

REM End of script
