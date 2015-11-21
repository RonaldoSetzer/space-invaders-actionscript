package setzer.space.invaders.views
{
	import setzer.utils.ScreenSize;

	import starling.display.Sprite;

	public class GameView extends Sprite
	{
		private var _container:Sprite;

		public function GameView()
		{
			setupGameDisplay();
		}

		public function attachGameContainer( gameContainer:Sprite ):void
		{
			_container.removeChildren();
			_container.addChild( gameContainer );
		}

		private function setupGameDisplay():void
		{
			_container = new Sprite();
			_container.x = ScreenSize.STAGE_WIDTH*.5;
			_container.y = ScreenSize.STAGE_HEIGHT*.2;
			addChild( _container );
		}
	}
}
