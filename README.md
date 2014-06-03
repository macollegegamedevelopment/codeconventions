codeconventions
===============

####Code Conventions
####Ma Game Development

####Inhoudsopgave:
* auto-gen TOC:
{:toc}

#### 1 – Waarom Code conventions
In deze repository vind je code voorbeelden voor de Code Conventions: hoe codeer je je code.

Waarom Code conventions:

Code conventions (codeer afspraken) zijn voor programmeurs belangrijk voor verschillende redenen:

*   Het maakt je code leesbaar
*   Vaak werken er meerdere developers aan hetzelfde project. Code Conventions zorgen ervoor dat de code voor iedereen leesbaar is
*   Je hebt veel meer overzicht over je code


##### Hoe bepaal je de naam?

###### Bij Classes:

Code | Conventie
:-----------|:------------
public class Enemy | De naam van je Class is altijd in het engels en begint met een hoofdletter
public class EnemyShip | Als je Class naam uit meerdere woorden bestaat: gebruik PascalCasing

###### Variables

Code | Conventie
:-----------|:------------
private var speed : Number; | De naam van je variabele is altijd in het engels en begint met een kleine letter
private var scrollSpeed : Number; | Als de naam van je variabele uit meerdere woorden bestaat: gebruik camelCasing
public static const SHOOT : String = “shoot”; | Een constant is altijd met hoofdletters geschreven

###### Functions / methods

Code | Conventie
:-----------|:------------
run(); | De naam van je method is altijd in het engels en begint met een kleine letter
runFast(); | Als de naam van je method uit meerdere woorden bestaat: gebruik camelCasing
shoot(); | De naam van je method is een werkwoord: shoot, drive, walk, run, etc.

### Declarations (het aanmaken van je variabelen)
#### Plaatsing
Declareer je variabelen alleen aan het begin van een block. Wacht niet met het declareren van je variabelen totdat je ze gaat gebruiken. Dit maakt je code verwarrend en niet overzichtelijk.

```as3
public function myMethod() : void
{
    var int1 : int;     	// beginning of method block
	if (condition)
	{
    		var int2 : int; 	// beginning of "if" block
    		...
	}
}
```

#### Aantal declaraties per regel
Zet 1 declaratie per lijn regel. Hierdoor is het makkelijker om comments toe te voegen.

###### Goed voorbeeld: 
```as3
var level : int; // indentation level
var size : int;  // size of table
```

###### Slecht voorbeeld:
```
var level : int, size : int;
```

Extra:
De voorbeelden hierboven gebruiken een spatie tussen het type van de variabele (bijvoorbeeld int) en de naam. Je mag hier ook een tab voor gebruiken.
```as3
var level         	: 	int;	   	// indentation level
var size          	: 	int;   		// size of table
var currentEntry	: 	Object;		// currently selected table entry
```

#### Gebruik referenties
Gebruik lokale variabelen om referenties aan te maken naar complexe object benamingen. Dit verbetert de leesbaarheid van je code + je maakt minder fouten in je code.

###### Slecht voorbeeld:
```as3
var l : uint = gameTower[i].bullet.length;
for(var i : uint = 0; i < l ; i++)
{
if(gameTower[i].bullet[j].x > stageWidth || gameTower[i].bullet[j].y > stageHeight )
{
	removeChild(gameTower[i].bullet[j]);
}
}
```
###### Goed voorbeeld:
```as3
var bullet : Bullet;
var l : uint = gameTower[i].bullet.length;
for(var i : uint = 0; i < l ; i++)
{
bullet = gameTower[i].bullet[j];
if(bullet.x > stageWidth || bullet.y > stageHeight )
{
	removeChild(bullet);
}
}
```
Belangrijk:
Declareer altijd je variabelen buiten een loop. Anders gaat je applicatie elke keer een plek vrij maken in het geheugen. Dit kost performance.

 
### Wat is de vorm van een statement
#### if, if-else, if-else-if-else statement
De if-else heeft de volgende vorm:
```as3
if(condition)
{
  	statements;
}
 
if(condition)
{
  	statements;
}
else
{
  	statements;
}
 
if(condition)
{
  	statements;
}
else if (condition)
{
  	statements;
}
else if (condition)
{
  	statements;
}
```
###### Extra:
Gebruik altijd brackets {} in je if-else statements. Dit maakt je if-else statement een stuk leesbaarder dan bijvoorbeeld onderstaand voorbeeld. Hier zijn de brackets weggelaten. Dit kan als de statement maar uit 1 regel bestaat. Maar het is niet goed leesbaar voor andere developers.
```as3
if (condition)
statement;
```

#### for Statements
 
De for statement heeft de volgende vorm:
```as3
for (initialization;condition;update)
{
  	statements;
}
```

Tip: Maak je de namen van je variabelen in je for loop altijd zo kort mogelijk (bijvoorbeeld: i, l, j). Hoe korter de naam van een variabele, hoe beter de performance.

Tip: Probeer altijd een lokale variable aan te maken waarin je het aantal loops zet (vooral als je bijvoorbeeld met array.length werkt). Anders moet je applicatie steeds opnieuw in het geheugen berekenen hoeveel array.length is. Hierdoor wordt je performance een stuk beter.

###### Goed voorbeeld:
```as3
var l : uint = bullets.length;
for (var i : uint = 0;i < l;i++)
{
  	statements;
}
```
###### Slecht voorbeeld:
```as3
for (var i : uint = 0;i < bullets.length;i++)
{
  	statements;
}
```
Tip: Voeg altijd een ‘break;’ toe aan je loop op het moment dat je hebt gevonden wat je zoekt. Voorbeeld:
```as3
var l : uint = names.length;
for (var i : uint = 0;i < l;i++)
{
if(names[i] == searchValue)
{
	…..
	break;
}
}
```
### Best Practices
#### DRY - Don’t Repeat Yourself

Voorkom dubbele code. Je wilt niet steeds op meerdere plekken dezelfde dingen moeten aanpassen als je je code wilt uitbreiden. Stel je wilt de functie shoot() uitbreiden door een snelheid mee te geven shoot(15). In het slechte voorbeeld moet je dit op meerdere plekken aanpassen.

###### Slecht voorbeeld:
```as3
var randomNumber : int = Math.random() * towers.length; // bepaal random een tower

if(randomNumber == 0)
{
	tower0.aim(mouseX, mouseY);
	tower0.shoot();
} else if(randomNumber == 1)
{
	tower1.aim(mouseX, mouseY);
	tower1.shoot();
} else if(randomNumber == 3)
{
	tower2.aim(mouseX, mouseY);
	tower2.shoot();
}
```
###### Goed voorbeeld:
```as3
var shootingTower : Tower;
var randomNumber : int = Math.random() * towers.length; // bepaal random een tower

if(randomNumber == 0)
{
	shootingTower = tower0;
} else if(randomNumber == 1)
{
	shootingTower = tower1;
} else if(randomNumber == 3)
{
	shootingTower = tower2;
}

shootingTower.aim(mouseX, mouseY);
shootingTower.shoot();
```
De verschillende Code Conventions staan in de voorbeeld bestanden in deze hoofdmap.

Op dit moment zijn er de volgende Code Conventions:

- GetterSetter.as -> hoe en waarom gebruik je get & set -> https://github.com/macollegegamedevelopment/codeconventions/blob/master/GetterSetter.as
- StronglyTypedObjects.as -> hoe en waarom gebruik je data typen -> https://github.com/macollegegamedevelopment/codeconventions/blob/master/Dependencies.as

De bestanden in de map 'objects' bestaan alleen maar ter voorbeeld van de Code Conventions.
