package codeconventions.objects {
	
	public class Settings {
		
		private var _volume 		:	int;
		private var _soundDirectory	:	String;
		
		public function get volume() : int
		{
			return _volume;
		}

		public function set volume(value : int) : void
		{
			_volume = value;
		}

		public function get soundDirectory() : String
		{
			return _soundDirectory;
		}

		public function set soundDirectory(value : String) : void
		{
			_soundDirectory = value;
		}
		
	}
}
