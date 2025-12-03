
FROM mcr.microsoft.com/windows/nanoserver:ltsc2019
ARG POWERSHELL_VERSION="7.5.0"
ARG POWERSHELL_ZIP_URL="https://github.com/PowerShell/PowerShell/releases/download/v${POWERSHELL_VERSION}/PowerShell-${POWERSHELL_VERSION}-win-x64.zip"

WORKDIR /temp

# Download and extract PowerShell Core
RUN powershell.exe -Command `
    Invoke-WebRequest -Uri ${POWERSHELL_ZIP_URL} -OutFile powershell.zip; `
    Expand-Archive -Path powershell.zip -DestinationPath C:\PowerShell; `
    Remove-Item powershell.zip

# Add PowerShell to the system PATH
ENV PATH="C:\\PowerShell;${PATH}"

SHELL ["powershell", "-Command", "$ErrorActionPreference = 'Stop'; $ProgressPreference = 'SilentlyContinue';"]
CMD ["Get-Process"]
