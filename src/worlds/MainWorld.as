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
		
		public function MainWorld() {
			var player:Player = new Player(50, 50, assets.playerIMG, "player", 10);
			player.setPos(100, 100);
			Input.define("left", Key.LEFT);
			Input.define("right", Key.RIGHT); 
			Input.define("up", Key.UP);
			Input.define("down", Key.DOWN);
			player.setInputMap("left", "right", "down", "up");
			
			add(new Map());
			add(player);
		}
		
		override public function begin(): void {
			
		}
		
		override public function update(): void {
			super.update();
		}
		
	}

}