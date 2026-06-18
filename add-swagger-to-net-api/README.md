# Swagger/OpenAPI in .NET 9 Web API

Dit project demonstreert hoe je API-documentatie toevoegt aan een .NET 9 Web API en legt het verschil uit tussen OpenAPI en Swagger, evenals de belangrijkste wijzigingen tussen .NET 8 en .NET 9.

## Projectopzet

Dit is een .NET 9 Web API project met:
- **Framework**: .NET 9.0
- **Controller**: `WeatherForecastController` met een GET endpoint
- **Configuratie**: Swashbuckle voor Swagger UI en OpenAPI specificatie

## OpenAPI vs Swagger - Wat is het Verschil?

### OpenAPI = De Specificatie

**OpenAPI** is een **standaard specificatie** voor het beschrijven van REST APIs:
- Voorheen bekend als "Swagger Specification"
- Beheerd door de OpenAPI Initiative (Linux Foundation)
- Huidige versie: OpenAPI 3.1
- Een gestandaardiseerd **JSON/YAML formaat** voor API-documentatie

**Voorbeeld van een OpenAPI document**:
```json
{
  "openapi": "3.0.1",
  "info": {
    "title": "DotNet9WebAPI",
    "version": "1.0"
  },
  "paths": {
    "/WeatherForecast": {
      "get": {
        "tags": ["WeatherForecast"],
        "operationId": "GetWeatherForecast",
        "responses": {
          "200": {
            "description": "Success"
          }
        }
      }
    }
  }
}
```

### Swagger = De Toolset

**Swagger** is een **verzameling tools** voor het werken met OpenAPI:
- **Swagger UI**: Interactieve webinterface voor API-documentatie
- **Swagger Editor**: Editor voor het schrijven van OpenAPI specificaties
- **Swagger Codegen**: Genereert client/server code uit OpenAPI specs

### Samenvatting
- **OpenAPI** = De specificatie/standaard
- **Swagger** = Tools om met die specificatie te werken

## .NET 8 vs .NET 9 - Belangrijkste Verschillen

### .NET 8 Aanpak

In .NET 8 gebruikte je **Swashbuckle.AspNetCore** (third-party package):

```csharp
// Program.cs
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
```

### .NET 9 Aanpak

.NET 9 introduceert **native OpenAPI ondersteuning** van Microsoft:

```csharp
// Program.cs
builder.Services.AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
```

### Vergelijkingstabel

| Aspect | .NET 8 (Swashbuckle) | .NET 9 (Native OpenAPI) |
|--------|---------------------|------------------------|
| **Provider** | Third-party | Microsoft (officieel) |
| **Package** | `Swashbuckle.AspNetCore` | `Microsoft.AspNetCore.OpenApi` |
| **Service** | `AddSwaggerGen()` | `AddOpenApi()` |
| **Middleware** | `UseSwagger()` + `UseSwaggerUI()` | `MapOpenApi()` |
| **UI included** | ✅ Ja (Swagger UI) | ❌ Nee (alleen spec) |
| **Endpoint** | `/swagger` | `/openapi/v1.json` |
| **Performance** | Goed | Beter |

### Voordelen van .NET 9 Native OpenAPI

1. **Officiële Microsoft ondersteuning** - First-party package
2. **Betere performance** - Geoptimaliseerd voor .NET 9
3. **Kleinere dependencies** - Minder third-party packages
4. **Flexibiliteit** - Kies zelf je UI tool (Swagger, Scalar, ReDoc, etc.)
5. **Toekomstbestendig** - Volgt Microsoft roadmap

### Belangrijk: Geen UI in Native OpenAPI

De native `Microsoft.AspNetCore.OpenApi` genereert **alleen de OpenAPI specificatie** (`/openapi/v1.json`).
Voor een visuele interface moet je nog steeds een UI-tool toevoegen.

## Werken met Alleen OpenAPI (zonder UI)

Als je alleen de native `Microsoft.AspNetCore.OpenApi` gebruikt, kun je de specificatie op verschillende manieren gebruiken:

### Toegang tot de Specificatie
Start je applicatie en ga naar: `https://localhost:[port]/openapi/v1.json`

### Optie 1: Postman (Aanbevolen voor Testing)

**Import via URL:**
1. Start je .NET 9 API applicatie
2. Open Postman
3. Klik op **Import** (linksboven)
4. Selecteer **Link** tabblad
5. Plak: `https://localhost:7202/openapi/v1.json`
6. Klik op **Continue**

Postman genereert automatisch een collection met al je endpoints die je direct kunt testen.

**Let op**: Bij SSL certificaat waarschuwing → Settings → General → SSL certificate verification uitschakelen.

### Optie 2: Online Swagger Editor

1. Ga naar [editor.swagger.io](https://editor.swagger.io/)
2. Kopieer de JSON van `/openapi/v1.json`
3. Plak in de editor
4. Je ziet nu een visuele interface van je API

### Optie 3: Andere Tools

- **Insomnia** - REST client met OpenAPI import
- **VS Code extensies** - OpenAPI (Swagger) Editor, Thunder Client
- **ReDoc** - Voor documentatie generatie
- **Scalar** - Moderne API reference viewer

## Swagger UI Toevoegen aan .NET 9 (Dit Project)

Dit project gebruikt Swashbuckle om zowel de OpenAPI specificatie te genereren als een visuele Swagger UI te bieden.

### Stap 1: Installeer Swashbuckle NuGet Package

Open de **Package Manager Console** in Visual Studio en voer het volgende commando uit:

```powershell
Install-Package Swashbuckle.AspNetCore -Version 9.0.0
(Install-Package Swashbuckle.AspNetCore als je versie 10 wil)
```

Dit voegt de volgende package reference toe aan je `.csproj` file:

```xml
<PackageReference Include="Swashbuckle.AspNetCore" Version="9.0.6" />
```

Let op dat je niet de 10.x.x versie installeert, deze is bedoeld voor .NET 10.

### Stap 2: Pas Program.cs aan

Vervang de native OpenAPI configuratie door Swashbuckle:

**Voor (alleen OpenAPI):**
```csharp
builder.Services.AddOpenApi();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
```

**Na (met Swagger UI):**
```csharp
builder.Services.AddControllers();
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
```

### Stap 3: Pas launchSettings.json aan (Optioneel)

Wijzig `launchUrl` in `Properties/launchSettings.json` om automatisch Swagger UI te openen:

```json
"launchUrl": "swagger"
```

Volledige configuratie:
```json
{
  "$schema": "https://json.schemastore.org/launchsettings.json",
  "profiles": {
    "https": {
      "commandName": "Project",
      "dotnetRunMessages": true,
      "launchBrowser": true,
      "launchUrl": "swagger",
      "applicationUrl": "https://localhost:7202;http://localhost:5088",
      "environmentVariables": {
        "ASPNETCORE_ENVIRONMENT": "Development"
      }
    }
  }
}
```

### Stap 4: Start de Applicatie

Start de applicatie (F5 in Visual Studio). Swagger UI opent automatisch op:
- `https://localhost:7202/swagger`
- `http://localhost:5088/swagger`

### Resultaat

✅ Volledige Swagger UI interface  
✅ Interactieve API documentatie  
✅ Direct endpoints testen vanuit de browser  
✅ Automatische OpenAPI specificatie generatie

## Keuze Maken: Native OpenAPI vs Swashbuckle

**Gebruik Native OpenAPI wanneer:**
- Je alleen de specificatie nodig hebt
- Je externe tools gebruikt (Postman, Insomnia)
- Je een andere UI wilt (Scalar, ReDoc)
- Je maximale performance wilt

**Gebruik Swashbuckle wanneer:**
- Je een ingebouwde UI wilt in je applicatie
- Je bekend bent met Swagger UI
- Je snel aan de slag wilt met testing
- Je de meest gebruikte oplossing wilt

## Samenvatting

- **OpenAPI** = De specificatie/standaard voor API-beschrijvingen
- **Swagger** = Toolset voor werken met OpenAPI (UI, Editor, etc.)
- **.NET 9** = Native OpenAPI-generatie zonder UI
- **.NET 8** = Meestal Swashbuckle (OpenAPI + Swagger UI samen)

De native OpenAPI in .NET 9 scheidt de **specificatie-generatie** van de **presentatie-laag**, wat meer flexibiliteit en betere performance geeft.
