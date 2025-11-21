# Installatiehandleiding Microsoft SQL Server (Windows 11 Desktop)

Tip: indien je ook Visual Studio moet installeren, installeer dan altijd eerst SQL Server!
Tip: voor gevorderde gebruiker met kennis van Docker: [zie SQL Server Docker installatiehandleiding](../sql-server-docker/README.md)

## 1. Edities
- Standard 2019 (aanbevolen voor studenten; beschikbaar via Azure Portal na activatie Azure for Students / Student Benefits)
- Developer (gratis voor ontwikkel/test, alternatief indien Standard licentie tijdelijk niet beschikbaar)
- Enterprise (alleen indien specifiek vereist, eveneens via Azure Portal)

Let op: SQL Server 2022 en 2025 vereisen aanvullende registratie; daarom adviseren we voor dit traject SQL Server 2019 Standard.

## 2. Systeemvereisten (Windows 11)
- Windows 11 (64-bit) met laatste updates
- Minimaal 8 GB RAM (aanbevolen 16 GB)
- ≥ 10 GB vrije schijfruimte (meer voor databestanden en backups)
- Administratorrechten
- Poort TCP 1433 alleen openen indien externe toegang nodig
- .NET Framework onderdelen worden door setup toegevoegd indien nodig

## 3. Download
1. Activeer Azure for Students (https://azure.microsoft.com/nl-nl/free/students) en log in op https://portal.azure.com.
2. Ga naar Education (of Software sectie) en zoek naar SQL Server 2019 (Standard) – download ISO.
3. Alternatief: Developer editie via https://www.microsoft.com/sql-server (indien Standard niet beschikbaar).
4. Download SQL Server Management Studio (SSMS): https://aka.ms/ssms

## 4. Start installer
- ISO (2019 Standard/Enterprise): Rechtsklik ISO > Mount > start setup.exe.
- Developer web-installer (indien gebruikt): SQLServer2019-SSEI-Dev.exe (kies Custom of Download Media).

## 5. Wizard stappen (setup.exe)
1. Installation > New SQL Server stand-alone installation.
2. Product Key: Standard/Enterprise sleutel vanuit Azure Portal; Developer automatisch ingevuld.
3. License Terms accepteren.
4. Microsoft Update inschakelen (aanbevolen).
5. Install Rules: los fouten (rood) op; waarschuwingen (geel) noteren.
6. Feature Selection:
   - Database Engine Services (minimaal)
   - Client Tools Connectivity (aan)
7. Instance Configuration:
   - Default instance (MSSQLSERVER) volstaat;
8. Server Configuration:
   - Laat standaard service accounts staan (NT SERVICE\...);
   - Collation standaard behouden.
9. Database Engine Configuration:
   - Authentication: Windows authentication.
   - Add Current User voor sysadmin.
   - Data Directories eventueel naar aparte SSD.
   - TempDB: standaard ok; 
10. Filestream uit laten.
11. Ready to Install controleren en Install.
12. Wachten tot voltooiing; instance name noteren.

## 6. Post-installatie
1. Installeer SSMS.
2. Verbind met localhost of localhost\InstanceName.
3. Test login (Windows, of sa bij Mixed Mode).


## 7. Validatie
- Services.msc: SQL Server (MSSQLSERVER of gekozen instance) draait.
- SSMS: SELECT name FROM sys.databases; toont system + DemoDB.

## 8. Veelvoorkomende issues
- Antivirus blokkeert bestanden: tijdelijke uitzondering toevoegen.
- Poortconflict: wijzig poort via SQL Server Configuration Manager (TCP/IP > IPAll > TCP Port).

