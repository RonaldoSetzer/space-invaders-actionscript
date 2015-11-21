package setzer.space.invaders.commands
{
	import robotlegs.bender.bundles.mvcs.Command;

	import setzer.space.invaders.managers.EntityCreator;
	import setzer.space.invaders.managers.GameManager;
	import setzer.space.invaders.models.LevelModel;

	public class CreateLevelCommand extends Command
	{
		[Inject]
		public var levelModel:LevelModel;

		[Inject]
		public var gameManager:GameManager;

		override public function execute():void
		{
			gameManager.clear();
			levelModel.clear();
			createEnemies();
			createHero();

			gameManager.start();
		}

		private function createHero():void
		{
			levelModel.setCannon( EntityCreator.createCannon() )
		}

		private function createEnemies():void
		{
			const MAX_COLS:int = 12;
			const MAX_ROWS:int = 5;
			const GAP:int = 30;
			const START_X:Number = -((MAX_COLS-1)*GAP/2);
			var x:Number;
			var y:Number;

			for( var row:int = 0; row < MAX_ROWS; ++row )
			{
				for( var col:int = 0; col < MAX_COLS; ++col )
				{
					x = START_X + col*GAP;
					y = row*GAP;
					levelModel.addEnemy( EntityCreator.createEnemy( x, y ) );
				}
			}
		}
	}
}
