
FROM mcr.microsoft.com/windows/nanoserver:ltsc2019
SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
CMD ["Get-Process"]