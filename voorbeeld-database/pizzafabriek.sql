/*
================================================================================
PIZZAFABRIEK DATABASE - OEFENDATABASE VOOR SQL
================================================================================
Database voor het oefenen met SQL queries
Bevat: Pizza's, Ingrediënten, Bestellingen, Klanten, en meer
================================================================================
*/

-- Database aanmaken en gebruiken
USE master;
GO

IF EXISTS (SELECT name FROM sys.databases WHERE name = 'Pizzafabriek')
BEGIN
    ALTER DATABASE Pizzafabriek SET SINGLE_USER WITH ROLLBACK IMMEDIATE;
    DROP DATABASE Pizzafabriek;
END
GO

CREATE DATABASE Pizzafabriek;
GO

USE Pizzafabriek;
GO

/*
================================================================================
TABELLEN AANMAKEN
================================================================================
*/

-- Tabel: Bodems
CREATE TABLE Bodems (
    BodemID INT PRIMARY KEY IDENTITY(1,1),
    BodemNaam NVARCHAR(50) NOT NULL,
    Dikte NVARCHAR(20) NOT NULL,
    Prijs DECIMAL(5,2) NOT NULL,
    Beschrijving NVARCHAR(200)
);

-- Tabel: Ingrediënten
CREATE TABLE Ingredienten (
    IngredientID INT PRIMARY KEY IDENTITY(1,1),
    IngredientNaam NVARCHAR(50) NOT NULL,
    Categorie NVARCHAR(30) NOT NULL,
    VoorraadEenheid NVARCHAR(20) NOT NULL,
    PrijsPerEenheid DECIMAL(5,2) NOT NULL,
    MinimumVoorraad INT NOT NULL,
    HuidigeVoorraad INT NOT NULL
);

-- Tabel: Pizzas
CREATE TABLE Pizzas (
    PizzaID INT PRIMARY KEY IDENTITY(1,1),
    PizzaNaam NVARCHAR(50) NOT NULL,
    BodemID INT NOT NULL,
    Categorie NVARCHAR(30) NOT NULL,
    Verkoopprijs DECIMAL(6,2) NOT NULL,
    Populariteit INT CHECK (Populariteit BETWEEN 1 AND 5),
    Vegetarisch BIT NOT NULL,
    Pikant BIT NOT NULL,
    Beschrijving NVARCHAR(300),
    FOREIGN KEY (BodemID) REFERENCES Bodems(BodemID)
);

-- Tabel: PizzaIngrediënten (koppeltabel)
CREATE TABLE PizzaIngredienten (
    PizzaID INT NOT NULL,
    IngredientID INT NOT NULL,
    Hoeveelheid DECIMAL(6,2) NOT NULL,
    PRIMARY KEY (PizzaID, IngredientID),
    FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredienten(IngredientID)
);

-- Tabel: Bereidingsstappen
CREATE TABLE Bereidingsstappen (
    StapID INT PRIMARY KEY IDENTITY(1,1),
    PizzaID INT NOT NULL,
    Volgnummer INT NOT NULL,
    Beschrijving NVARCHAR(500) NOT NULL,
    TijdMinuten INT,
    FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID)
);

-- Tabel: Klanten
CREATE TABLE Klanten (
    KlantID INT PRIMARY KEY IDENTITY(1,1),
    Voornaam NVARCHAR(50) NOT NULL,
    Achternaam NVARCHAR(50) NOT NULL,
    Email NVARCHAR(100) NOT NULL UNIQUE,
    Telefoon NVARCHAR(20),
    Straat NVARCHAR(100),
    Huisnummer NVARCHAR(10),
    Postcode NVARCHAR(10),
    Plaats NVARCHAR(50),
    RegistratieDatum DATE NOT NULL DEFAULT GETDATE(),
    LidKlantenprogramma BIT NOT NULL DEFAULT 0
);

-- Tabel: Bestellingen
CREATE TABLE Bestellingen (
    BestellingID INT PRIMARY KEY IDENTITY(1,1),
    KlantID INT NOT NULL,
    Besteldatum DATETIME NOT NULL DEFAULT GETDATE(),
    Bezorgdatum DATETIME,
    Status NVARCHAR(20) NOT NULL CHECK (Status IN ('In behandeling', 'In bereiding', 'Onderweg', 'Afgeleverd', 'Geannuleerd')),
    Totaalbedrag DECIMAL(8,2),
    Bezorgkosten DECIMAL(5,2) NOT NULL DEFAULT 2.50,
    Korting DECIMAL(5,2) DEFAULT 0,
    Opmerkingen NVARCHAR(500),
    FOREIGN KEY (KlantID) REFERENCES Klanten(KlantID)
);

-- Tabel: Bestelregels
CREATE TABLE Bestelregels (
    BestellingID INT NOT NULL,
    Regelnummer INT NOT NULL,
    PizzaID INT NOT NULL,
    Aantal INT NOT NULL,
    Prijs DECIMAL(6,2) NOT NULL,
    ExtraWensen NVARCHAR(200),
    PRIMARY KEY (BestellingID, Regelnummer),
    FOREIGN KEY (BestellingID) REFERENCES Bestellingen(BestellingID),
    FOREIGN KEY (PizzaID) REFERENCES Pizzas(PizzaID)
);

-- Tabel: Medewerkers
CREATE TABLE Medewerkers (
    MedewerkerID INT PRIMARY KEY IDENTITY(1,1),
    Voornaam NVARCHAR(50) NOT NULL,
    Achternaam NVARCHAR(50) NOT NULL,
    Functie NVARCHAR(50) NOT NULL,
    InDienstDatum DATE NOT NULL,
    UurLoon DECIMAL(5,2) NOT NULL,
    Email NVARCHAR(100),
    Telefoon NVARCHAR(20)
);

/*
================================================================================
DATA INVOEGEN
================================================================================
*/

-- Bodems
INSERT INTO Bodems (BodemNaam, Dikte, Prijs, Beschrijving) VALUES
('Klassiek', 'Normaal', 0.00, 'Traditionele Italiaanse bodem'),
('Dun en knapperig', 'Dun', 0.50, 'Extra dunne knapperige bodem'),
('Thick crust', 'Dik', 1.00, 'Dikke en luchtige bodem'),
('Cheesy crust', 'Normaal', 2.00, 'Bodem met kaas in de rand'),
('Volkoren', 'Normaal', 0.75, 'Gezonde volkoren bodem'),
('Glutenvrij', 'Normaal', 2.50, 'Glutenvrije bodem');

-- Ingrediënten
INSERT INTO Ingredienten (IngredientNaam, Categorie, VoorraadEenheid, PrijsPerEenheid, MinimumVoorraad, HuidigeVoorraad) VALUES
('Tomatensaus', 'Saus', 'gram', 0.01, 5000, 15000),
('Mozzarella', 'Kaas', 'gram', 0.02, 3000, 8000),
('Gorgonzola', 'Kaas', 'gram', 0.04, 500, 1200),
('Parmezaan', 'Kaas', 'gram', 0.05, 500, 900),
('Ham', 'Vlees', 'gram', 0.03, 2000, 4500),
('Salami', 'Vlees', 'gram', 0.035, 1500, 3000),
('Pepperoni', 'Vlees', 'gram', 0.04, 1500, 3500),
('Shoarma', 'Vlees', 'gram', 0.045, 1000, 2000),
('Gehakt', 'Vlees', 'gram', 0.03, 2000, 4000),
('Kip', 'Vlees', 'gram', 0.035, 1500, 3000),
('Tonijn', 'Vis', 'gram', 0.04, 800, 1500),
('Ansjovis', 'Vis', 'gram', 0.06, 300, 600),
('Champignons', 'Groente', 'gram', 0.015, 1000, 2500),
('Paprika', 'Groente', 'gram', 0.02, 1000, 2000),
('Ui', 'Groente', 'gram', 0.01, 1500, 3000),
('Olijven', 'Groente', 'gram', 0.03, 500, 1000),
('Tomaat', 'Groente', 'gram', 0.015, 1000, 2200),
('Ananas', 'Fruit', 'gram', 0.02, 800, 1500),
('Jalapeño', 'Groente', 'gram', 0.025, 500, 900),
('Rucola', 'Groente', 'gram', 0.03, 400, 800),
('Basilicum', 'Kruiden', 'gram', 0.05, 200, 500),
('Oregano', 'Kruiden', 'gram', 0.04, 200, 450),
('Knoflook', 'Kruiden', 'gram', 0.02, 300, 700);

-- Pizza's
INSERT INTO Pizzas (PizzaNaam, BodemID, Categorie, Verkoopprijs, Populariteit, Vegetarisch, Pikant, Beschrijving) VALUES
('Margherita', 1, 'Klassiek', 8.50, 5, 1, 0, 'De klassieke pizza met tomatensaus, mozzarella en basilicum'),
('Funghi', 1, 'Klassiek', 9.50, 4, 1, 0, 'Tomatensaus, mozzarella en champignons'),
('Salami', 1, 'Klassiek', 10.50, 5, 0, 0, 'Tomatensaus, mozzarella en salami'),
('Quattro Formaggi', 1, 'Kaas', 11.50, 4, 1, 0, 'Vier soorten kaas op een witte bodem'),
('Hawaii', 1, 'Speciaal', 10.50, 3, 0, 0, 'Ham en ananas op tomatensaus met mozzarella'),
('Pepperoni', 2, 'Klassiek', 11.00, 5, 0, 1, 'Pikante pepperoni met mozzarella'),
('Tonno', 1, 'Vis', 11.50, 3, 0, 0, 'Tonijn, ui en mozzarella'),
('Vegetariana', 5, 'Vegetarisch', 11.00, 4, 1, 0, 'Diverse groenten op volkoren bodem'),
('Shoarma', 1, 'Speciaal', 12.50, 4, 0, 1, 'Shoarma, ui, paprika en knoflooksaus'),
('BBQ Chicken', 3, 'Speciaal', 12.50, 4, 0, 0, 'Kip, paprika en BBQ saus'),
('Calzone', 1, 'Speciaal', 11.50, 3, 0, 0, 'Opgevouwen pizza met ham, salami en champignons'),
('Diavola', 2, 'Klassiek', 11.50, 4, 0, 1, 'Extra pikant met salami en jalapeño'),
('Capricciosa', 1, 'Klassiek', 12.00, 3, 0, 0, 'Ham, champignons, artisjok en olijven'),
('Parma', 1, 'Speciaal', 13.50, 4, 0, 0, 'Mozzarella, rucola, Parmaham en parmezaan'),
('Quattro Stagioni', 1, 'Klassiek', 12.50, 3, 0, 0, 'Pizza in vier smaken verdeeld');

-- Pizza Ingrediënten (koppeltabel)
INSERT INTO PizzaIngredienten (PizzaID, IngredientID, Hoeveelheid) VALUES
-- Margherita
(1, 1, 80), (1, 2, 150), (1, 21, 5),
-- Funghi
(2, 1, 80), (2, 2, 150), (2, 13, 100),
-- Salami
(3, 1, 80), (3, 2, 150), (3, 6, 80),
-- Quattro Formaggi
(4, 2, 100), (4, 3, 50), (4, 4, 60),
-- Hawaii
(5, 1, 80), (5, 2, 150), (5, 5, 80), (5, 18, 80),
-- Pepperoni
(6, 1, 80), (6, 2, 150), (6, 7, 100),
-- Tonno
(7, 1, 80), (7, 2, 150), (7, 11, 100), (7, 15, 50),
-- Vegetariana
(8, 1, 80), (8, 2, 150), (8, 13, 60), (8, 14, 60), (8, 17, 40), (8, 15, 40),
-- Shoarma
(9, 1, 80), (9, 2, 150), (9, 8, 120), (9, 15, 50), (9, 14, 50),
-- BBQ Chicken
(10, 1, 80), (10, 2, 150), (10, 10, 120), (10, 14, 60),
-- Calzone
(11, 1, 80), (11, 2, 150), (11, 5, 60), (11, 6, 60), (11, 13, 60),
-- Diavola
(12, 1, 80), (12, 2, 150), (12, 6, 80), (12, 19, 40),
-- Capricciosa
(13, 1, 80), (13, 2, 150), (13, 5, 80), (13, 13, 60), (13, 16, 40),
-- Parma
(14, 2, 150), (14, 20, 40), (14, 4, 30), (14, 5, 80),
-- Quattro Stagioni
(15, 1, 80), (15, 2, 150), (15, 5, 50), (15, 6, 50), (15, 13, 50), (15, 16, 30);

-- Bereidingsstappen
INSERT INTO Bereidingsstappen (PizzaID, Volgnummer, Beschrijving, TijdMinuten) VALUES
(1, 1, 'Rol het pizzadeeg uit tot een ronde lap van ongeveer 30cm diameter', 2),
(1, 2, 'Smeer de tomatensaus gelijkmatig over het deeg, laat 1cm rand vrij', 1),
(1, 3, 'Verdeel de mozzarella over de pizza', 1),
(1, 4, 'Bak de pizza in een voorverwarmde oven op 250°C voor 8-10 minuten', 10),
(1, 5, 'Garneer met verse basilicum na het bakken', 1),
(6, 1, 'Rol het pizzadeeg dun uit voor een knapperige bodem', 2),
(6, 2, 'Smeer de tomatensaus over het deeg', 1),
(6, 3, 'Verdeel de mozzarella', 1),
(6, 4, 'Leg de pepperoni plakjes over de hele pizza', 1),
(6, 5, 'Bak op 250°C voor 8-10 minuten tot de rand knapperig is', 10),
(11, 1, 'Rol het deeg uit en smeer de helft met tomatensaus', 2),
(11, 2, 'Verdeel mozzarella, ham, salami en champignons over de helft', 2),
(11, 3, 'Vouw de pizza dubbel en druk de randen goed dicht', 1),
(11, 4, 'Bak 12-15 minuten op 220°C', 15);

-- Klanten
INSERT INTO Klanten (Voornaam, Achternaam, Email, Telefoon, Straat, Huisnummer, Postcode, Plaats, RegistratieDatum, LidKlantenprogramma) VALUES
('Jan', 'Jansen', 'jan.jansen@email.nl', '0612345678', 'Hoofdstraat', '12', '1234AB', 'Amsterdam', '2024-01-15', 1),
('Marie', 'Pietersen', 'marie.p@email.nl', '0687654321', 'Kerkstraat', '45', '2345BC', 'Rotterdam', '2024-02-20', 1),
('Peter', 'de Vries', 'peter.devries@email.nl', '0698765432', 'Dorpsweg', '78', '3456CD', 'Utrecht', '2024-03-10', 0),
('Lisa', 'Bakker', 'lisa.bakker@email.nl', '0623456789', 'Marktplein', '5', '4567DE', 'Den Haag', '2024-03-25', 1),
('Ahmed', 'Hassan', 'ahmed.h@email.nl', '0634567890', 'Stationsstraat', '101', '5678EF', 'Eindhoven', '2024-04-05', 0),
('Sophie', 'Vermeulen', 'sophie.v@email.nl', '0645678901', 'Parkweg', '23', '6789FG', 'Groningen', '2024-05-12', 1),
('Tom', 'Willems', 'tom.willems@email.nl', '0656789012', 'Schoolstraat', '67', '7890GH', 'Tilburg', '2024-06-18', 0),
('Emma', 'de Jong', 'emma.jong@email.nl', '0667890123', 'Nieuweweg', '89', '8901HI', 'Almere', '2024-07-22', 1),
('Lucas', 'van Dijk', 'lucas.dijk@email.nl', '0678901234', 'Bosstraat', '34', '9012IJ', 'Breda', '2024-08-30', 0),
('Sara', 'Mulder', 'sara.mulder@email.nl', '0689012345', 'Lindelaan', '56', '0123JK', 'Nijmegen', '2024-09-14', 1);

-- Bestellingen
INSERT INTO Bestellingen (KlantID, Besteldatum, Bezorgdatum, Status, Totaalbedrag, Bezorgkosten, Korting, Opmerkingen) VALUES
(1, '2024-11-01 18:30:00', '2024-11-01 19:15:00', 'Afgeleverd', 31.50, 2.50, 0, NULL),
(2, '2024-11-02 19:00:00', '2024-11-02 19:45:00', 'Afgeleverd', 24.00, 2.50, 2.00, 'Extra knoflooksaus graag'),
(3, '2024-11-03 17:45:00', '2024-11-03 18:30:00', 'Afgeleverd', 43.50, 0, 0, 'Ophalen'),
(1, '2024-11-04 20:00:00', '2024-11-04 20:40:00', 'Afgeleverd', 29.00, 2.50, 3.00, NULL),
(4, '2024-11-05 18:15:00', '2024-11-05 19:00:00', 'Afgeleverd', 38.50, 2.50, 0, 'Zo snel mogelijk graag'),
(5, '2024-11-06 19:30:00', NULL, 'Geannuleerd', 0, 0, 0, 'Klant heeft geannuleerd'),
(6, '2024-11-07 18:00:00', '2024-11-07 18:45:00', 'Afgeleverd', 52.00, 2.50, 5.00, NULL),
(2, '2024-11-08 19:15:00', '2024-11-08 20:00:00', 'Afgeleverd', 33.50, 2.50, 0, NULL),
(7, '2024-11-09 17:30:00', '2024-11-09 18:20:00', 'Afgeleverd', 25.50, 2.50, 0, 'Extra olijven'),
(8, '2024-11-10 20:30:00', NULL, 'Onderweg', 41.00, 2.50, 0, NULL),
(1, '2024-11-11 18:45:00', NULL, 'In bereiding', 28.50, 2.50, 0, NULL),
(9, '2024-11-11 19:00:00', NULL, 'In behandeling', 35.00, 2.50, 0, NULL);

-- Bestelregels
INSERT INTO Bestelregels (BestellingID, Regelnummer, PizzaID, Aantal, Prijs, ExtraWensen) VALUES
(1, 1, 1, 2, 8.50, NULL),
(1, 2, 6, 1, 11.00, 'Extra pikant'),
(2, 1, 5, 2, 10.50, NULL),
(3, 1, 4, 1, 11.50, NULL),
(3, 2, 14, 2, 13.50, NULL),
(3, 3, 8, 1, 11.00, NULL),
(4, 1, 1, 1, 8.50, NULL),
(4, 2, 3, 2, 10.50, NULL),
(5, 1, 9, 2, 12.50, 'Extra knoflooksaus'),
(5, 2, 2, 1, 9.50, NULL),
(7, 1, 6, 3, 11.00, NULL),
(7, 2, 12, 2, 11.50, 'Extra jalapeño'),
(8, 1, 7, 2, 11.50, NULL),
(8, 2, 8, 1, 11.00, NULL),
(9, 1, 1, 2, 8.50, 'Extra olijven op beide'),
(9, 2, 13, 1, 12.00, NULL),
(10, 1, 10, 2, 12.50, NULL),
(10, 2, 15, 1, 12.50, NULL),
(11, 1, 1, 1, 8.50, NULL),
(11, 2, 6, 2, 11.00, NULL),
(12, 1, 4, 1, 11.50, NULL),
(12, 2, 14, 2, 13.50, NULL);

-- Medewerkers
INSERT INTO Medewerkers (Voornaam, Achternaam, Functie, InDienstDatum, UurLoon, Email, Telefoon) VALUES
('Marco', 'Bianchi', 'Chef-kok', '2020-01-15', 18.50, 'marco.b@pizzafabriek.nl', '0611111111'),
('Giovanni', 'Rossi', 'Pizzabakker', '2021-03-20', 14.00, 'giovanni.r@pizzafabriek.nl', '0622222222'),
('Julia', 'Schmidt', 'Pizzabakker', '2022-06-10', 13.50, 'julia.s@pizzafabriek.nl', '0633333333'),
('Carlos', 'Garcia', 'Bezorger', '2023-02-01', 12.00, 'carlos.g@pizzafabriek.nl', '0644444444'),
('Anna', 'Kowalski', 'Bezorger', '2023-04-15', 12.00, 'anna.k@pizzafabriek.nl', '0655555555'),
('Mohammed', 'Ali', 'Bezorger', '2023-07-20', 12.00, 'mohammed.a@pizzafabriek.nl', '0666666666'),
('Sandra', 'van Beek', 'Manager', '2019-05-01', 22.00, 'sandra.vb@pizzafabriek.nl', '0677777777'),
('David', 'Brown', 'Keukenhulp', '2024-01-10', 11.50, 'david.b@pizzafabriek.nl', '0688888888');

/*
================================================================================
VIEWS AANMAKEN
================================================================================
*/

-- View: Pizza overzicht met alle details
GO
CREATE VIEW vw_PizzaOverzicht AS
SELECT 
    p.PizzaID,
    p.PizzaNaam,
    b.BodemNaam,
    b.Dikte,
    p.Categorie,
    p.Verkoopprijs,
    p.Populariteit,
    CASE WHEN p.Vegetarisch = 1 THEN 'Ja' ELSE 'Nee' END AS Vegetarisch,
    CASE WHEN p.Pikant = 1 THEN 'Ja' ELSE 'Nee' END AS Pikant,
    p.Beschrijving
FROM Pizzas p
INNER JOIN Bodems b ON p.BodemID = b.BodemID;
GO

-- View: Ingrediënten per pizza
CREATE VIEW vw_PizzaIngredienten AS
SELECT 
    p.PizzaNaam,
    i.IngredientNaam,
    i.Categorie AS IngredientCategorie,
    pi.Hoeveelheid,
    i.VoorraadEenheid
FROM Pizzas p
INNER JOIN PizzaIngredienten pi ON p.PizzaID = pi.PizzaID
INNER JOIN Ingredienten i ON pi.IngredientID = i.IngredientID;
GO

-- View: Bestellingen met klantgegevens
CREATE VIEW vw_BestellingenOverzicht AS
SELECT 
    b.BestellingID,
    b.Besteldatum,
    k.Voornaam + ' ' + k.Achternaam AS KlantNaam,
    k.Email,
    k.Telefoon,
    k.Plaats,
    b.Status,
    b.Totaalbedrag,
    b.Bezorgkosten,
    b.Korting
FROM Bestellingen b
INNER JOIN Klanten k ON b.KlantID = k.KlantID;
GO

-- View: Voorraad waarschuwingen
CREATE VIEW vw_VoorraadWaarschuwingen AS
SELECT 
    IngredientNaam,
    Categorie,
    HuidigeVoorraad,
    MinimumVoorraad,
    (HuidigeVoorraad - MinimumVoorraad) AS Verschil,
    VoorraadEenheid
FROM Ingredienten
WHERE HuidigeVoorraad <= MinimumVoorraad * 1.2;
GO

/*
================================================================================
STORED PROCEDURES
================================================================================
*/

-- Procedure: Nieuwe bestelling aanmaken
GO
CREATE PROCEDURE sp_NieuweBestelling
    @KlantID INT,
    @Opmerkingen NVARCHAR(500) = NULL,
    @BestellingID INT OUTPUT
AS
BEGIN
    INSERT INTO Bestellingen (KlantID, Besteldatum, Status, Bezorgkosten, Opmerkingen)
    VALUES (@KlantID, GETDATE(), 'In behandeling', 2.50, @Opmerkingen);
    
    SET @BestellingID = SCOPE_IDENTITY();
END;
GO

-- Procedure: Populairste pizza's ophalen
CREATE PROCEDURE sp_Populairstepizzas
    @AantalPizzas INT = 5
AS
BEGIN
    SELECT TOP (@AantalPizzas)
        p.PizzaNaam,
        p.Verkoopprijs,
        p.Populariteit,
        COUNT(br.PizzaID) AS AantalBestellingen,
        SUM(br.Aantal) AS TotaalAantal
    FROM Pizzas p
    LEFT JOIN Bestelregels br ON p.PizzaID = br.PizzaID
    GROUP BY p.PizzaID, p.PizzaNaam, p.Verkoopprijs, p.Populariteit
    ORDER BY TotaalAantal DESC, p.Populariteit DESC;
END;
GO

-- Procedure: Klant loyaliteit
CREATE PROCEDURE sp_KlantLoyaliteit
    @KlantID INT
AS
BEGIN
    SELECT 
        k.Voornaam + ' ' + k.Achternaam AS KlantNaam,
        k.LidKlantenprogramma,
        COUNT(b.BestellingID) AS AantalBestellingen,
        SUM(b.Totaalbedrag) AS TotaalBesteed,
        AVG(b.Totaalbedrag) AS GemiddeldeBestelling,
        MAX(b.Besteldatum) AS LaatstebesteLling
    FROM Klanten k
    LEFT JOIN Bestellingen b ON k.KlantID = b.KlantID
    WHERE k.KlantID = @KlantID
    GROUP BY k.KlantID, k.Voornaam, k.Achternaam, k.LidKlantenprogramma;
END;
GO

/*
================================================================================
VOORBEELD QUERIES
================================================================================
*/

PRINT 'Database Pizzafabriek succesvol aangemaakt!';
PRINT '';
PRINT '=== VOORBEELD QUERIES ===';
PRINT '';
PRINT '-- Alle pizza''s met hun ingrediënten:';
PRINT 'SELECT * FROM vw_PizzaIngredienten ORDER BY PizzaNaam;';
PRINT '';
PRINT '-- Top 5 populairste pizza''s:';
PRINT 'EXEC sp_Populairstepizzas 5;';
PRINT '';
PRINT '-- Vegetarische pizza''s:';
PRINT 'SELECT * FROM vw_PizzaOverzicht WHERE Vegetarisch = ''Ja'';';
PRINT '';
PRINT '-- Ingrediënten die bijna op zijn:';
PRINT 'SELECT * FROM vw_VoorraadWaarschuwingen;';
PRINT '';
PRINT '-- Bestellingen van vandaag:';
PRINT 'SELECT * FROM vw_BestellingenOverzicht WHERE CAST(Besteldatum AS DATE) = CAST(GETDATE() AS DATE);';
GO