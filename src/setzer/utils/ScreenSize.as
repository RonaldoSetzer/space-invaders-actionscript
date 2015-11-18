package setzer.utils 
{
	import flash.display.Stage;
	
	public class ScreenSize 
	{
		public static var STAGE_WIDTH:Number;
		public static var STAGE_HEIGHT:Number;
		
		public static function init( stage:Stage ):void
		{
			STAGE_WIDTH = stage.stageWidth;
			STAGE_HEIGHT = stage.stageHeight;
		}	
	}
}