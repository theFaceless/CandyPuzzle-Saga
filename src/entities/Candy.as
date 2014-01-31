package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import utils.Util;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class Candy extends Entity
	{
		
		private var image: Image;
		
		public function Candy(maze: int, tileX: int, tileY: int) {
			super();
			x = Map.getXBytileX(maze, tileX);
			y = Map.getYBytileY(maze, tileY);
			layer = 1;
		}
		
		override public function added(): void {
			var randomCandy: int = Util.randomNumber(1, 2);
			switch(randomCandy) {
				case 1:
					image = new Image(assets.Candy1Img);
					break;
				case 2:
					image = new Image(assets.Candy2Img);
					break;
				default:
					image = new Image(assets.Candy1Img);
			}
			image.centerOrigin();
			graphic = image;
			setHitbox(image.width, image.height, -(image.width / 2), -(image.height / 2));
			
		}
		
		public function isHit(x: int, y: int): Boolean {
			if (Math.abs(this.x - x) < 5 && Math.abs(this.y - y) < 5)
				return true;
			else
				return false;
		}
		
	}

}