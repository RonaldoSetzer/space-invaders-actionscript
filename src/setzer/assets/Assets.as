package setzer.assets
{
	import flash.display.Bitmap;

	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{	
		private static var atlas:TextureAtlas;

		public static function init():void
		{
			
			atlas = createTextureAtlas();
			
			TextField.registerBitmapFont( createBitmapFont( Embeds.PushStart2PTexture, Embeds.PushStart2PXml) );
			TextField.registerBitmapFont( createBitmapFont( Embeds.SimpleSmallPixel7Texture, Embeds.SimpleSmallPixel7Xml) );
		}

		public static function getTexture( key:String ):Texture
		{
			return atlas.getTexture( key );
		}

		public static function getTextures( key:String ):Vector.<Texture>
		{
			return atlas.getTextures( key );
		}

		private static function createTextureAtlas():TextureAtlas
		{
			var atlasTexture:Texture = Texture.fromBitmap( new Embeds.SpaceInvadersAtlasPNG());
			var atlasXML:XML = XML( new Embeds.SpaceInvadersAtlasXML() );
			return new TextureAtlas( atlasTexture, atlasXML )
		}
		
		private static function createBitmapFont( classTexture:Class, classXml:Class):BitmapFont
		{
			var bmpFontBmp:Bitmap = new classTexture();
			bmpFontBmp.smoothing = false;
			
			var bmpFontXml:XML = XML( new classXml() );

			var bmpTexture:Texture = Texture.fromBitmap( bmpFontBmp );
			return new BitmapFont( bmpTexture, bmpFontXml);
		}
	}
}