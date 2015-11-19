package setzer.assets
{
	public class Embeds
	{
		/* TEXTURE ATLAS */

		[Embed(source="/../assets/atlas/spritesheet.png")]
		public static var SpaceInvadersAtlasPNG:Class;

		[Embed(source="/../assets/atlas/spritesheet.xml", mimeType="application/octet-stream")]
		public static var SpaceInvadersAtlasXML:Class;

		/* FONT */

		[Embed(source="/../assets/fonts/PushStart2P.fnt", mimeType="application/octet-stream")]
		public static const PushStart2PXml:Class;

		[Embed(source = "/../assets/fonts/PushStart2P.png")]
		public static const PushStart2PTexture:Class;

		[Embed(source="/../assets/fonts/SimpleSmallPixel7.fnt", mimeType="application/octet-stream")]
		public static const SimpleSmallPixel7Xml:Class;

		[Embed(source = "/../assets/fonts/SimpleSmallPixel7_0.png")]
		public static const SimpleSmallPixel7Texture:Class;

	}
}
