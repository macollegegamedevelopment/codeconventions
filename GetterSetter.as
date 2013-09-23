package codeconventions {
	import flash.display.Sprite;

	public class GetterSetter extends Sprite {
		
		// 1 van de meest belangrijke punten voor OOP (object oriented programming) is encapsulation
		// encapsulation betekent letterlijk inkapseling. Je schermt je variabelen en methoden af van de buitenwereld
		// dit doe je door alleen de noozakelijke methoden public te maken
		// dit geldt ook voor variabelen. Maak variabelen alleen public als ze onderdeel zijn van een 'core' game onderdeel
		// waarbij je alle performance kunt gebruiken (bijvoorbeeld particles). Als dit niet het geval is: gebruik een Get en een Set voor de variabele
				
		private static const MINIMUM_RADIUS	:	Number	=	5;
		
		private var _speed	:	Number;
		private var _radius :	Number;
			
		// voorbeeld van een gewone get en set	
		public function get speed() : Number
		{
			return _speed;
		}

		public function set speed(speed : Number) : void
		{
			_speed = speed;
		}	
		
		// voorbeeld van een get en set met een voorwaarde + extra actie in de set
		public function get radius() : Number
		{
			return _radius;
		}

		public function set radius(value : Number) : void
		{
			// in een set kun je nog kijken of de waarde wel voldoet aan een bepaalde voorwaarde
			if(value > MINIMUM_RADIUS)
			{
				_radius = value;
				
				// je bepaald zelf in een set of je nog meer wilt doen dan alleen het opslaan van de waarde
				this.graphics.drawCircle(0, 0, _radius);
			}
			else
			{
				// we zouden nu een error kunnen geven
			}
		}

	}
}
