package codeconventions {
	import flash.display.Sprite;

	public class Dependencies extends Sprite {
		
		// Als developer wil je dat je Classes zo min mogelijk afhankelijk van elkaar zijn
		// Dit bereik je door goed op 'decoupling' te letten (decoupling = het loskoppelen van code)
		// Je wil dat Classes niet 'te diep' van elkaar afhankelijk zijn
		// In deze Class zien jullie een eerste aantal opties voor decoupling
		// Decoupling zorgt voor:
		// - je code is beter te onderhouden
		// - beter voor samenwerken
		// - je werkt meer in modules (hergebruik)
		// - je hebt meer overzicht
		// later dit jaar zullen we ook kijken naar Design Patterns die decoupling vermijden
		// + dependency injection
		
		public function Dependencies():void 
		{
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			
			// We maken de toren aan
			var tower : Tower = new Tower();
			addChild(tower);
			
			
			// fout voorbeeld
			// Dit is een 'Tightly coupled' manier van iets aanspreken
			// Je bent nu heel erg afhankelijk van de structuur. Als iemand iets verandert aan tower, turret of graphic
			// dan werkt je code niet meer
			tower.turret.graphic.rotation	=	45;
			
			// goed voorbeeld
			// je hebt op de Tower een public function turretRotation
			// hiermee bepaal je een 'interface' voor de Class Tower
			// alle andere classes kunnen aankloppen bij Tower om de turret te draaien
			// nu heb je geen stricte koppeling meer met de objecten BINNEN Tower
			// de logica is afgeschermd voor de Classes buiten Tower
			tower.turretRotation	=	45;
			
			
			// Door gebruik te maken van Events en EventListener zorg je ervoor dat er geen
			// harde koppelingen zijn tussen Classes. De Class Tower 'roept' het event SHOOT.
			// Daar mogen andere Classes naar luisteren.
			tower.addEventListener(Tower.SHOOT, onShoot);
			
		}
		
		private function onShoot(e : Event) : void
		{
			trace('shoot');
		}

	}
}
