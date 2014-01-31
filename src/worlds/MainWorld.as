package worlds 
{
	import adobe.utils.CustomActions;
	import entities.Candy;
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
		
		public static var map: Map = new Map(0);
		
		public static var playerTopLeft: Player;
		public static var playerTopRight: Player;
		public static var playerBottomLeft: Player;
		public static var playerBottomRight: Player;
		
		public static var candyTopLeft: Candy;
		public static var candyTopRight: Candy;
		public static var candyBottomLeft: Candy;
		public static var candyBottomRight: Candy;
		
		public function MainWorld(mapId: int = 0) {
			super();
			map = new Map(mapId);
			if (mapId <= 0) {
				playerTopLeft = new Player(40, 40);
				playerTopRight = new Player(760, 40);
				playerBottomLeft = new Player(40, 560);
				playerBottomRight = new Player(760, 560);
				
				candyTopLeft = new Candy(40, 40);
				candyTopRight = new Candy(760, 40);
				candyBottomLeft = new Candy(40, 560);
				candyBottomRight = new Candy(760, 560);
				
			}
		}
		
		override public function begin(): void {
			add(map);
			add(playerTopLeft);
			add(playerTopRight);
			add(playerBottomLeft);
			add(playerBottomRight);
			add(candyTopLeft);
			add(candyTopRight);
			add(candyBottomLeft);
			add(candyBottomRight);
		}
		
		override public function update(): void {
			super.update();
		}
		
	}

}