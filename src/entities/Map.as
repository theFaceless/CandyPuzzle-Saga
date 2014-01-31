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
			if (mapId <= 0){
				image = new Image(assets.MapTemplate);
				mask = new Pixelmask(assets.MapTemplate)
			}
			image.color = 0x33FF33;
			graphic = image;
		}
		
		override public function update(): void {
			
		}
		
	}

}