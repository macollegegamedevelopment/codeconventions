using UnityEngine;
using System.Collections;

/// <summary>
/// 1 van de meest belangrijke punten voor OOP (object oriented programming) is encapsulation
// encapsulation betekent letterlijk inkapseling. Je schermt je variabelen en methoden af van de buitenwereld
// dit doe je door alleen de noozakelijke methoden public te maken
// dit geldt ook voor variabelen.
/// </summary>

public class Weapon {

	// alle variabelen zijn private
	private string name;
	
	// power maken we ook private, niemand mag daar direct bij
	private int power = 3;
	private int maxPower = 10;

	public Weapon(string name){
		this.name = name;
	}

	// Als we andere Classes toch toegang willen geven tot 'power', dan maken we een getter & setter
	// we zorgen er zo alleen wel voor dat Weapon.cs zelf kan kijken of hij het eens is wat er met hem gebeurd
	// voorbeeld:
	// Weapon gun = new Weapon();
	// Debug.log(gun.Power); // get Power
	// gun.Power = 5; // set the Power of this weapon
	public int Power {
		get {
			return power;
		}
		set {
			// als iemand van buitenaf de Power zet van dit wapen, dan mag
			// dat niet hoger zijn dan de maxPower. Dit kan ook met Mathf.Min(value, maxPower)
			if(value > maxPower){
				value = maxPower;
			}
			power = value;
		}
	}

	/// <summary>
	/// Aim this instance.
	/// </summary>
	public void Aim(){
	}

	public void Shoot(){
	}

	public void Arm(){
	}
}
