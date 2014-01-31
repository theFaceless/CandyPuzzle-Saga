package utils 
{
	
	import net.flashpunk.FP;
	import worlds.MainMenu;
	import worlds.MainWorld;
	import worlds.WonScreen;
	
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
		
		public static function switchToWonScreen(): void {
			FP.world = new WonScreen();
		}
		
	}

}