# Kenniscluster Software Engineering (KSE)

## Overzicht

Deze repository bevat richtlijnen, uitleg en documentatie voor diverse software engineering gerelateerde aangelegenheden in het onderwijs. Het Kenniscluster Software Engineering verzamelt hier kennis en best practices.

## Inhoudsopgave

### Voorbeelden en Tutorials in deze repository

| Map                                                    | Beschrijving                                                 |
| ------------------------------------------------------ | ------------------------------------------------------------ |
| 📝 [add-swagger-to-net-api](./add-swagger-to-net-api)   | Tutorial over het toevoegen van Swagger/OpenAPI documentatie aan een .NET 9 Web API. Verklaart het verschil tussen OpenAPI (specificatie) en Swagger (toolset), demonstreert Swashbuckle implementatie en legt belangrijke wijzigingen tussen .NET 8 en .NET 9 uit. Inclusief praktische voorbeelden voor automatische API-documentatie en interactieve testing. |
| 🐳 [sql-server-docker](./sql-server-docker)             | Complete SQL Server ontwikkelomgeving met Docker. Bevat een Docker Compose setup voor lokale SQL Server instantie met Adminer web interface voor databasebeheer. Perfect voor studenten en docenten die een consistente database omgeving nodig hebben zonder lokale SQL Server installatie. |
| 🗄️ [sql-server-install](./sql-server-install)           | Installatiehandleiding voor Microsoft SQL Server 2019 op Windows 11 desktop. Stap-voor-stap instructies vanaf download via Azure Portal (Student Benefits) tot complete configuratie. Inclusief SSMS installatie, post-configuratie, validatie en troubleshooting. Perfect voor studenten die een lokale SQL Server ontwikkelomgeving nodig hebben. |
| 🗄️ [sql-server-2025-install](./sql-server-2025-install) | Installatiehandleiding voor Microsoft SQL Server 2025 op Windows 11 desktop. Stap-voor-stap instructies vanaf download via tot complete configuratie. Inclusief SSMS installatie, post-configuratie, validatie en troubleshooting. Perfect voor studenten die een lokale SQL Server ontwikkelomgeving nodig hebben. Let op: Deze is nog development |
| 💻 [visualstudio-install](./visualstudio-install)       | Installatiehandleiding voor Visual Studio 2022 Enterprise op Windows 11. Stap-voor-stap instructies vanaf download via Azure Portal (Student Benefits) tot workload selectie. Inclusief uitleg over .NET 9.0 vs .NET Framework, workloads voor desktop/web/mobile development en SQL Server integratie. Perfect voor studenten die een professionele .NET ontwikkelomgeving nodig hebben. |
| 🍕 [voorbeeld-database](./voorbeeld-database)           | Pizzafabriek oefendatabase voor SQL Server. Een complete database met 9 tabellen, realistische data, views en stored procedures. Bevat pizza's, ingrediënten, bestellingen, klanten en medewerkers. Inclusief 50+ voorbeeld queries van basis tot gevorderd niveau en 15 oefenopgaven voor studenten. Perfect voor het leren en oefenen van SQL queries, JOINs, aggregaties en database concepten. |
| [markdown-demo](./markdown-demo)                       | Bevat momenteel een presentatie en readme om een start te kunnen maken met markdown. |


### Voorbeelden en Tutorials in andere repositories

| Repository | Beschrijving |
|------------|--------------|
| ⚙️ [ansible-demo](https://github.com/ZuydUniversity/ansible-demo) | Ansible automatiseringstool demonstratie met Azure integratie. Toont hoe je virtuele machines kunt beheren en configureren met Ansible playbooks, inclusief Azure credentials setup en SSH configuratie. Perfect voor Infrastructure as Code (IaC) leren. **Note: Repository is gearchiveerd op 2 oktober 2025** 📦 |
| 🌐 [API_example_dotnet_todolist](https://github.com/ZuydUniversity/API_example_dotnet_todolist) | Complete .NET 9.0 API tutorial met ToDoList applicatie. Demonstreert gelaagde architectuur, CRUD operaties, Swagger documentatie, HTTP status codes en authenticatie. Inclusief stap-voor-stap instructies voor het bouwen van een professionele web API vanaf een console applicatie. |
| 🚗 [AutoGarageFormatief](https://github.com/ZuydUniversity/AutoGarageFormatief) | Formatieve C# .NET 9.0 opdracht voor het testen van OOP voorkennis. Een complete garage management systeem dat classes, inheritance, polymorphisme, encapsulation en data access layers demonstreert. Inclusief class diagrams, use case diagrammen en SQL database implementatie. Perfect voor studenten die hun OOP kennis willen valideren. |
| 🃏 [CardgameWar](https://github.com/ZuydUniversity/CardgameWar) | C# .NET Core voorbeeldproject van het kaartspel "Oorlog". Demonstreert een volledige softwareontwerp- en realisatiecyclus, inclusief requirements, UML-diagrammen (klasse, use case, sequentie), en een gelaagde architectuur met een WinForms UI en SQL Server database. Bevat verdiepingsopdrachten voor OOP en database-interactie. |
| 🐳 [docker-demo](https://github.com/ZuydUniversity/docker-demo) | Uitgebreide Docker tutorial met praktische voorbeelden. Bevat uitleg over Docker concepten, basis commando's, Dockerfile structuur, Docker Compose en Python/Flask integratie. Ideaal voor studenten die containerization willen leren met hands-on voorbeelden en best practices. **Note: Repository is gearchiveerd op 2 oktober 2025** 📦 |
| 🔷 [Polymorfisme](https://github.com/ZuydUniversity/Polymorfisme) | C# voorbeeld project dat polymorfisme demonstreert, een van de fundamentele eigenschappen van Object-Oriented Programming. Toont abstracte klassen, concrete implementaties en hoe één interface verschillende gedragingen kan vertonen. Inclusief praktische voorbeelden met geometrische vormen en een class diagram voor visuele uitleg. |
| 🔒 [SecuritySQLInjectionExample](https://github.com/ZuydUniversity/SecuritySQLInjectionExample) | Security tutorial over SQL injection aanvallen en beschermingsmaatregelen. Demonstreert kwetsbare code voorbeelden en veilige implementaties om studenten te leren over web application security en secure coding practices. Inclusief C# en T-SQL voorbeelden met database setup scripts. |



## Structuur

Elk onderwerp wordt behandeld in een eigen submap met:
- Gedetailleerde uitleg en documentatie
- Praktische voorbeelden
- Stap-voor-stap instructies
- Best practices en aanbevelingen

## Leden van het Kenniscluster

Het Kenniscluster Software Engineering bestaat uit de volgende leden:

- **Björn Amkreutz** - bjorn.amkreutz [at] zuyd [dot] nl
- **Rob Cilissen-Grassere** - rob.cilissen-grassere [at] zuyd [dot] nl
- **Marcel Claus** - marcel.claus [at] zuyd [dot] nl
- **Viktor Donovic** - viktor.donovic [at] zuyd [dot] nl
- **Nicky Jaspers** - nicky.jaspers [at] zuyd [dot] nl
- **Roy Mengelers** - roy.mengelers [at] zuyd [dot] nl
- **Miel Noelanders** - miel.noelanders [at] zuyd [dot] nl
- **Rick Warnecke** - rick.warnecke [at] zuyd [dot] nl

## Bijdragen

Leden van het kenniscluster kunnen bijdragen door:
1. Nieuwe documentatie toe te voegen in relevante submappen
2. Bestaande documentatie bij te werken en te verbeteren
3. Voorbeelden en praktische cases te delen
4. Feedback te geven op bestaande content

### Werkwijze met branches en pull requests

Voor het toevoegen of wijzigen van content werken we met **feature branches** en **pull requests** naar de `main` branch. Dit zorgt voor kwaliteitscontrole en consistentie in de repository.

**Automatische kwaliteitscontroles**

Bij elke pull request naar `main` worden automatisch de volgende structuurregels gecontroleerd:

1. **Mapnamen**: Alle top-level mappen moeten lowercase zijn en `-` (hyphens) als scheidingsteken gebruiken. Geen spaties of underscores toegestaan.
   - ✅ Correct: `add-swagger-to-net-api`
   - ❌ Fout: `Add Swagger to NET API`, `add_swagger_to_net_api`

2. **README.md per map**: Elke map moet een `README.md` bestand bevatten met inhoudelijke tekst (niet leeg).

3. **Documentatie in hoofdREADME**: Elke map moet gedocumenteerd zijn in de sectie "Voorbeelden en Tutorials in deze repository" van de hoofd-README.md met een link naar de map.

De pipeline zal de PR blokkeren als aan deze regels niet wordt voldaan. Dit zorgt ervoor dat de repository gestructureerd en goed gedocumenteerd blijft.



Voor vragen of suggesties kun je contact opnemen met een van de bovenstaande leden van het kenniscluster.
