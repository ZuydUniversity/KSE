# Handleiding: Installatie Visual Studio 2022

## Introductie
Deze handleiding beschrijft de installatie van Visual Studio 2022 op **Windows 11**. Hoewel inmiddels Visual Studio 2026 beschikbaar is, werken wij in onze lesmaterialen voorlopig nog met Visual Studio 2022.

## Systeemvereisten

Voordat je begint met de installatie, controleer of je systeem voldoet aan de volgende minimale vereisten:

- **Besturingssysteem:** Windows 11 (64-bit)
- **Processor:** Quad-core processor of beter
- **RAM:** Minimaal 8 GB (16 GB aanbevolen)
- **Schijfruimte:** Minimaal 20-50 GB vrije ruimte (afhankelijk van geïnstalleerde workloads)
- **Internetverbinding:** Vereist voor installatie en activatie

## Belangrijke opmerking bij SQL Server
Als je voor je vakken ook SQL Server nodig hebt, installeer dan **eerst SQL Server** voordat je Visual Studio installeert. Dit voorkomt mogelijke conflicten tussen de twee producten.

Zie de [SQL Server installatiehandleiding](../sql-server-install/README.md) voor meer informatie.

## Downloaden van Visual Studio 2022

### Azure for Students
1. Ga naar de [Azure Portal](https://portal.azure.com)
2. Activeer je **Azure for Students** benefits met je studentenaccount (https://azure.microsoft.com/en-us/free/students) als je dat nog niet hebt gedaan.
3. Navigeer naar Education → Software
4. Zoek naar Visual Studio 2022
5. Download bij voorkeur de **Enterprise Licentie** - deze is gratis beschikbaar voor studenten

## Workloads installeren

Tijdens de installatie moet je specifieke workloads selecteren. Welke workloads je nodig hebt, hangt af van de vakken die je volgt:

### Voor Console en Windows Forms applicaties
Installeer de volgende workloads:
- **.NET desktop development**
- **Data storage and processing**

### Voor Web applicaties
Installeer de volgende workload:
- **ASP.NET and web development**
- **Data storage and processing**

### Voor mobiele applicaties
Installeer de volgende workload:
- **.NET Multi-platform App UI development**
- **Data storage and processing**

## Installatiestappen

1. Start het gedownloade installatiebestand
2. De Visual Studio Installer wordt geopend
3. Selecteer de workloads die je nodig hebt (zie bovenstaande lijst)
4. Klik op **Install**
5. Wacht tot de installatie voltooid is (dit kan enige tijd duren)
6. Start Visual Studio 2022 op
7. Log in met je studentenaccount om je Enterprise licentie te activeren

## Na de installatie
Bij de eerste keer opstarten kun je je ontwikkelingsomgeving verder configureren naar eigen voorkeur (thema, shortcuts, etc.).

## Problemen?
Neem bij installatieproblemen contact op met de docent.

## .NET Framework vs .NET

In onze lessen werken we met **.NET 9.0** (voorheen .NET Core genoemd). Het is belangrijk om het verschil te begrijpen tussen .NET Framework en het moderne .NET:

### .NET Framework
- Oudere technologie die alleen op Windows werkt
- Wordt niet meer actief doorontwikkeld met nieuwe features
- Blijft ondersteund voor bestaande applicaties

### .NET (voorheen .NET Core)
- Moderne, cross-platform technologie (Windows, macOS, Linux)
- Actief in ontwikkeling met regelmatige updates
- Betere performance en meer moderne features
- **Wij gebruiken versie 9.0** - dit is de versie die compatibel is met Visual Studio 2022

**Let op:** .NET 10 is beschikbaar voor Visual Studio 2026. Wij blijven voorlopig werken met .NET 9.0 in combinatie met Visual Studio 2022.

### Aanbeveling
Wij bevelen sterk aan om met .NET te werken. Dit is de toekomst van .NET ontwikkeling en biedt veel voordelen op het gebied van performance, cross-platform ondersteuning en moderne features.