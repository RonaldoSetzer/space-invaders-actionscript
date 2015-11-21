package setzer.space.invaders.entities
{
	import setzer.assets.StarlingFactory;

	import starling.display.Image;

	public class Entity
	{
		private var _graphic:Image;
		public var x:Number;
		public var y:Number;
		public var speedX:Number;
		public var speedY:Number;

		private var _update:Boolean;

		public function Entity( key:String )
		{
			_graphic = StarlingFactory.getImage( key );
			_graphic.alignPivot();
			_update = true;
			speedX = 0;
			speedY = 0;
		}

		public function render():void
		{
			if ( _update == false ) return;

			_graphic.x = x;
			_graphic.y = y;
			_update = false;
		}

		public function move():void
		{
			if ( speedX == 0 && speedY == 0 ) return;

			_update = true;
			x += speedX;
			y += speedY;
			speedX = 0;
			speedY = 0;
		}

		public function get graphic():Image
		{
			return _graphic;
		}
	}
}
