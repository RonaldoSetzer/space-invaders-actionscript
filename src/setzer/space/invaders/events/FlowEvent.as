package setzer.space.invaders.events
{
	import starling.events.Event;
	
	public class FlowEvent extends Event 
	{
		public static const SHOW_HOME_VIEW:String = "showHomeView";
		
		public function FlowEvent( type:String, bubbles:Boolean = false, data:Object = null ) 
		{ 
			super( type, bubbles, data);
		} 
	}
}