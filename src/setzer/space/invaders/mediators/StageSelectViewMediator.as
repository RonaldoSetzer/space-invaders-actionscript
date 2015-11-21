package setzer.space.invaders.mediators
{
	import robotlegs.bender.extensions.palidor.api.StarlingMediator;

	import setzer.space.invaders.events.FlowEvent;
	import setzer.space.invaders.models.LevelModel;
	import setzer.space.invaders.views.StageSelectView;
	import setzer.space.invaders.views.components.StageSelectItem;

	import starling.events.Event;

	public class StageSelectViewMediator extends StarlingMediator
	{
		[Inject]
		public var currentLevelModel:LevelModel;

		override public function initialize():void
		{
			var _view:StageSelectView = StageSelectView( viewComponent );

			var total:int = _view.items.length;

			for ( var i:int = 0; i < total; ++i )
			{
				eventMap.mapListener( _view.items[i], Event.TRIGGERED, onItemClickHandler )
			}
		}

		private function onItemClickHandler( e:Event ):void
		{
			e.stopImmediatePropagation();

			currentLevelModel.levelId = StageSelectItem( e.currentTarget ).levelId;
			eventDispatcher.dispatchEvent( new FlowEvent( FlowEvent.SHOW_GAME_VIEW ) );
		}

		override public function destroy():void
		{
			eventMap.unmapListeners();
		}
	}
}
