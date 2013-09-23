package codeconventions {
	
	import codeconventions.objects.User;
	import codeconventions.objects.Settings;

	// Strongly Typed Objects zorgen voor:
	// - Duidelijkheid voor alle developers wat er in een variabele kan zitten
	// - Code completion: aangezien je programma weet wat er met de variabele mogelijk is
	// - Je krijgt bij een fout eerder een compile-time error dan een runtime error
	public class StronglyTypedObjects {
		
		// Maak je variabelen en methoden/functies altijd 'strongly typed'
		// Dit doe je door aan te geven van wat voor eentype een variabele is: int, String, Number, etc.
		public static const UPDATE	:	String	=	"update";
		
		private var _speed			:	Number	=	10;
		private var	_name			:	String;
		private var _users			:	Vector.<User>;
		private var _settingsWrong	:	Object;
		private var _settingsGood	:	Settings;
		
		public function StronglyTypedObjects() : void
		{
			
			// wil je variabelen opslaan in een object? Doe dit ook altijd strongly typed
			// _settingsWrong is van het type 'Object' en zodoende weet je niet wat er allemaal in kan zitten
			// _settingsGood is van het type 'Settings'. Hierdoor weet zowel jij, je mede developers als de compiler wat er allemaal in mag zitten
						
			// fout voorbeeld:
			_settingsWrong						=	new Object();
			_settingsWrong.volume				=	5;
			_settingsWrong.zomaarEenVariabele	=	"testWaarde";
			_settingsWrong.allesMagInEenObject	=	500000;
			
			// goed voorbeeld:
			_settingsGood						=	new Settings();
			_settingsGood.volume				=	5;
			_settingsGood.soundDirectory		=	"/audio/sfx/";
			
			
			// probeer daar waar mogelijk inplaats van een Array een Vector te gebruiken
			// Een vector is een array waarin alle elementen van dezelfde data type moeten zijn
			_users					=	new Vector.<User>();
			
			// ook lokale variabelen moeten een data type meekrijgen
			var newUser	:	User	=	new User();
			newUser.age				=	30;
			
			// goed voorbeeld:
			// newUser mogen we wel in de vector zetten 
			_users.push(newUser);
			
			// fout voorbeeld:
			// er mogen geen nummers in deze Vector worden gezet
			_users.push(5);
			
			// de vector heeft ook code completion
			trace(_users[0].age);
			
		}
		
		
	}
}
