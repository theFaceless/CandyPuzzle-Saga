package entities 
{
	import net.flashpunk.Entity;
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class Map extends Entity {
		
		public var mapId: int;
		
		public function Map(mapId: int = 0) {
			this.mapId = mapId;
		}

		override public function added() {
			
		}
		
		override public function update() {
			
		}
		
	}

}