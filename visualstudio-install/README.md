# Handleiding: Installatie Visual Studio 2026

> **Let op:** De installatiehandleiding voor Visual Studio 2022 is deprecated. We gebruiken voortaan Visual Studio 2026; volg daarom de instructies op deze pagina.

## Introductie

Deze handleiding beschrijft de installatie van Visual Studio 2026 op **Windows 11**.

## Systeemvereisten

Controleer voor de installatie de actuele [systeemvereisten van Visual Studio](https://visualstudio.microsoft.com/vs/system-requirements/). Houd rekening met voldoende vrije schijfruimte: de benodigde ruimte hangt af van de workloads die je installeert.

- **Besturingssysteem:** Windows 11 (64-bit)
- **RAM:** Minimaal 8 GB; 16 GB of meer wordt aanbevolen
- **Internetverbinding:** Vereist voor downloaden, installatie en aanmelden

## Belangrijke opmerking bij SQL Server

Als je voor je vakken ook SQL Server nodig hebt, installeer dan **eerst SQL Server** en daarna Visual Studio.

Zie de [SQL Server installatiehandleiding](../sql-server-install/README.md) voor meer informatie.

## Visual Studio 2026 downloaden

1. Ga naar de officiële [Visual Studio-downloadpagina](https://visualstudio.microsoft.com/downloads/).
2. Download de Visual Studio Installer en start het installatiebestand.
3. Kies de editie waarvoor je een licentie hebt. Gebruik Enterprise alleen als deze editie beschikbaar is via de onderwijsinstelling of je studentenaccount; anders kun je voor onderwijsdoeleinden de Community-editie gebruiken.
4. Meld je eventueel aan met je studentenaccount om beschikbare onderwijslicenties te controleren.

## Workloads installeren

Selecteer in de Visual Studio Installer de workloads die je nodig hebt. Welke workloads nodig zijn, hangt af van de vakken die je volgt.

### Console- en Windows Forms-applicaties

- **.NET desktop development**
- **Data storage and processing** (als je SQL Server-tools vanuit Visual Studio nodig hebt)

### Webapplicaties

- **ASP.NET and web development**
- **Data storage and processing** (als je SQL Server-tools vanuit Visual Studio nodig hebt)

### Mobiele applicaties

- **.NET Multi-platform App UI development**
- **Data storage and processing** (als je SQL Server-tools vanuit Visual Studio nodig hebt)

## Installatiestappen

1. Open de Visual Studio Installer.
2. Selecteer de gewenste Visual Studio-editie en klik op **Install**.
3. Selecteer de workloads die je nodig hebt.
4. Controleer de installatiekeuzes en klik op **Install**.
5. Wacht tot de installatie is voltooid. Dit kan enige tijd duren.
6. Start Visual Studio 2026 en meld je aan met je account.
7. Volg eventuele licentie-instructies die bij jouw editie horen.

## .NET Framework en .NET

**.NET Framework** is de oudere Windows-only technologie. Het moderne **.NET** is cross-platform en wordt actief doorontwikkeld. Gebruik voor nieuwe projecten het .NET-framework dat in de opdracht of het lesmateriaal wordt genoemd.

In deze repository staan ook voorbeelden voor **.NET 9**. Als je zo'n project bouwt en de .NET 9 SDK niet op je computer staat, installeer die dan naast Visual Studio via de officiële [.NET-downloadpagina](https://dotnet.microsoft.com/download/dotnet/9.0). Visual Studio 2026 kan ook worden gebruikt voor projecten die een nieuwere .NET-versie vereisen.

## Na de installatie

Bij de eerste keer opstarten kun je je ontwikkelomgeving verder configureren, bijvoorbeeld het thema en de toetsenbordsnelkoppelingen. Controleer ook of de benodigde .NET SDK voor je opdracht is geïnstalleerd.

## Problemen?

Neem bij installatieproblemen contact op met de docent.
