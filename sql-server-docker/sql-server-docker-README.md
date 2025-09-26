# SQL Server Development Environment

Dit docker-compose bestand biedt een lokale SQL Server instance voor development en testdoeleinden.

## Vereisten

- Docker Desktop geïnstalleerd (zie installatie-instructies hieronder)
- Minimaal 2GB RAM beschikbaar voor de container

## Docker Desktop Installatie

### Windows (Getest)

1. **Download Docker Desktop voor Windows:**
   - Ga naar https://docs.docker.com/desktop/install/windows-install/
   - Download "Docker Desktop for Windows"

2. **Installatie:**
   - Voer het gedownloade `.exe` bestand uit als administrator
   - Volg de installatie wizard
   - **Belangrijk:** Zorg ervoor dat "Use WSL 2 instead of Hyper-V" is aangevinkt (aanbevolen)
   - Herstart je computer na installatie

3. **Verificatie:**
   - Start Docker Desktop vanuit het Start menu
   - Open Command Prompt of PowerShell
   - Test de installatie: `docker --version`
   - Test docker-compose: `docker-compose --version`

4. **WSL 2 (Aanbevolen voor Windows):**
   - Installeer WSL 2 als je dit nog niet hebt: `wsl --install`
   - Docker Desktop zal automatisch WSL 2 gebruiken voor betere performance

### macOS (Niet getest, maar zou in principe hetzelfde moeten werken)

1. **Download Docker Desktop voor Mac:**
   - Ga naar https://docs.docker.com/desktop/install/mac-install/
   - Kies de juiste versie voor je processor:
     - **Intel chip:** Docker Desktop for Mac with Intel chip
     - **Apple silicon (M1/M2):** Docker Desktop for Mac with Apple chip

2. **Installatie:**
   - Open het gedownloade `.dmg` bestand
   - Sleep Docker naar je Applications folder
   - Start Docker Desktop vanuit Applications

3. **Verificatie:**
   - Open Terminal
   - Test de installatie: `docker --version`
   - Test docker-compose: `docker-compose --version`

4. **Mogelijke macOS specifieke overwegingen:**
   - Docker Desktop heeft toegang nodig tot bepaalde mappen
   - Je krijgt mogelijk verzoeken om toegang te verlenen via System Preferences > Security & Privacy

**⚠️ Opmerking voor macOS gebruikers:** Deze instructies zijn niet getest op macOS systemen. De stappen zouden in principe hetzelfde moeten werken, maar er kunnen kleine verschillen zijn. Bij problemen, raadpleeg de officiële Docker documentatie of neem contact op met een van de kenniscluster leden.

## Gebruik

### SQL Server starten

**⚠️ Belangrijk:** Voer alle docker-compose commando's uit vanuit de map waar het `docker-compose.yml` bestand staat.

```bash
# Navigeer naar de juiste map (pas het pad aan naar jouw situatie)
cd C:\pad\naar\jouw\KSE\repository

# Of als je al in de repository root bent:
cd sql-server-docker

# Start de services
docker-compose up -d

# Controleer of de containers draaien
docker-compose ps

# Bekijk de logs
docker-compose logs sqlserver
```

### Verbinding maken

**Connection String:**
```
Server=localhost,1433;Database=master;User Id=sa;Password=DevPassword123!;TrustServerCertificate=True;
```

**Parameters:**
- **Server:** localhost (of 127.0.0.1)
- **Port:** 1433
- **Username:** sa
- **Password:** DevPassword123!
- **Database:** master (standaard database)

### Database Management Tools

#### Adminer Web Interface (Inbegrepen)

Adminer is een web-gebaseerde database management tool die automatisch wordt gestart met de Docker containers.

**Toegang:** http://localhost:8080

**Inloggegevens:**
- **System:** Microsoft SQL Server
- **Server:** sqlserver
- **Username:** sa
- **Password:** DevPassword123!

**Wat kun je doen met Adminer:**
- ✅ **Databases aanmaken en beheren** - Nieuwe databases creëren, verwijderen en configureren
- ✅ **Tabellen ontwerpen** - Visueel tabellen maken, wijzigen en relaties definiëren
- ✅ **SQL queries uitvoeren** - Direct SQL commando's typen en resultaten bekijken
- ✅ **Data invoeren en bewerken** - Records toevoegen, wijzigen en verwijderen via een gebruiksvriendelijke interface
- ✅ **Database structuur bekijken** - Overzicht van alle tabellen, views, stored procedures
- ✅ **Data exporteren/importeren** - Backup maken of data laden vanuit CSV/SQL bestanden
- ✅ **Gebruikersbeheer** - Database gebruikers en rechten beheren

**Voordelen van Adminer:**
- Geen installatie nodig (draait in je browser)
- Werkt op alle besturingssystemen
- Lichtgewicht en snel
- Ondersteunt meerdere database types

#### SQL Server Management Studio (SSMS) - Aanbevolen voor gevorderd gebruik

Voor studenten die meer geavanceerde functionaliteit nodig hebben, is SQL Server Management Studio de professionele tool van Microsoft.

**Download:** https://docs.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms

**Verbindingsinstellingen voor SSMS:**
- **Server name:** localhost (of 127.0.0.1)
- **Authentication:** SQL Server Authentication
- **Login:** sa
- **Password:** DevPassword123!

**Wat kun je extra doen met SSMS:**
- ✅ **Geavanceerde query editor** - IntelliSense, syntax highlighting, execution plans
- ✅ **Stored procedures en functions** - Ontwikkelen en debuggen van complexe database logica
- ✅ **Database diagrammen** - Visuele representatie van database relaties
- ✅ **Performance monitoring** - Query performance analysis en optimalisatie
- ✅ **Backup/Restore wizard** - Gebruiksvriendelijke backup en herstel procedures
- ✅ **Database maintenance** - Index management, statistieken updates
- ✅ **Security management** - Geavanceerd gebruikers- en rechtenbeheer
- ✅ **Integration Services** - ETL processen en data migratie
- ✅ **Reporting Services** - Report ontwikkeling en beheer

**Wanneer SSMS gebruiken:**
- Complex database ontwerp
- Performance optimalisatie
- Professionele development workflows
- Geavanceerde SQL debugging
- Enterprise database beheer taken

### SQL Server stoppen

```bash
# Stop alle services
docker-compose down

# Stop en verwijder volumes (WAARSCHUWING: dit verwijdert alle data!)
docker-compose down -v
```

## Data Persistentie

- Database bestanden worden opgeslagen in een Docker volume `sqlserver_data`
- Backups kunnen geplaatst worden in de lokale `./sql-backups` map
- Data blijft behouden tussen container restarts

## Backup en Restore

### Backup maken
```sql
BACKUP DATABASE [YourDatabase] 
TO DISK = '/var/opt/mssql/backup/YourDatabase.bak'
```

### Restore vanuit backup
```sql
RESTORE DATABASE [YourDatabase] 
FROM DISK = '/var/opt/mssql/backup/YourDatabase.bak'
```

## Troubleshooting

### Container start niet
- Controleer of poort 1433 niet al in gebruik is
- Zorg ervoor dat Docker Desktop draait
- Controleer de logs: `docker-compose logs sqlserver`

### Kan geen verbinding maken
- Wacht 30-60 seconden na het starten (SQL Server heeft tijd nodig om op te starten)
- Controleer de health check: `docker-compose ps`
- Probeer verbinding te maken via Adminer web interface

### Performance problemen
- Verhoog de RAM toewijzing aan Docker Desktop
- Stop andere containers die veel resources gebruiken

## Beveiliging

⚠️ **BELANGRIJK:** Dit is bedoeld voor development/test omgevingen alleen!
- Het wachtwoord staat in plain text in het compose bestand
- Voor productie omgevingen gebruik environment files of secrets
- Verander het standaard SA wachtwoord voor productie gebruik

## Aangepaste Configuratie

Je kunt de volgende omgevingsvariabelen aanpassen in het docker-compose.yml bestand:
- `SA_PASSWORD`: Verander het SA wachtwoord (moet voldoen aan sterke wachtwoord vereisten)
- `MSSQL_COLLATION`: Verander de database collation
- Poort mapping: Verander `1433:1433` naar een andere lokale poort indien nodig