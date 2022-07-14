# Samenvatting  
- Context (Waarom is dit werk belangrijk?); 
- Nood (Waarom moet dit onderzocht worden?); 
- Taak (Wat ga je (ongeveer) doen?); 
- Object (Wat staat in dit document geschreven?); 
- Resultaat (Wat verwacht je van je onderzoek?); 
- Conclusie (Wat verwacht je van van de conclusies?); 
- Perspectief (Wat zegt de toekomst voor dit werk?).

Navigatie applicaties zijn een handige tool om gebruikers te helpen verplaatsen, maar door verstoringen in gebouwen is het niet mogelijk om GPS te gebruiken. Hiervoor zijn er al verschillende onderzoeken en betalende applicaties beschikbaar. Het is echter niet meteen duidelijk voor ontwikkelaars welke technieken er allemaal beschikbaar zijn en welke het makkelijkst toepasbaar zijn voor het maken van een eigen indoor navigatie applicatie. In deze scriptie zal onderzocht worden welke technieken er beschikbaar zijn en welke het makkelijkst toepasbaar zijn. Daarnaast zal er ook en prototype ontwikkeld worden om als voorbeeld te dienen voor nieuwe ontwikkelaars. Van dit prototype word er verwacht dat het de basis functionaliteiten heeft om makkelijk indoor te navigeren.

# Introductie
- Outdoor navigatie systemen zijn zeer praktisch en worden vaak gebruikt, en zijn mogelijk gemaakt door GPS
- Deze systemen werken niet indoor omdat er teveel verstoring is in grote gebouwen
- Hierdoor moeten andere positionerings manieren gebruikt worden bv BLE beacons, wifi, magnetisme, INS...
- Om dit probleem aan te pakken bestaan er al vele studies en ook al meerdere betalende apps en platformen

- Het is echter niet meteen duidelijk voor ontwikkelaars welke technieken er allemaal beschikbaar zijn en welke het makkelijkst toepasbaar zijn voor het maken van een eigen indoor navigatie applicatie
- Om dit aan te pakken wil dit onderzoek volgende onderzoeksvragen oplossen:

Hoe kan een indoor navigatie systeem opgezet worden, door gebruik te maken van bestaande technieken en algoritmen?
- Welke positionerings technieken kunnen gebruikt worden?
- Welke pathfinding algoritmen kunnen gebruikt worden?
- Welke manieren van route en gebouw visualisatie kunnen gebruikt worden?
- Welke manieren van data ingave en opslag voor de verschillende systemen kunnen gebruikt worden?

# State-of-the-Art
## GPS in gouwen
Indoor GPS is grotendeels afhankelijk van de constructie materialen van een gebouw en de sensitiviteit van de ontvangers. In grote betonnen gebouwen is de accuratie van state of the art GPS ontvangers onder de 10m, maar standaard ontvangers zoals gevonden in smartphones hebben een lagere accuratie (1). Hierdoor zijn er andere manieren voor positionering nodig om accuraat gebruikers te helpen.
  
## Indoor positionering
Er zijn verschillende manieren om indoor positionering te volbrengen elke met hun limitaties, accuratie en kost. Er kan gekozen worden voor beacons zoals BLE, wifi en RFID. Deze technologieën hebben een accuratie van 2 tot 5m(2). Wanneer er gebruik gemaakt word van beacons moet er wel infrastructuur toegevoegd worden, wat een zekere kost meebrengt en niet praktisch is om in elk gebouw toe te voegen. 

Er zijn ook manieren van positionering die werken met enkel de sensoren beschikbaar in een smartphone. Dit is dan bijvoorbeeld Pedestrian Dead Reckoning, magnetische velden en computer vision deze bieden een accuratie van 1 tot 10m(2).

## Pathfinding algoritmen
Een belangrijke functie van een navigatie applicatie is het kortste pad te vinden tussen de startpositie en de locatie waar de gebruiker wil naar toe gaan. Om een kortste pad te kunnen bepalen moet er eerst een kost toegeschreven worden aan elk segment van het pad. Daarna kan dan een combinatie van alle segmenten genomen worden om het kortste/goedkoopste pad te kiezen(3). Het vinden van het kortste pad is niet triviaal een om dit probleem op te lossen worden er pathfinding algoritmen gebruikt. Algoritmen die gebruikt kunnen worden zijn bijvoorbeeld Dijkstra’s algoritme en A* (4).

## Visualisatiemethodes
Er zijn verschillende methodes om een gebouw en het pad dat een persoon moet volgen voor te stellen. 
Een eerste voorbeeld en de meest simpele manier van voorstellen is met 2D visualisatie, hierbij zijn er verschillende levels om de verdiepen van een gebouw aan te duiden.
Een meer complexe manier van voorstellen is met 3D visualisatie (5), hierbij heeft de gebruiker meer context van het gebouw in zijn geheel.
De meest complexe manier is Augmented Reality (AR) visualisatie. Bij deze techniek word de camera van de smartphone gebuikt om op het scherm de omgeving te tonen, aangevuld met het te volgen pad en sommige markers (6).

## Data ingave voor gebouwen
Afhankelijk van de gekozen positionerings en visualisatie techniek moet er verschillende data ingegeven worden om gebouwen te modelleren. Bijvoorbeeld als er gebruikt word gemaakt van magnetisme moet het geomagnetisme veld gemeten worden op meerdere plaatsen in het gebouw (7). 
Om het kortste pad te vinden met een algoritme is er ook data nodig. Dit zijn dan de afmetingen van het gebouw en de plaatsen waar er naar genavigeerd worden. Dit kan in verschillende dataformaten worden opgeslagen bijvoorbeeld met de open standaard IndoorGML (8).
De visualisatie voor de gebruiker heeft ook data nodig. Wanneer dit in de vorm is van 2D visualisatie dan is een blauwdruk genoeg. Wanneer er gebruikt gemaakt word van 3D of augmented reality, zijn er digitale versies  of digital twins nodig voor het gebouw (8).

## Bestaande applicaties
Er bestaan al meerdere applicatie die indoor navigatie aanbieden, deze zijn zowel in de vorm van  afgewerkte applicaties als software development kit (SDK) beschikbaar. Voorbeelden hiervan zijn 
Navin (https://nav-in.com/), Situm (https://situm.com/en/), Navigine (https://navigine.com/) en ViewAR (https://www.viewar.com/). Naast deze betalende applicaties zijn er geen volledig gratis open source alternatieven.

Dit onderzoek heeft de bedoeling om het makkelijker te maken voor ander developers om hun eigen indoor navigatie applicaties te maken, door een overzicht van de beschikbare technieken en bestaande libraries te verschaffen

# Methodologie
Het theoretisch gedeelte van dit onderzoek voor het opzetten van een indoor navigatie applicatie zal gebeuren aan de hand van een analyse van verschillende papers, thesissen, artikels... Het doel is een zo een volledig mogelijk beeld te vormen van de beschikbare technieken met hun voordelen, limitaties en hoe deze toegepast kunnen worden.

Het praktisch gedeelte van dit onderzoek omvat het ontwikkelen van een prototype van een indoor navigatie applicatie. Deze applicatie zal de makkelijkst toepasbare methodes gebruiken die gevonden worden in het theoretische gedeelte om een voorbeeld te maken dat andere ontwikkelaars kunnen gebruiken als startpunt om hun eigen navigatie applicatie te maken.

# Verwachte resultaten
Er word verwacht dat een indoor navigatie applicatie kan ontwikkeld worden met de volgende methodes en technologieën

- Welke positionerings technieken kunnen gebruikt worden?
- Welke pathfinding algoritmen kunnen gebruikt worden?
- Welke manieren van route en gebouw visualisatie kunnen gebruikt worden?
- Welke manieren van data ingave en opslag voor de verschillende systemen kunnen gebruikt worden?

- Pedestrian dead reckoning gebaseerde positionering met gebruikersinterventie wanneer er een navigatiepunt is bereikt, om error te beperken.
- A* gebaseerd algoritme dat kan toegepast worden op een graaf van de navigatiepunten in een gebouw.
- 2D voorstelling met een map per verdieping, aangevuld door een takenlijst  met alle stappen die de gebruiker moet voltooien om het doel te bereiken.
- SVG als visualisatie voor de gebruiker en navigatiepunten opgeslagen in het IndoorGML formaat

# Verwachte conclusies
Uit dit onderzoek verwachten we te concluderen dat het ontwikkelen van een indoor navigatie applicatie door enkel gebruikt te maken van bestaande algoritmen mogelijk is. Er zal wel extra moeten gelet worden op de accuratie van de positioneeringstechniek en deze zal moeten aangevuld worden met gebruikersinterventie.

Er word ook verwacht te kunnen concluderen dat er veel mogelijke manieren zijn om positionering en visualisatie te gebruiken maar dat vele hiervan te complex zijn om uit door een enkele ontwikkelaar of klein ontwikkelingsteam.

# Referenties
[IndoorGML Docs](https://docs.ogc.org/cs/20-094/index.html)

1. [Indoor Positioning Using GPS Revisited](https://www.researchgate.net/publication/221016004_Indoor_Positioning_Using_GPS_Revisited)
2. [Meta-Review of Indoor Positioning Systems](https://www.researchgate.net/publication/336630326_A_Meta-Review_of_Indoor_Positioning_Systems)
3. [Performance Evaluation of Pathfinding Algorithms](https://scholar.uwindsor.ca/etd/8178/)
4. [A* algorithm to find shortest path](https://www.irjet.net/archives/V4/i6/IRJET-V4I6434.pdf)
5. [Design of 3D visualization indoor navigation](https://www.researchgate.net/publication/353088273_Design_of_three-dimensional_visualization_indoor_navigation_system_in_smart_city_construction)
6. [Annotated Maps in Mobile Augmented Reality](https://www.researchgate.net/publication/337590893_Indoor_Navigation_Systems_Using_Annotated_Maps_in_Mobile_Augmented_Reality)
7. [Using Geomagnetic Field for Indoor Positioning](https://www.researchgate.net/publication/269614007_Using_Geomagnetic_Field_for_Indoor_Positioning)
8. [IndoorGML](https://www.researchgate.net/publication/303978591_INDOORGML_-_A_STANDARD_FOR_INDOOR_SPATIAL_MODELING)
9. [Indoor Positioning and Mapping Technology Standards](https://www.mdpi.com/2305-6703/2/2/12/htm)