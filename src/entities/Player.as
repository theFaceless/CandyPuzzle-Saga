package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.masks.Pixelmask;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.Sfx;
	import worlds.MainWorld;
	
	/**
	 * ...
	 * @author Axel Faes
	 */
	public class Player extends Entity {
		
		protected var speed:Number;
		protected var l:String, r:String, u:String, d:String;
		protected var image:Image;
		
		protected var startX:int;
		protected var startY:int;

		public function Player(startX: int, startY: int) {
			super();
			this.speed = References.SPEED;
			this.x = startX;
			this.y = startY;
			
			this.startX = startX;
			this.startY = startY;
		}
		
		override public function added(): void {
			image = new Image(assets.playerIMG);
			image.centerOrigin();
			graphic = image;
			setHitbox(image.width, image.height, 0, 0);
			
		}
		
		override public function update():void { 
			this.processInput();
		}
		
		/**
		 * collision with the map
		 * @param	x
		 * @param	y
		 */
		public function collideWithMap(x:int, y:int):Boolean {
			return Boolean (collideWith(MainWorld.map, x, y));
		}
		
		
		//process incoming input
		protected function processInput():void {
			if (Input.check(Key.UP) && !collideWithMap(x-image.width/2,y-speed-image.height/2)) {
				y -= speed;
				
			}
			if (Input.check(Key.DOWN) && !collideWithMap(x-image.width/2,y+speed-image.height/2)) {
				y += speed;
			}
			
			if (Input.check(Key.LEFT) && !collideWithMap(x-speed-image.width/2,y-image.height/2)) {
				x -= speed;
			}
			if (Input.check(Key.RIGHT)&& !collideWithMap(x+speed-image.width/2,y-image.height/2)) {
				x += speed;
			}
		}
		
	}

}