package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.FP;
	import net.flashpunk.graphics.Image;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class MainMenuMap extends Entity {
		
		public var moveToX: int;
		public var scaleWidthTo: int;
		public var locked: Boolean;
		private var image: Image;
		private var imageRect: Image;
		private var imageBorder: Image;
		
		public function MainMenuMap(x: int, y: int, image: Class)  {
			this.x = x;
			this.y = y;
			moveToX = x;
			scaleWidthTo = References.MAPPREVIEWWIDTH;
			locked = true;
			
			
			imageBorder = Image.createRect(References.MAPPREVIEWWIDTH + 4, References.MAPPREVIEWHEIGHT + 4, 0x000000);
			imageBorder.centerOrigin();
			imageRect = Image.createRect(References.MAPPREVIEWWIDTH, References.MAPPREVIEWHEIGHT, 0x555555, 0.8);
			imageRect.centerOrigin();
			this.image = new Image(image);
			this.image.color = References.MAPLOCKEDCOLOR;
			this.image.scaledWidth = References.MAPPREVIEWWIDTH;
			this.image.scaledHeight = References.MAPPREVIEWHEIGHT;
			this.image.centerOrigin();
		}
		
		override public function added(): void {
			
			
			addGraphic(imageBorder);
			addGraphic(imageRect);
			addGraphic(image);
			
		}
		
		override public function update(): void {
			
			//move if necessary
			if (x < moveToX) {
				x += 15;
			}
			else if (x > moveToX) {
				x -= 15;
			}
			
			if (x != moveToX && Math.abs(x - moveToX) < 15) {
				x = moveToX;
			}
			
			//scale if necessary
			if (image.scaledWidth < scaleWidthTo) {
				image.scaledWidth += 4;
				image.scaledHeight += 3;
				imageRect.scaledWidth += 4;
				imageRect.scaledHeight += 3;
				imageBorder.scaledWidth += 4;
				imageBorder.scaledHeight += 3;
			}
			else if (image.scaledWidth > scaleWidthTo) {
				image.scaledWidth -= 4;
				image.scaledHeight -= 3;
				imageRect.scaledWidth -= 4;
				imageRect.scaledHeight -= 3;
				imageBorder.scaledWidth -= 4;
				imageBorder.scaledHeight -= 3;
			}
			
			if (image.scaledWidth != scaleWidthTo && Math.abs(image.scaledWidth - scaleWidthTo) < 4) {
				image.scaledWidth = scaleWidthTo;
				image.scaledHeight = scaleWidthTo * 3 / 4;
				imageRect.scaledWidth = scaleWidthTo;
				imageRect.scaledHeight = scaleWidthTo * 3 / 4;
				imageBorder.scaledWidth = scaleWidthTo + 4;
				imageBorder.scaledHeight = scaleWidthTo * 3 / 4 + 4;
			}
			
		}
		
		public function unlock(): void {
			locked = false;
			image.color = References.MAPCOLOR;
			imageRect.color = 0xFFFFFF;
			imageRect.alpha = 1;
		}
		
	}

}