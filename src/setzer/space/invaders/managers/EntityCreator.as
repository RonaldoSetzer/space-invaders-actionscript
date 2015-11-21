package setzer.space.invaders.managers
{
	import setzer.assets.AssetLib;
	import setzer.space.invaders.entities.EnemyEntity;
	import setzer.space.invaders.entities.Entity;

	public class EntityCreator
	{
		public static function createCannon():Entity
		{
			var entity:Entity = new Entity( AssetLib.CANNON );
			entity.x = 0;
			entity.y = 400;
			entity.render();

			return entity;
		}

		public static function createEnemy( x:Number, y:Number ):Entity
		{
			var enemy:Entity = new EnemyEntity( AssetLib.ENEMY_01 );
			enemy.x = x;
			enemy.y = y;
			enemy.render();

			return enemy;
		}
	}
}
