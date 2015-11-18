package setzer.assets
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	
	import starling.text.BitmapFont;
	import starling.text.TextField;
	import starling.textures.Texture;
	import starling.textures.TextureAtlas;

	public class Assets
	{	
		/* TEXTURA ATLAS */
		
		[Embed(source="/../assets/atlas/spritesheet.png")]
		private static var SpaceInvadersAtlasPNG:Class;

		[Embed(source="/../assets/atlas/spritesheet.xml", mimeType="application/octet-stream")]
		private static var SpaceInvadersAtlasXML:Class;
		
		/* FONT */
		
		[Embed(source="/../assets/fonts/PushStart2P.fnt", mimeType="application/octet-stream")]
		private static const PushStart2PXml:Class;
			
		[Embed(source = "/../assets/fonts/PushStart2P.png")]
		private static const PushStart2PTexture:Class;

		/* ATLAS */

		private static var atlas:TextureAtlas;

		public static function init():void
		{
			
			atlas = createTextureAtlas();
			
			TextField.registerBitmapFont( createPushStartFont() );
		}

		public static function getTexture( key:String ):Texture
		{
			return atlas.getTexture( key );
		}
		
		private static function createTextureAtlas():TextureAtlas
		{
			var atlasTexture:Texture = Texture.fromBitmap( new SpaceInvadersAtlasPNG());
			var atlasXML:XML = XML( new SpaceInvadersAtlasXML() );
			return new TextureAtlas( atlasTexture, atlasXML )
		}
		
		private static function createPushStartFont():BitmapFont
		{
			var bmpFontBmp:Bitmap = new PushStart2PTexture();
			bmpFontBmp.smoothing = false;
			
			var bmpFontXml:XML = XML( new PushStart2PXml() );

			var bmpTexture:Texture = Texture.fromBitmap( bmpFontBmp );
			return new BitmapFont( bmpTexture, bmpFontXml);
		}
	}
}