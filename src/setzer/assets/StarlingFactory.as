package setzer.assets
{
	import flash.display.BitmapData;

	import starling.display.Button;
	import starling.display.Image;
	import starling.display.MovieClip;
	import starling.display.Quad;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureSmoothing;

	public class StarlingFactory
	{
		public static function getImage( key:String ):Image
		{
			var image:Image = new Image( Assets.getTexture( key ) );
			image.smoothing = TextureSmoothing.NONE;

			return  image;
		}

		public static function getText( width:Number, text:String, size:int = TextLib.FONT_SIZE, color:int = 0xFFFFFF):TextField
		{
			return new TextField( width, size + 5, text, TextLib.FONT_NAme, size, color )
		}

		public static function getQuad( width:Number, height:Number, color:int ):Quad
		{
			return new Quad( width, height, color);
		}

		public static function getMovieClip( key:String, fps:int = 12 ):MovieClip
		{
			var movie:MovieClip = new MovieClip( Assets.getTextures( key ), fps );
			movie.smoothing = TextureSmoothing.NONE;

			return movie;
		}

		public static function getColorButton( width:Number, height:Number, text:String = "" ):Button
		{
			var texture:Texture = Texture.fromBitmapData( new BitmapData( width, height, false, 0x000000 ) );
			return new Button( texture, text );
		}
	}
}
