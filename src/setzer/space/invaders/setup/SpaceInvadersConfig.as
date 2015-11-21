package setzer.space.invaders.setup
{
	import robotlegs.bender.extensions.eventCommandMap.api.IEventCommandMap;
	import robotlegs.bender.extensions.mediatorMap.api.IMediatorMap;
	import robotlegs.bender.extensions.palidor.api.IFlowManager;
	import robotlegs.bender.framework.api.IConfig;
	import robotlegs.bender.framework.api.IContext;

	import setzer.space.invaders.commands.CreateLevelCommand;
	import setzer.space.invaders.events.FlowEvent;
	import setzer.space.invaders.events.LevelEvent;
	import setzer.space.invaders.managers.GameManager;
	import setzer.space.invaders.mediators.GameViewMediator;
	import setzer.space.invaders.mediators.HomeViewMediator;
	import setzer.space.invaders.mediators.StageSelectViewMediator;
	import setzer.space.invaders.models.LevelModel;
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
		public var commandMap:IEventCommandMap;

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
			mapManagers();
			mapFlowManager();
			mapCommands();

			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_HOME_VIEW ) );
		}

		private function mapManagers():void
		{
			context.injector.map( GameManager ).asSingleton();
		}

		private function mapCommands():void
		{
			commandMap.map( LevelEvent.CREATE_LEVEL ).toCommand( CreateLevelCommand );
		}

		private function mapModels():void
		{
			context.injector.map( LevelModel ).asSingleton();
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
