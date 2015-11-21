package setzer.space.invaders.managers
{
	import setzer.space.invaders.entities.Entity;
	import setzer.space.invaders.models.LevelModel;

	import starling.display.Sprite;
	import starling.events.Event;

	public class GameManager
	{
		[Inject]
		public var levelModel:LevelModel;

		private var _gameContainer:Sprite;

		private var _tick:int;

		public function GameManager()
		{
			_gameContainer = new Sprite();
		}

		public function start():void
		{
			_tick = 0;
			_gameContainer.addEventListener( Event.ENTER_FRAME, onLoop );
		}

		public function stop():void
		{
			_gameContainer.removeEventListener( Event.ENTER_FRAME, onLoop );
		}

		private function onLoop( event:Event ):void
		{
			_tick +=1;
			//update();
			//move();
			//collision();
			render();
		}

		public function render():void
		{
			if ( levelModel.addToStageList.length > 0 ) addToStageEntities();

			if ( _tick % 20 != 0 ) return;

			for( var entity:Entity in levelModel.allEntities )
			{
				entity.render();
			}
		}

		private function addToStageEntities():void
		{
			var entity:Entity;
			while( levelModel.addToStageList.length > 0 )
			{
				entity = levelModel.addToStageList.pop();
				_gameContainer.addChild( entity.graphic );
			}
		}

		public function clear():void
		{
			_gameContainer.removeChildren();
		}

		public function get gameContainer():Sprite
		{
			return _gameContainer;
		}
	}
}
