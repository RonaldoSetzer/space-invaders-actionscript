package setzer.space.invaders.mediators
{
	import flash.events.IEventDispatcher;

	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import setzer.space.invaders.events.LevelEvent;
	import setzer.space.invaders.managers.GameManager;
	import setzer.space.invaders.views.GameView;

	public class GameViewMediator extends StarlingMediator
	{
		[Inject]
		public var eventCommandDispatcher:IEventDispatcher;

		[Inject]
		public var gameManager:GameManager;

		override public function initialize():void
		{
			GameView( viewComponent ).attachGameContainer( gameManager.gameContainer );

			eventCommandDispatcher.dispatchEvent( new LevelEvent( LevelEvent.CREATE_LEVEL ) );
		}
	}
}
