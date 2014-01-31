package worlds 
{
	import entities.Background;
	import net.flashpunk.graphics.Image;
	import net.flashpunk.World;
	import entities.MainMenuMap;
	import net.flashpunk.FP;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import utils.WorldSwitcher;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class MainMenu extends World{
		
		private var maps: Vector.<MainMenuMap>;
		private var indexCurrentMap: int;
		
		public function MainMenu() {
			
			super();
			maps = new Vector.<MainMenuMap>();
			indexCurrentMap = 0;
			
		}
		
		override public function begin(): void {
			
			var i: int;
	
			//add map here (2/ 4)
			maps.push(new MainMenuMap(FP.width / 2, FP.height / 2, assets.Map0));
			maps.push(new MainMenuMap(FP.width / 2, FP.height / 2, assets.TestMap));
			
			for (i = 0; i < maps.length; i++){
				add(maps[i]);
				maps[i].unlock();
			}
			
			add(new Background(0xFF3333));
			calculatePositions();
		}
		
		override public function update(): void {
			super.update();
			
			if (Input.pressed(Key.LEFT) && indexCurrentMap > 0) {
				indexCurrentMap--;
				calculatePositions();
			}
			if (Input.pressed(Key.RIGHT) && indexCurrentMap < maps.length - 1) {
				indexCurrentMap++;
				calculatePositions();
			}
			
			if (Input.pressed(Key.ENTER) || Input.pressed(Key.NUMPAD_ENTER)) {
				WorldSwitcher.switchToMap(indexCurrentMap);
			}
			
		}
		
		public function calculatePositions(): void {
			
			maps[indexCurrentMap].layer = 0;
			maps[indexCurrentMap].moveToX = FP.width / 2;
			maps[indexCurrentMap].scaleWidthTo = References.MAPPREVIEWWIDTH * 1.2;
			
			var i: int;
			for (i = 0; i < indexCurrentMap; i++) {
				maps[i].layer = indexCurrentMap - i;
				maps[i].moveToX = FP.width / 3 / (indexCurrentMap) * (i+1);
				maps[i].scaleWidthTo = References.MAPPREVIEWWIDTH;
			}
			for (i = maps.length - 1; i > indexCurrentMap; i--) {
				maps[i].layer = i - indexCurrentMap;
				maps[i].moveToX = FP.width - FP.width / 3 / (maps.length - indexCurrentMap + 1) * (maps.length - i + 1);
				maps[i].scaleWidthTo = References.MAPPREVIEWWIDTH;
			}
		}
		
	}

}