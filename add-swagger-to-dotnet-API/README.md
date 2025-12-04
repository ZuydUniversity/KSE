# Swagger/OpenAPI in .NET 9 Web API

Dit project demonstreert hoe je OpenAPI-documentatie toevoegt aan een .NET 9 Web API en legt de belangrijkste verschillen uit tussen .NET 8 en .NET 9, evenals het onderscheid tussen OpenAPI en Swagger.

## Projectopzet

Dit is een eenvoudig .NET 9 Web API project met:
- **Framework**: .NET 9.0
- **Template**: ASP.NET Core Web API
- **Controller**: `WeatherForecastController` met een GET endpoint
- **OpenAPI**: Ingebouwde Microsoft.AspNetCore.OpenApi ondersteuning

## Belangrijkste Verschillen: .NET 8 vs .NET 9

### .NET 8 - Swashbuckle Aanpak

In .NET 8 gebruikte je typisch **Swashbuckle.AspNetCore** voor API-documentatie:

```csharp
// .NET 8 - Program.cs
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}
```

**NuGet package**: `Swashbuckle.AspNetCore` (third-party library)

### .NET 9 - Native OpenAPI

In .NET 9 heeft Microsoft **native OpenAPI-ondersteuning** geïntroduceerd:

```csharp
// .NET 9 - Program.cs
builder.Services.AddOpenApi();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
```

**NuGet package**: `Microsoft.AspNetCore.OpenApi` (officiële Microsoft package)

### Wat is er Veranderd?

| Aspect | .NET 8 (Swashbuckle) | .NET 9 (Native OpenAPI) |
|--------|---------------------|------------------------|
| **Provider** | Third-party (Swashbuckle) | Microsoft (first-party) |
| **Package** | `Swashbuckle.AspNetCore` | `Microsoft.AspNetCore.OpenApi` |
| **Service registratie** | `AddSwaggerGen()` | `AddOpenApi()` |
| **Middleware** | `UseSwagger()` + `UseSwaggerUI()` | `MapOpenApi()` |
| **UI included** | Ja (Swagger UI) | Nee (alleen OpenAPI spec) |
| **Endpoint** | `/swagger` | `/openapi/v1.json` |
| **Performance** | Goed | Beter (geoptimaliseerd) |

## OpenAPI vs Swagger - Het Verschil

### Wat is OpenAPI?

**OpenAPI** is een **specificatie** (voorheen bekend als Swagger Specification):
- Een gestandaardiseerde manier om REST APIs te beschrijven
- Beheerd door de OpenAPI Initiative (Linux Foundation)
- Huidige versie: OpenAPI 3.1
- Het is een **formaat** (JSON/YAML) voor API-documentatie

**Voorbeeld OpenAPI document**:
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

### Wat is Swagger?

**Swagger** is een **set van tools** voor werken met OpenAPI:
- **Swagger UI**: Interactieve API-documentatie viewer
- **Swagger Editor**: Editor voor OpenAPI specificaties
- **Swagger Codegen**: Code generator op basis van OpenAPI specs
- Oorspronkelijk de naam van de specificatie (voor OpenAPI 3.0)

### In .NET 9 Context

#### Microsoft.AspNetCore.OpenApi
- Genereert **alleen** de OpenAPI specificatie
- Endpoint: `/openapi/v1.json`
- Geen UI included
- Lightweight en performant
- Focus op de **specificatie**

#### Voor UI heb je nog steeds Swagger (of alternatieven) nodig

Als je een visuele interface wilt, kun je **Swashbuckle toevoegen** (voor Swagger UI):

In .csproj file:
```xml
<PackageReference Include="Swashbuckle.AspNetCore" Version="6.5.0" />
```

In program.cs:
```csharp
builder.Services.AddOpenApi();
// Extra: UI toevoegen
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
    app.UseSwagger();
    app.UseSwaggerUI(c => 
    {
        c.SwaggerEndpoint("/openapi/v1.json", "My API V1");
    });
}
```


## Standaard Project Configuratie

Dit project gebruikt de **minimale .NET 9 setup**:

### DotNet9WebAPI.csproj
```xml
<PackageReference Include="Microsoft.AspNetCore.OpenApi" Version="9.0.11" />
```

### Program.cs
```csharp
builder.Services.AddOpenApi();

if (app.Environment.IsDevelopment())
{
    app.MapOpenApi();
}
```

### Toegang tot de OpenAPI Spec
Wanneer je de applicatie draait:
- OpenAPI JSON: `https://localhost:[port]/openapi/v1.json`

**Let op**: Er is geen UI beschikbaar in deze minimale setup. Je kunt de JSON bekijken of externe tools gebruiken zoals:
- Swagger Editor (online)
- Postman
- VS Code extensies

## Voordelen van .NET 9 Native OpenAPI

1. **Officiële ondersteuning**: Direct van Microsoft
2. **Betere performance**: Geoptimaliseerd voor .NET 9
3. **Kleinere dependencies**: Minder third-party packages
4. **Modernere API**: Designed voor minimal APIs en nieuwe .NET features
5. **Toekomstbestendig**: Volgt Microsoft's roadmap

## Aanbevolen Aanpak voor Nieuwe Projecten

Voor nieuwe .NET 9 projecten:

1. Gebruik `Microsoft.AspNetCore.OpenApi` voor de specificatie
2. Kies een UI-tool naar voorkeur:
   - **Swagger UI** (via Swashbuckle) - meest bekend
   - **Scalar** - modern en snel
   - **ReDoc** - focus op documentatie
   - **RapiDoc** - customizable

## Toevoegen Swagger aan .NET 9 API project

todo

## Samenvatting

- **OpenAPI** = De specificatie/standaard voor API-beschrijvingen
- **Swagger** = Toolset voor werken met OpenAPI (UI, Editor, etc.)
- **.NET 9** = Native OpenAPI-generatie zonder UI
- **.NET 8** = Meestal Swashbuckle (OpenAPI + Swagger UI samen)

De native OpenAPI in .NET 9 scheidt de **specificatie-generatie** van de **presentatie-laag**, wat meer flexibiliteit en betere performance geeft.
