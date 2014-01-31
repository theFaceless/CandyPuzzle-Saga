package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.FP;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class Background extends Entity {
		
		private var image: Image;
		private var color: uint;
		private var img: Class;
		
		public function Background(color: uint = 0x000000, img: Class = null) {
			super();
			this.color = color;
			this.img = img;
		}
		
		override public function added(): void {
			if (img)
				image = new Image(img);
			else
				image = Image.createRect(800, 600, 0xFF3333, 1);
			image.centerOrigin();
			x = FP.width / 2;
			y = FP.height / 2;
			graphic = image;
			layer = 100;
		}
		
		override public function update(): void {
			
		}
		
	}

}