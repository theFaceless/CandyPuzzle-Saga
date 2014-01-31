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
		
		protected var speed:int;
		protected var image:Image;
		
		protected var startX:int;
		protected var startY:int;
		protected var hasMoved: Boolean;

		public function Player(maze: int, startTileX: int, startTileY: int) {
			super();
			speed = References.SPEED;
			x = Map.getXBytileX(maze, startTileX);
			y = Map.getYBytileY(maze, startTileY);
			
			this.startX = x;
			this.startY = y;
		}
		
		override public function added(): void {
			image = new Image(assets.playerIMG);
			image.centerOrigin();
			graphic = image;
			setHitbox(image.width, image.height, -(image.width / 2), -(image.height / 2));
			
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
			return Boolean (collideWith(MainWorld.map, x - image.width, y - image.height));
		}
		
		
		//process incoming input
		protected function processInput():void {
			hasMoved = false;
			var i: int;
			var speed: int;
			if (Input.check(Key.UP)) {
				for (speed = this.speed; speed > 0; speed--) {
					for (i = 0; i < 10 && !hasMoved; i++ ) {
						if (!collideWithMap(x + i, y - speed)) {
							y -= speed;
							x += i;
							hasMoved = true;
						}
						else if (!collideWithMap(x - i, y - speed)) {
							y -= speed;
							x -= i;
							hasMoved = true;
						}
					}
				}
				
			}
			else if (Input.check(Key.DOWN)) {
				for (speed = this.speed; speed > 0; speed--) {
					for (i = 0; i < 10 && !hasMoved; i++ ) {
						if (!collideWithMap(x + i, y + speed)) {
							y += speed;
							x += i;
							hasMoved = true;
						}
						else if (!collideWithMap(x - i, y + speed)) {
							y += speed;
							x -= i;
							hasMoved = true;
						}
					}
				}
				
			}
			else if (Input.check(Key.LEFT)) {
				for (speed = this.speed; speed > 0; speed--) {
					for (i = 0; i < 10 && !hasMoved; i++ ) {
						if (!collideWithMap(x - speed, y + i)) {
							x -= speed;
							y += i;
							hasMoved = true;
						}
						if (!collideWithMap(x - speed, y - i)) {
							x -= speed;
							y -= i;
							hasMoved = true;
						}
					}
				}
			}
			else if (Input.check(Key.RIGHT)) {
				for (speed = this.speed; speed > 0; speed--) {
					for (i = 0; i < 10 && !hasMoved; i++ ) {
						if (!collideWithMap(x + speed, y + i)) {
							x += speed;
							y += i;
							hasMoved = true;
						}
						if (!collideWithMap(x + speed, y - i)) {
							x += speed;
							y -= i;
							hasMoved = true;
						}
					}
				}
			}
			
			if (Input.check(Key.R)){
				x = startX;
				y = startY;
			}
		}
		
		
		
	}

}