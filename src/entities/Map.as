package entities 
{
	import net.flashpunk.Entity;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.masks.Pixelmask;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class Map extends Entity {
		
		public var mapId: int;
		private var image: Image;
		
		public function Map(mapId: int = 0) {
			this.mapId = mapId;
		}

		override public function added(): void {
			if (mapId == 0){
				image = new Image(assets.MapTemplate);
				mask = new Pixelmask(assets.MapTemplate)
			}
			if (mapId == -1) {
				image = new Image(assets.TestMap);
				mask = new Pixelmask(assets.TestMap);
			}
			image.color = 0x33FF33;
			graphic = image;
		}
		
		override public function update(): void {
			
		}
		
		/**
		 * 
		 * @param	maze 0 if left, 1 if right
		 * @param	tileX the X-coord of the tile
		 * @return the x of the middle of the tile
		 */
		public function getXBytileX(maze: int, tileX: int): int {
			if (maze < 0)
				maze = 0;
			else if (maze > 1)
				maze = 1;
			if (tileX < 0)
				tileX = 0;
			else if (tileX > 8)
				tileX = 8;
				
			if (maze == 0)
				return (40 + tileX * 40);
			else
				return (440 + tileX * 40);
		}
		
		/**
		 * 
		 * @param	maze 0 if top, 1 if bottom
		 * @param	tileY the Y-coord of the tile
		 * @return the y of the middle of the tile
		 */
		public function getYBytileY(maze: int, tileY: int): int {
			if (maze < 0)
				maze = 0;
			else if (maze > 1)
				maze = 1;
			if (tileY < 0)
				tileY = 0;
			else if (tileY > 5)
				tileY = 5;
				
			if (maze == 0)
				return (40 + tileY * 40);
			else
				return (360 + tileY * 40);
		}
		
	}

}