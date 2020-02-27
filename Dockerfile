FROM mcr.microsoft.com/powershell:preview


MAINTAINER Darshan Marathe

#Install Chocolatey
RUN powershell.exe -Command Set-ExecutionPolicy Bypass -Scope Process -Force; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

# Install Microsoft Visual C++ Redistributable for Visual Studio 2017, URLRewrite Module and SQL Server CMD Utilities (BCP)
# RUN choco.exe install sqlserver-cmdlineutils -y
RUN choco.exe install vim -y
RUN choco.exe install nodejs  -y 



WORKDIR c:/src

COPY . c:/src


RUN npm install

VOLUME c:/src/data

CMD ["node", "index.js"]
