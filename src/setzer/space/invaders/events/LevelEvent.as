package setzer.space.invaders.events
{
	import flash.events.Event;

	public class LevelEvent extends Event
	{
		public static const CREATE_LEVEL:String = "createLevel";

		public function LevelEvent( type:String, bubbles:Boolean = false, cancelable:Boolean = false )
		{
			super( type, bubbles, cancelable );
		}
	}
}