package setzer.space.invaders.views

{
	import flash.text.TextFormatAlign;

	import setzer.assets.StarlingFactory;
	import setzer.assets.TextLib;
	import setzer.space.invaders.views.components.StageSelectItem;
	import setzer.utils.ScreenSize;

	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class StageSelectView extends Sprite
	{
		private var _items:Vector.<StageSelectItem>;

		public function StageSelectView()
		{
			setupScene();
			setupItems();
		}

		private function setupItems():void
		{
			_items = new Vector.<StageSelectItem>();

			var itemsContainer:Sprite = new Sprite();
			itemsContainer.x = ScreenSize.STAGE_WIDTH*.5;
			itemsContainer.y = ScreenSize.STAGE_HEIGHT*.5;

			var total:int = 9
			var item:StageSelectItem;

			for( var i:int = 0; i < total; ++i )
			{
				item = new StageSelectItem( String(i+1) );
				item.x = int(i%3)* 110;
				item.y = int(i/3)* 110;

				itemsContainer.addChild( item );

				_items.push( item );
			}

			itemsContainer.alignPivot();
			addChild( itemsContainer );
		}

		private function setupScene():void
		{
			var background:Quad = StarlingFactory.getQuad( ScreenSize.STAGE_WIDTH, ScreenSize.STAGE_HEIGHT *.6, 0xFF6600 );
			background.pivotX = background.width*.5;
			background.x = ScreenSize.STAGE_WIDTH*.5;
			background.y = ScreenSize.STAGE_HEIGHT*.2;
			background.setVertexColor(0, 0xFFA901 );
			background.setVertexColor(1, 0xFF8E01 );
			background.setVertexColor(3, 0xFF3333 );
			addChild( background );

			var title:TextField = StarlingFactory.getText( 400, TextLib.TITLE_STAGE_SELECT );
			title.vAlign = TextFormatAlign.CENTER;
			title.x = ScreenSize.STAGE_WIDTH*.5;
			title.y = ScreenSize.STAGE_HEIGHT*.1;
			title.alignPivot();
			addChild( title );
		}

		public function get items():Vector.<StageSelectItem>
		{
			return _items;
		}
	}
}
