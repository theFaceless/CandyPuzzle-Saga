package worlds 
{
	import net.flashpunk.graphics.Text;
	import net.flashpunk.utils.Input;
	import net.flashpunk.utils.Key;
	import net.flashpunk.World;
	import net.flashpunk.FP;
	import utils.WorldSwitcher;
	
	/**
	 * ...
	 * @author Wout Coenen
	 */
	public class WonScreen extends World {
		
		private var elapsed: Number;
		
		public function WonScreen() {
			super();
			elapsed = 0;
		}
		
		override public function begin(): void {
			var text: Text = new Text("You won!", FP.width / 2, FP.height / 3);
			var text2: Text = new Text("Play the rest of the Saga!", FP.width / 2, FP.height * 2 / 3);
			addGraphic(text);
			addGraphic(text2);
		}
		
		override public function update(): void {
			super.update();
			elapsed += FP.elapsed;
			if (elapsed >= References.WONSCREENTIME || Input.pressed(Key.ENTER))
				WorldSwitcher.switchToMain();
		}
		
	}

}