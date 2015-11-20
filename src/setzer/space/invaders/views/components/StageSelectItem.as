package setzer.space.invaders.views.components
{
	import flash.display.BitmapData;

	import setzer.assets.TextLib;

	import starling.display.Button;
	import starling.textures.Texture;

	public class StageSelectItem extends Button
	{
		private var _levelId:String;
		
		public function StageSelectItem( stageId:String )
		{
			var texture:Texture = Texture.fromBitmapData( new BitmapData( 100, 100, false, 0x000000 ) );
			super( texture, stageId );

			fontName = TextLib.FONT_NAme;
			fontSize = TextLib.FONT_SIZE;
			fontColor = 0xFFFFFF;

			_levelId = stageId
			
			alignPivot();
		}

		public function get levelId():String
		{
			return _levelId;
		}
	}
}
