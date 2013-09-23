package codeconventions.objects {

	public class User {
		private var _age : int;

		public function get age() : int
		{
			return _age;
		}

		public function set age(age : int) : void
		{
			_age = age;
		}
		
	}
}
