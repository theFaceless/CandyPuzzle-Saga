package utils 
{
	/**
	 * ...
	 * @author ...
	 */
	public class Util 
	{
		
		public static function randomNumber(min:int, max:int):int {
			return Math.floor(Math.random() * (1 + max - min) + min);
		}

		
	}

}