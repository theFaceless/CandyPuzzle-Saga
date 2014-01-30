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

		public function Player(startX: int, startY: int) {
			super();
			this.speed = References.SPEED;
			this.x = startX;
			this.y = startY;
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
		
		
		
		public function setInputMap(l: String, r:String, d:String, u:String):void {
			this.l = l;
			this.r = r;
			this.d = d;
			this.u = u;
		}
		
		
		//process incoming input
		protected function processInput():void {
			
			if (Input.check(Key.UP) && !collideWith(MainWorld.map,x-image.width/2,y-speed-image.height/2)) {
				y -= speed;
				
			}
			if (Input.check(Key.DOWN) && !collideWith(MainWorld.map,x-image.width/2,y+speed-image.height/2)) {
				y += speed;
			}
			
			if (Input.check(Key.LEFT) && !collideWith(MainWorld.map,x-speed-image.width/2,y-image.height/2)) {
				x -= speed;
			}
			if (Input.check(Key.RIGHT)&& !collideWith(MainWorld.map,x+speed-image.width/2,y-image.height/2)) {
				x += speed;
			}
		}
		
	}

}