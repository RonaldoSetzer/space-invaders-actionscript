package setzer.space.invaders.views
{
import flash.text.TextFormatAlign;

import setzer.assets.AssetLib;
	import setzer.assets.Assets;
import setzer.utils.ScreenSize;

import starling.display.Image;
	import starling.display.Quad;
	import starling.display.Sprite;
import starling.text.TextField;

    public class HomeView extends Sprite
	{
		public function HomeView() 
		{
			setupImagems();
		}
		
		private function setupImagems():void
		{
			var logo:Image = new Image( Assets.getTexture( AssetLib.LOGO ) );
            logo.x = ScreenSize.STAGE_WIDTH*.5;
            logo.y = ScreenSize.STAGE_HEIGHT*.3;
            logo.alignPivot();
			addChild( logo );

            var text:TextField = new TextField( 400,40,"HELLO SPACE", "Press Start 2P", 22, 0xFFFFFF );
            text.vAlign = TextFormatAlign.CENTER;
            text.x = ScreenSize.STAGE_WIDTH*.5;
            text.y = ScreenSize.STAGE_HEIGHT*.7;
            text.alignPivot();
            addChild( text );
		}
	}
}