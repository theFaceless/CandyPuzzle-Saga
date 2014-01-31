package worlds 
{
	import adobe.utils.CustomActions;
	import entities.Candy;
	import entities.Map;
	import entities.Player;
	import net.flashpunk.World;
	import utils.WorldSwitcher;
	
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
			
			//add maps here (3/ 4)
			if (mapId == 0) {
				playerTopLeft = new Player(Map.TOPLEFT, 0, 0);
				playerTopRight = new Player(Map.TOPRIGHT, 5, 0);
				playerBottomLeft = new Player(Map.BOTTOMLEFT, 0, 0);
				playerBottomRight = new Player(Map.BOTTOMRIGHT, 2, 2);
				
				candyTopLeft = new Candy(Map.TOPLEFT, 8, 5);
				candyTopRight = new Candy(Map.TOPRIGHT, 3, 3);
				candyBottomLeft = new Candy(Map.BOTTOMLEFT, 8, 0);
				candyBottomRight = new Candy(Map.BOTTOMRIGHT, 3, 0);	
			}
			else if (mapId == 1) {
				playerTopLeft = new Player(Map.TOPLEFT, 0, 0);
				playerTopRight = new Player(Map.TOPRIGHT, 0, 0);
				playerBottomLeft = new Player(Map.BOTTOMLEFT, 0, 0);
				playerBottomRight = new Player(Map.BOTTOMRIGHT, 0, 0);
				
				candyTopLeft = new Candy(Map.TOPLEFT, 2, 3);
				candyTopRight = new Candy(Map.TOPRIGHT, 7, 5);
				candyBottomLeft = new Candy(Map.BOTTOMLEFT, 5, 5);
				candyBottomRight = new Candy(Map.BOTTOMRIGHT, 7, 5);
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
				WorldSwitcher.switchToWonScreen();
				
			if (Input.pressed(Key.ESCAPE)){
				WorldSwitcher.switchToMain();
			}
		}
		
	}

}