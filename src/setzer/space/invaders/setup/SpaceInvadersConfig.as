package setzer.space.invaders.setup
{
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.api.IFlowManager;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;

	import setzer.space.invaders.events.FlowEvent;
	import setzer.space.invaders.mediators.GameViewMediator;
	import setzer.space.invaders.mediators.HomeViewMediator;
	import setzer.space.invaders.mediators.StageSelectViewMediator;
	import setzer.space.invaders.models.CurrentLevelModel;
	import setzer.space.invaders.views.GameView;
	import setzer.space.invaders.views.HomeView;
	import setzer.space.invaders.views.StageSelectView;

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
			mapModels();
			mapFlowManager();
			
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_HOME_VIEW ) );
		}

		private function mapModels():void
		{
			context.injector.map( CurrentLevelModel ).asSingleton();
		}
		
		public function mapMediators():void
		{
			mediatorMap.map( HomeView ).toMediator( HomeViewMediator );
			mediatorMap.map( StageSelectView ).toMediator( StageSelectViewMediator );
			mediatorMap.map( GameView ).toMediator( GameViewMediator );
		}
	
		public function mapFlowManager():void
		{
			flowManager.mapSetView( FlowEvent.SHOW_HOME_VIEW, HomeView );
			flowManager.mapSetView( FlowEvent.SHOW_STAGE_SELECT_VIEW, StageSelectView );
			flowManager.mapSetView( FlowEvent.SHOW_GAME_VIEW, GameView );
		}
	}
}
