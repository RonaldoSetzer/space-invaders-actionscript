package setzer.space.invaders.setup
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.api.IFlowManager;
import robotlegs.bender.framework.api.IConfig;
import robotlegs.bender.framework.api.IContext;
	import setzer.space.invaders.events.FlowEvent;
	import setzer.space.invaders.mediators.HomeViewMediator;
	import setzer.space.invaders.mediators.MapViewMediator;
	import setzer.space.invaders.views.HomeView;
	import setzer.space.invaders.views.MapView;

	import starling.events.EventDispatcher;
	
	public class SpaceInvadersConfig implements IConfig
	{
		[Inject]
		public var eventDispatcher:EventDispatcher;

		[Inject]
		public var mediatorMap:IMediatorMap;

		[Inject]
		public var context:IContext;

		[Inject]
		public var flowManager:IFlowManager;

		public function configure():void
		{
			context.afterInitializing( init );
		}
		
		public function init():void
		{
			mapMediators();
			mapFlowManager();
			
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_HOME_VIEW ) );
		}
		
		public function mapMediators():void
		{
			mediatorMap.map( HomeView ).toMediator( HomeViewMediator );
			mediatorMap.map( MapView ).toMediator( MapViewMediator );
		}
	
		public function mapFlowManager():void
		{
			flowManager.mapSetView( FlowEvent.SHOW_HOME_VIEW, HomeView );
			flowManager.mapSetView( FlowEvent.SHOW_MAP_VIEW, MapView );
		}
	}
}
