package setzer.space.invaders.events
{
	import starling.events.Event;

	public class LevelEvent extends Event
	{
		public static const CREATE_LEVEL:String = "createLevel";

		public function LevelEvent( type:String, bubbles:Boolean = false, data:Object = null )
		{
			super( type, bubbles, data);
		}
	}
}