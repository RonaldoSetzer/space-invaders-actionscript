package setzer.space.invaders.entities
{
	import setzer.assets.Assets;

	public class EnemyEntity extends Entity
	{
		private var _textures:Array;

		public function EnemyEntity( key:String )
		{
			_textures = [ Assets.getTexture( key + "02" )];
			super( key + "01" );
		}

		override public function render():void
		{
			super.render();

			_textures.push( graphic.texture );
			graphic.texture = _textures.shift();
			graphic.readjustSize();
		}
	}
}
