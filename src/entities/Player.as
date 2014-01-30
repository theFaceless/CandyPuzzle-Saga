package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.utils.Draw;
	import net.flashpunk.Sfx;
	
	import world.Lost;
	import world.Manager
	
	/**
	 * ...
	 * @author Axel Faes
	 */
	public class Player extends Entity
	{
		protected var speed:Number;
		protected var l:String, r:String, u:String, d:String;

		public function Player() 
		{
			//to use player:
			//call init
			//call setpos
			//call setInputMap
		}
		
		//initiate the player
		public function init(w:int, h:int, sprite: Class, type: String, speed:int):void {
			setSize(w, h);
			makeImg(sprite);
			
			setSpeed(speed);
			
			this.type = type;
		}
		
		public function makeImg(sprite: Class) {
			var img:Image = new Image(sprite);
			img.scaledHeight = height;
			img.scaledWidth = width;
			
			graphic = img;
		}
		
		public function setSpeed(sp:int):void {
			speed = sp;
		}
		
		//destroy the player
		public function destroy():void {
			FP.world.remove(this);
		}
		
		//set the size
		public function setSize(width:int, height:int):void {
			this.width = width;
			this.height = height;
		}
		
		//set the position
		public function setPos(xpos:int, ypos: int): void {
			x = xpos;
			y = ypos;
		}
		
		//update the player
		override public function update():void { 
			processInput();
		}
		
		public function setInputMap(l: String, r:String, d:String, u:String):void {
			this.l = l;
			this.r = r;
			this.d = d;
			this.u = u;
		}
		
		public function notColliding(xn:int, yn:int):Boolean {
			return !collide("solid", xn, yn);
		}
		
		//process incoming input
		protected function processInput():void {
			var sp:Number = speed;
			
			if (Input.check(u) && notColliding(x, y-sp) && y-sp>0) {
				y -= sp;
			}
			if (Input.check(d) && notColliding(x, y+sp) && y+height+sp < FP.width) {
				y += sp;
			}
			
			if (Input.check(l) && notColliding(x-sp, y) && x-sp>0) {
				x -= sp;
			}
			if (Input.check(r) && notColliding(x+sp, y) && x+width+sp < FP.width) {
				x += sp;
			}
		}
		
	}

}