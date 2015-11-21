package setzer.space.invaders.managers
{
	import flash.geom.Point;

	import setzer.space.invaders.entities.Entity;
	import setzer.space.invaders.models.LevelModel;

	import starling.display.Sprite;
	import starling.events.Event;

	public class GameManager
	{
		private static const ENEMY_TICK:int = 20;

		[Inject]
		public var levelModel:LevelModel;

		private var _gameContainer:Sprite;

		private var _enemyTick:int;

		private var _enemiesSpeed:Vector.<Point>;

		public function GameManager()
		{
			_gameContainer = new Sprite();
		}

		public function start():void
		{
			_enemyTick = 0;
			_gameContainer.addEventListener( Event.ENTER_FRAME, onLoop );
		}

		public function stop():void
		{
			_gameContainer.removeEventListener( Event.ENTER_FRAME, onLoop );
		}

		private function onLoop( event:Event ):void
		{
			_enemyTick +=1;
			update();
			move();
			//collision();
			render();
		}

		private function update():void
		{
			if ( _enemyTick % ENEMY_TICK != 0 ) return;

			var speed:Point = _enemiesSpeed.shift();
			for each( var enemy:Entity in levelModel.enemies )
			{
				enemy.speedX = speed.x;
				enemy.speedY = speed.y;
			}
			_enemiesSpeed.push( speed );
		}

		private function move():void
		{
			for( var entity:Entity in levelModel.allEntities )
			{
				entity.move();
			}
		}

		public function render():void
		{
			if ( levelModel.addToStageList.length > 0 ) addToStageEntities();

			if ( _enemyTick % ENEMY_TICK != 0 ) return;

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
			_enemiesSpeed = new Vector.<Point>();
			_enemiesSpeed.push( new Point( -10,0 ) );
			_enemiesSpeed.push( new Point( 0,10 ) );
			_enemiesSpeed.push( new Point( 10,0 ) );
			_enemiesSpeed.push( new Point( 10,0 ) );
			_enemiesSpeed.push( new Point( 0,10 ) );
			_enemiesSpeed.push( new Point( -10,0 ) );
		}

		public function get gameContainer():Sprite
		{
			return _gameContainer;
		}
	}
}
