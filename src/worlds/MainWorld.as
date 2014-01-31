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
			//testing code
			mapId = -1;
			//end of testing code
			map = new Map(mapId);
			if (mapId <= 0) {
				playerTopLeft = new Player(map.getXBytileX(0, 0), map.getYBytileY(0, 0));
				playerTopRight = new Player(map.getXBytileX(1, 0), map.getYBytileY(0, 0));
				playerBottomLeft = new Player(map.getXBytileX(0, 0), map.getYBytileY(1, 0));
				playerBottomRight = new Player(map.getXBytileX(1, 0), map.getYBytileY(1, 0));
				
				candyTopLeft = new Candy(map.getXBytileX(0, 2), map.getYBytileY(0, 3));
				candyTopRight = new Candy(map.getXBytileX(1, 7), map.getYBytileY(0, 5));
				candyBottomLeft = new Candy(map.getXBytileX(0, 5), map.getYBytileY(1, 5));
				candyBottomRight = new Candy(map.getXBytileX(1, 7), map.getYBytileY(1, 5));
				
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
			
			if (candyTopLeft.isHit(playerTopLeft.x, playerTopLeft.y) &&
				candyTopRight.isHit(playerTopRight.x, playerTopRight.y) &&
				candyBottomLeft.isHit(playerBottomLeft.x, playerBottomLeft.y) &&
				candyBottomRight.isHit(playerBottomRight.x, playerBottomRight.y))
				trace("won");
			
			
		}
		
	}

}