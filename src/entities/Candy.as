package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class Candy extends Entity
	{
		
		private var image: Image;
		
		public function Candy(x: int, y: int) {
			super();
			this.x = x;
			this.y = y;
		}
		
		override public function added(): void {
			image = new Image(assets.Candy1Img);
			image.centerOrigin();
			graphic = image;
			setHitbox(image.width, image.height, -(image.width / 2), -(image.height / 2));
			
		}
		
		override public function update():void { 
		}
		
	}

}