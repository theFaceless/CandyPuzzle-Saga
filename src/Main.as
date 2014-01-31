package 
{
	import flash.display.Sprite;
	import flash.events.Event;
	import net.flashpunk.Engine;
	import worlds.MainMenu;
	import worlds.MainWorld;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class Main extends Engine
	{
		
		public static var mainWorld: MainWorld;
		
		public function Main():void 
		{
			super(800, 600, 30, true);
		}
		
		override public function init():void 
		{
			super.init();
			FP.world = new MainMenu();
		}
		
	}
	
}