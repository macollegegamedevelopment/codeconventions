package objects 
{
	import flash.display.Sprite;
	/**
	 * ...
	 * @author Berend Weij
	 */
	public class Turret 
	{
		
		private var _graphic : Sprite;
		
		public function Turret() 
		{
			graphic = new Sprite();
		}
		
		public function rotate(value : Number) : void
		{
			// de uiteindelijke logica om de graphic te roteren zit  hier in de Turret Class
			// hierdoor heeft niemand er last van als we hier de logica aanpassen
			// we passen iets op 1 plek aan en dan werkt het overal
			graphic.rotation = value;
		}
		
		public function get graphic():Sprite 
		{
			return _graphic;
		}
		
		public function set graphic(value:Sprite):void 
		{
			_graphic = value;
		}
		
	}

}