package utils 
{
	
	import net.flashpunk.FP;
	import worlds.MainMenu;
	import worlds.MainWorld;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class WorldSwitcher {
		
		public static function switchToMain(): void {
			FP.world = new MainMenu();
		}
		
		public static function switchToMap(id: int): void {
			FP.world = new MainWorld(id);
		}
		
	}

}