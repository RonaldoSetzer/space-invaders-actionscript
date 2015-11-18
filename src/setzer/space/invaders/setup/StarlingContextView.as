package setzer.space.invaders.setup
{
	import setzer.assets.Assets;
	import starling.display.Quad;
	import starling.display.Sprite;

	public class StarlingContextView extends Sprite
	{
		public function StarlingContextView()
		{
			Assets.init();
		}
	}
}
