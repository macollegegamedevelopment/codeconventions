package objects
{
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.MouseEvent;
	
	/**
	 * ...
	 * @author Berend Weij
	 */
	public class Tower extends Sprite 
	{
		public static const SHOOT : String = "shoot";
		
		private var _turret	: Turret;
		
		public function Tower() 
		{
			turret = new Turret();
			
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
			
		}
		
		private function init(e:Event = null):void 
		{
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.addEventListener(MouseEvent.CLICK, shoot);
		}
		
		public function turretRotation( value : Number ) : void
		{
			// De tower roept weer iets aan bij de turret
			turret.rotate(value);
		}	
		
		public function shoot(e : MouseEvent) : void
		{
			trace('shoot function');
			
			// hier dispatchen we een event
			// we schreeuwen door de applicatie heen dat er wordt geschoten
			// andere Classes kunnen hier naar luisteren zodat ze erop kunnen reageren (bijvoorbeeld met geluid)
			dispatchEvent(new Event(SHOOT));
		}
		
		public function get turret():Turret 
		{
			return _turret;
		}
		
		public function set turret(value:Turret):void 
		{
			_turret = value;
		}
		
	}

}