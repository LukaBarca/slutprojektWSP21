# Slutprojekt 2021 WSP
Slutprojekt 2021 Webbserverprogrammering.

![begin](begin.jpg)

##  Uppgiftsbeskrivning

Nu är det dags för att bygga en större applikation med hjälp av de tekniker vi har lärt oss i kursen Webbserverprogrammering. Syftet är att du ska lära dig att använda dina kunskaper för att bygga en webbapplikation med både front-end och back-end. Att ha kunskaper inom back-end-utveckling ger dig stora fördelar i livet om du tex ska bygga applikationer som sparar data och har användare med konton. Skulle du fortsätta med front-end (bara webbdesign) är det också väldigt meriterande att ha viss förståelse för vad som händer back-end. Både när du utvecklar själv men även när du kommunicerar med andra utvecklare.

Du kommer även under arbetets gång få miniföreläsningar om hur du kan göra utveckingen/koden snyggare, bättre och lättare att hantera. Tex att separera olika funktionalitet eller tips för att testa koden. 

##  Specifikation
- Valfri applikation, tex webbshop, forum, föreningssida med användare, företagssida med olika användare...
- Individuellt projekt
- Forka grundrepo: https://github.com/ntijoh/slutprojektWSP21.git
- Utvecklingsdagbok i github wikin (skrivs varje tillfälle)
- CSS är inget krav men är uppmuntrat
- Inlämningar v.9 (för feedback, avstämning), 16 (slutinlämning)
- Lämna in en liten film i misc-mapp som visar applikationen

## Lektionsstruktur
- Standup meetings i början på varje lektion
- Commits under lektion och push i slutet
- Eleven lägger inlägg i utvecklingsdagboken (git-wikin) det sista som händer

## Lektionsplanering

![tid](tid.png)


v.8 Under den första veckan gjorde jag en liten planering över hur jag skulle lägga upp mitt arbete under de här kommande veckorna. I början funderade jag på vad min hemsida skulle handla om. Jag tittade lite på internet för att få inspiration och valde att skapa en hemsida om musik. Man kommer att ha möjlighet att överblicka över sina favorit albums. Man kommer även kunna lägga till och ta bort olika albums. Till sist vill jag också implementera ett inloggningsystem i hemsidan. Jag tänkte börja med att skapa ett ER-diagram och strukturera mina olika mappar och filer i Visual studio code. Därefter skulle jag ta med mig an min databas och börja med själva kodningen.

v.9 Jag påbörjade på mitt ER-diagram och tänkte på vad min hemsida skulle innehålla. Jag ville ha olika albums och artister som har skapat dessa albums. Jag ville även skapa ett inloggningsystem med olika users. Detta tog jag i akt när jag ritade mitt ER-diagram. Därefter skapade jag en tydlig struktur över mina mappar och filer för att ha det ordning och reda när jag kodar. 

v.10 Efter att vara klar med ER-diagramet och själva struktureringen, påbörjade jag på min databas. Det jag hade ritat i mitt ER-diagram, implementerade jag i min databas. Jag tog kort på databasen och lade till den i misc mappen bland de alla andra bilderna. 

v.11 Idag påbörjade jag med själva kodningen i Visual studio code. Jag började med att koda så att min hemsida visade upp alla album som finns i min databas. Enligt RESTful Routes så ska action vara index för att visa alla albums. Jag skapade därför en index-slim fil med en GET route som HTTP verb. Alla vanliga länkar på hemsidan som "a href" brukar leda till GET route. Jag implementerade även funktionen som visar upp ett album. Index-filen heter då show och URL routern ska skrivas som /albums/:id (den dynamiska id). När jag då klickar på ett album (länk) på hemsidan körs den dynamiska routern igång med id:t som blir själva siffran. Med routern Get visar man slim filen "/albums/show". Sen ville jag kalla på en slim-fil i en mapp och för att göra detta behövde jag använda mig av symbolen : med själva länken för slim-filen inom dubbelfnuttar. Jag ville även att hemsidan skulle visa upp artisten för det album man klickar på. Enligt min databas har jag en albums tabell och artists tabell. Inom albums tabellen finns det AlbumId med främmande nyckel som håller också koll på artistId (vilken artist albumet hör till). Exempelvis ett album har artistId 8,dvs bandet har artistId 8. ArtistId (siffran 8 i detta fallet) kallas för främmande nyckel för att det är primär nyckel i artists tabellen.

v.12 När man klickade på ett album dyker det upp en hash på hemsidan, samt albumets namn och dess id. Däremot ville jag följa mitt ER-diagram och visa även upp artisten som har skapat just det albumet. När man klickar på albumets länk körs get routen med albumets id. Detta id plockar jag upp med params och gör om den till en integer eftersom att databasen undviker strings. Därefter gjorde jag en koppling med variablen "db" tillsammans med "SQLite3::Database.new". Detta resultatet man får gör jag om till en hash som dyker på hemsidan. Därefter gjorde jag ett anrop till databasen som sparas in en variabel result. I detta fallet ville jag hämta allt från tabellen albums där AlbumId är lika med 8. Istället för att skriva ut siffran 8 i koden, betecknade jag detta med ett "?" för att undvika hackers som kan hacka din kod med hjälp av SQL injection om inte frågetecknet skrivs ut. Därefter körde jag igång slim-filen och skickade med locals result (nyckeln och värde). Med hjälp av en till variabel "result2" kunde jag anropa på databasen för att få artistens namn när man klickar på albumet. Därför hämtade jag artistens namn från namn kolumnen från tabellen artists, där ArtistId finns med i albums tabellen istället. Jag hämtade detta ArtistId från tabellen albums, där AlbumId är 8. Detta kallas för en Nested query, då det är en query inuti en query. Därefter skickade jag ut detta med slim-fil med variabeln "result2". 

v.13 Under den här veckan funderade jag över hur jag kan utveckla min hemsida. Jag ville också följa CRUD-regeln så jag skapade en knapp för att både skapa och ta bort ett album. Jag började med att skapa en ny länk i layout.slim med namnet "/albums/new" enligt Restful routes. Med hjälp av en Get-route och slim-fil visar man formuläret för att skapa ett nytt album. I new.slim filen visas ett formulär med action "/albums/new" dvs vad post routern heter. Där inte en GET route i detta fallet eftersom att vi ska ändra databasen. Om man ändrar, uppdatera eller tar bort saker i sin hemsida ska det alltid vara en POST route som körs. Även två input med albumets titel och artist_id, samt med en submit knapp med namnet "Skapa Album". I POST routern plockar vi upp albumets titel och artist_id med params. I detta fallet stoppar vi in något i databasen istället för att hämta med hjälp av "INSERT". Vi stoppar in det i tabellen albums i kolumnerna Title och ArtistId. Man behöver inte heller stoppa in det i kolumnen AlbumId eftersom den är autoinkrementerad, den läggs till automatiskt. Till sist skrev jag in redirect för att POST routerns resultat skickas till GET routern som jag skapade innan för att sen skickas vidare med slim-filen. I index-filen loopas också alla albums ut. På samma sätt som när jag skapade ett album gjorde jag ett formulär för delete-knapp i index.slim. För att få det här att fungera skapade jag en dynamisk POST route. I routern vill jag plocka upp lite data med params. Jag plockade upp albumets id för att sedan ta bort det med delete-knappen. Med "DELETE", tar jag bort ett album från tabellen albums där AlbumId = "?". Till sist skriver jag in redirect för att skicka vidare till GET routern. 

v.15 För att utveckla min hemsida ännu mer ville jag skapa en länk-funktion som kan uppdatera olika albums namn. Jag skapade därför en GET route med länken "/albums/:id/edit" enligt REST. Den här GET routern gör att man kan ändra albumets namn och sen uppdatera den här förändringen med en POST route senare. Därefter skapade jag en edit.slim fil. Här skapade jag ett formulär för att kunna implementera uppdateringens funktionen, precis som jag gjorde för delete-knappen. I GET routern hämtar jag alla från tabellen albums, där AlbumId är "?". I POST routern uppdaterar jag title på ett album med ett id som är vald i tabellen albums. Sedan när jag skapade inloggningsystemet, gjorde jag på samma sätt. Jag skapade en register.slim med ett formulär för att användarna ska kunna registera sig på hemsidan. Jag skapade även en POST route med params som hämtar username och password. Sen implementerade jag en if-sats som tittar på om password och password_confirm är samma. Om de inte är det får man ett meddelande om att lösenordet är fel! För att logga in skapade jag en login.slim fil med ett formulär med en post route, på samma sätt som register-funktionen. 

v.16 Under den sista veckan tittade jag igenom min kod en extra gång och kontrollerade ER-diagramet och databasen en sista gång. Jag testade mig på Yardoc, men förstod inte det riktigt. Jag tänkte att jag lämnar in mitt projekt utan yardoc och löser det under kompletteringen då jag kan få hjälp om detta.



