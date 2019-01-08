codeconventions
===============

#### Ma Game Development


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
private int _speed | De naam van je variabele is altijd in het engels en begint met een underscore, gevolgd door een kleine letter
private int _scrollSpeed | Als de naam van je variabele uit meerdere woorden bestaat: gebruik camelCasing
public const string HowToPlay = "howToPlay"; | Een constant schrijf je d.mv. PascalCasing

Properties (getters/setters) starten met een hoofdletter.

###### Functions / methods

Code | Conventie
:-----------|:------------
Run(); | De naam van je method is altijd in het engels en begint (in C#) met een hoofdletter
RunFast(); | Als de naam van je method uit meerdere woorden bestaat: gebruik PascalCasing
Shoot(); | De naam van je method is een werkwoord: shoot, drive, walk, run, etc.

### Declarations (het aanmaken van je variabelen)
#### Plaatsing
Declareer je variabelen alleen aan het begin van een block. Wacht niet met het declareren van je variabelen totdat je ze gaat gebruiken. Dit maakt je code verwarrend en niet overzichtelijk.

```c#
public void myMethod(){
	int int1;     	// beginning of method block
	if (condition){
    		int int2; 	// beginning of "if" block
    		...
	}
}
```

#### Aantal declaraties per regel
Zet 1 declaratie per lijn regel. Hierdoor is het makkelijker om comments toe te voegen.

###### Goed voorbeeld: 
```c#
int level; // indentation level
int size;  // size of table
```

#### Gebruik referenties
Gebruik lokale variabelen om referenties aan te maken naar complexe object benamingen. Dit verbetert de leesbaarheid van je code + je maakt minder fouten in je code.

###### Slecht voorbeeld:
```c#
int l = gameTower[i].bullet.Count;
for (int i = 0; i < l; i++){
	if(gameTower[i].bullet[j].position.x > stageWidth || gameTower[i].bullet[j].position.y > stageHeight ){
		Destroy(gameTower[i].bullet[j].gameObject);
	}
}
```
###### Goed voorbeeld:
```c#
Bullet bullet;
int l = gameTower[i].bullet.Count;
for (int i = 0; i < l; i++){
	bullet = gameTower[i].bullet[j];
	if(bullet.position.x > stageWidth || bullet.position.y > stageHeight )
		Destroy(bullet.gameObject);
	}
}
```
Belangrijk:
Declareer altijd je variabelen buiten een loop. Anders gaat je applicatie elke keer een plek vrij maken in het geheugen. Dit kost performance.

 
### Wat is de vorm van een statement
#### if, if-else, if-else-if-else statement
De if-else heeft de volgende vorm:
```c#
if(condition){
  	statements;
}
 
if(condition){
  	statements;
} else {
  	statements;
}
 
if(condition){
  	statements;
} else if (condition){
  	statements;
} else if (condition){
  	statements;
}
```
###### Extra:
Gebruik altijd brackets {} in je if-else statements. Dit maakt je if-else statement een stuk leesbaarder dan bijvoorbeeld onderstaand voorbeeld. Hier zijn de brackets weggelaten. Dit kan als de statement maar uit 1 regel bestaat. Maar het is niet goed leesbaar voor andere developers.
```c#
if (condition)
statement;
```

#### for Statements
 
De for statement heeft de volgende vorm:
```c#
for (initialization;condition;update){
  	statements;
}
```

Tip: Probeer altijd een lokale variable aan te maken waarin je het aantal loops zet (vooral als je bijvoorbeeld met array.length/list.Count werkt). Anders moet je applicatie steeds opnieuw in het geheugen berekenen hoeveel de lengte is. Hierdoor wordt je performance een stuk beter.

###### Goed voorbeeld:
```c#
int l = bullets.Count;
for (int i = 0;i < l;i++){
  	statements;
}
```
###### Slecht voorbeeld:
```c#
for (int i = 0;i < bullets.Count;i++){
  	statements;
}
```
Tip: Voeg altijd een ‘break;’ toe aan je loop op het moment dat je hebt gevonden wat je zoekt. Voorbeeld:
```c#
int l = names.Count;
for (int i = 0;i < l;i++){
if(names[i] == searchValue){
	…..
	break;
}
}
```
### Best Practices
#### DRY - Don’t Repeat Yourself

Voorkom dubbele code. Je wilt niet steeds op meerdere plekken dezelfde dingen moeten aanpassen als je je code wilt uitbreiden. Stel je wilt de functie Shoot() uitbreiden door een snelheid mee te geven Shoot(15). In het slechte voorbeeld moet je dit op meerdere plekken aanpassen.

###### Slecht voorbeeld:
```c#
int randomNumber = Random.Range(0, towers.Count); // bepaal random een tower

if(randomNumber == 0){
	tower0.Aim(mouseX, mouseY);
	tower0.Shoot();
} else if(randomNumber == 1){
	tower1.Aim(mouseX, mouseY);
	tower1.Shoot();
} else if(randomNumber == 3){
	tower2.Aim(mouseX, mouseY);
	tower2.Shoot();
}
```
###### Goed voorbeeld:
```C#
Tower shootingTower;
int randomNumber = Random.Range(0, towers.Count); // bepaal random een tower

if(randomNumber == 0){
	shootingTower = tower0;
} else if(randomNumber == 1){
	shootingTower = tower1;
} else if(randomNumber == 3){
	shootingTower = tower2;
}

shootingTower.Aim(mouseX, mouseY);
shootingTower.Shoot();
```

#### Alles is standaard private

Variabelen zijn ALTIJD private. Als je andere Classes toegang wilt geven tot de variabelen dan maak je gebruik van getters&setters (zie onderaan deze pagina voor een voorbeeld).
Functies zijn standaard private. Sommige maak je public op het moment dat je zeker weet dat andere Classes erbij moeten mogen.
Hierdoor krijgen Classes een nette API (denk aan de les over 'interfaces'). Ook voorkom je zo dat niet elke Class elkaars gegevens mag aanpassen.

#### Single Responsibility Principle

Elke Class heeft maar 1 verantwoordelijkheid.
###### Slecht voorbeeld: meerdere verantwoordelijkheden in 1 Class
Classname | Verantwoordelijkheid
:-----------|:------------
Player.cs | Een Class die alles bevat wat de player moet doen (springen, schieten, naar de pijltjes toetsen kijken).
###### goed voorbeeld: verantwoordelijkheden netjes opgedeeld
Classname | Verantwoordelijkheid
:-----------|:------------
PlayerMovement.cs | Een Class die de beweging van de Player als verantwoordelijkheid heeft
KeyboardInput.cs | Class met als verantwoordelijkheid naar keyboard input te luisteren en vervolgens functies aan te roepen op de player.

###### Slecht voorbeeld:
Classname | Verantwoordelijkheid
:-----------|:------------
Tiles.cs | Een Class die alle tiles beheerd en rendert
###### goed voorbeeld:
Classname | Verantwoordelijkheid
:-----------|:------------
Tiles.cs | Een Class die alle tiles beheerd  
TilesRenderer.cs | Een Class die alle tiles rendert

Als je Class maar 1 verantwoordelijkheid heeft zorgt ervoor dat je code minder strict gekoppeld is. Als je bijvoorbeeld voor de tiles hierboven wilt switchen tussen een WebGL renderer, Div renderer of een Canvas renderer (JavaScript in je browser) dan hoef je alleen maar TilesRenderer.cs te vervangen. Tiles.cs blijft onaangepast.
Of als je bij de Player wilt switchen naar een TouchInput.cs (touch devices) dan hoef je niets aan te passen aan PlayerMovement.cs.

###### CRC - Class-responsibility-collaboration cards
Om SRP (Single Responsibility Principle) goed toe te passen, kun je gebruik maken van CRC cards. Hiervoor gebruik je A6-jes.
Schrijf op een A6-je de naam van de Class + de responsiblity + de Classes waar deze Class mee samenwerkt.

![alt text](https://github.com/macollegegamedevelopment/codeconventions/blob/master/images/crc.jpg)

Naast bovenstaande Code Conventions zijn er ook een aantal voorbeeld bestanden.

- Weapon.cs -> hoe en waarom gebruik je get & set -> https://github.com/macollegegamedevelopment/codeconventions/blob/master/Weapon.cs
