package setzer.space.invaders.models
{
	import flash.utils.Dictionary;

	import setzer.space.invaders.entities.Entity;

	public class LevelModel
	{
		public var levelId:String;

		private var _cannon:Entity;

		private var _bullets:Vector.<Entity>;

		private var _enemies:Vector.<Entity>;

		private var _addToStageList:Vector.<Entity>;

		private var _allEntities:Dictionary;

		public function LevelModel()
		{
			clear();
		}

		private function addEntity( entity:Entity ):void
		{
			_addToStageList.push( entity );
			_allEntities[ entity ] = entity;
		}

		public function setCannon( cannon:Entity ):void
		{
			_cannon = cannon;
			addEntity( cannon );
		}

		public function addEnemy( enemy:Entity ):void
		{
			_enemies.push( enemy );
			addEntity( enemy );
		}

		public function addBullet( bullet:Entity ):void
		{
			_bullets.push( bullet );
			addEntity( bullet );
		}

		public function clear():void
		{
			_cannon = null;
			_bullets = new Vector.<Entity>();
			_enemies = new Vector.<Entity>();
			_addToStageList = new Vector.<Entity>();
			_allEntities = new Dictionary();
		}

		public function get cannon():Entity
		{
			return _cannon;
		}

		public function get enemies():Vector.<Entity>
		{
			return _enemies;
		}

		public function get bullets():Vector.<Entity>
		{
			return _bullets;
		}

		public function get addToStageList():Vector.<Entity>
		{
			return _addToStageList;
		}

		public function get allEntities():Dictionary
		{
			return _allEntities;
		}


	}
}
