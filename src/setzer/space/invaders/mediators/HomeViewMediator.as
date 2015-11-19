package setzer.space.invaders.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import setzer.space.invaders.events.FlowEvent;

	import setzer.space.invaders.views.HomeView;

	import starling.events.Event;

	public class HomeViewMediator extends StarlingMediator
	{

		override public function initialize():void
		{
			eventMap.mapListener( HomeView( viewComponent ).startButton, Event.TRIGGERED, onStartHandler )
		}

		private function onStartHandler( e:Event ):void
		{
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_MAP_VIEW ))
		}

		override public function destroy():void
		{
			HomeView( viewComponent ).destroy();
			eventMap.unmapListeners();
		}
	}

}