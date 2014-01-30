package worlds 
{
	import entities.Map;
	import entities.Player;
	import net.flashpunk.World;
	
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.FP;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class MainWorld extends World
	{
		
		public static var map: Map = new Map();
		public static var playerTopLeft: Player = new Player(40, 40);
		public static var playerTopRight: Player = new Player(760, 40);
		public static var playerBottomLeft: Player = new Player(40, 560);
		public static var playerBottomRight: Player = new Player(760, 560);
		
		public function MainWorld() {
			super();
		}
		
		override public function begin(): void {
			add(map);
			add(playerTopLeft);
			add(playerTopRight);
			add(playerBottomLeft);
			add(playerBottomRight);
		}
		
		override public function update(): void {
			super.update();
		}
		
	}

}