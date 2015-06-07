%SystemRoot%\Microsoft.NET\Framework\v4.0.30319\installutil.exe IMWSService.exe
Net Start IMServerService
sc config IMServerService start= auto
pause