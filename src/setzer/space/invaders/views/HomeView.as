package setzer.space.invaders.views
{
	import com.greensock.TimelineLite;
	import com.greensock.TweenLite;

	import flash.text.TextFormatAlign;

	import setzer.assets.AssetLib;
	import setzer.assets.StarlingFactory;
	import setzer.utils.ScreenSize;

	import starling.core.Starling;
	import starling.display.Button;

	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.display.Sprite;
	import starling.text.TextField;

	public class HomeView extends Sprite
	{
		private var textInfoAnimation:TimelineLite;

		private var movieClips:Vector.<MovieClip>;

		private var _startButton:Button;

		public function HomeView() 
		{
			setupScene();
			setupButton();
		}

		private function setupButton():void
		{
			_startButton = StarlingFactory.getColorButton( ScreenSize.STAGE_WIDTH, ScreenSize.STAGE_HEIGHT * .6 );
			_startButton.pivotX = _startButton.width*.5;
			_startButton.x = ScreenSize.STAGE_WIDTH*.5;
			_startButton.y = ScreenSize.STAGE_HEIGHT*.2;
			_startButton.alpha = 0;
			_startButton.scaleWhenDown = 1;
			addChild( _startButton );
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

			var logo:Image = StarlingFactory.getImage( AssetLib.LOGO );
            logo.x = ScreenSize.STAGE_WIDTH*.5;
            logo.y = ScreenSize.STAGE_HEIGHT*.3;
            logo.alignPivot();
			addChild( logo );

			createEnemiesParade();

            var text:TextField = StarlingFactory.getText( 400, "Hello Space!", 14);
            text.vAlign = TextFormatAlign.CENTER;
            text.x = ScreenSize.STAGE_WIDTH*.5;
            text.y = ScreenSize.STAGE_HEIGHT*.6;
            text.alignPivot();
            addChild( text );

			var textInfo:TextField = StarlingFactory.getText( 400, "Tap to Start!");
			textInfo.vAlign = TextFormatAlign.CENTER;
			textInfo.x = ScreenSize.STAGE_WIDTH*.5;
			textInfo.y = ScreenSize.STAGE_HEIGHT*.7;
			textInfo.alignPivot();
            addChild( textInfo );

			textInfoAnimation = new TimelineLite( {onComplete: tweenBack} );
			textInfoAnimation.append( new TweenLite( textInfo, .5, { scaleX: 1.2, scaleY: 1.2} ) );
			textInfoAnimation.append( new TweenLite( textInfo, .5, { scaleX: 1, scaleY: 1} ) );
			textInfoAnimation.play();
		}

		private function createEnemiesParade():void
		{
			movieClips = new Vector.<MovieClip>();

			const enemiesAssets:Array = [ AssetLib.ENEMY_01, AssetLib.ENEMY_02, AssetLib.ENEMY_03, AssetLib.ENEMY_BONUS ];
			const enemiesPositions:Array = [ -150, -70, 20, 125 ];

			var mov:MovieClip;

			for ( var i:int = 0; i < 4; ++i )
			{
				mov = StarlingFactory.getMovieClip( enemiesAssets[i], 2 );
				mov.scaleX = 2;
				mov.scaleY = 2;
				mov.y = ScreenSize.STAGE_HEIGHT*.5;
				mov.x = ScreenSize.STAGE_WIDTH*.5 + enemiesPositions[i];
				mov.alignPivot();
				addChild( mov );

				movieClips.push( mov );
				Starling.juggler.add( mov );
			}
		}

		private function tweenBack():void
		{
			textInfoAnimation.restart();
		}

		public function get startButton():Button
		{
			return _startButton;
		}

		public function destroy():void
		{
			for each( var mov:MovieClip in movieClips )
			{
				Starling.juggler.remove( mov );
			}
		}
	}
}