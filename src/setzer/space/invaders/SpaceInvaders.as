package setzer.space.invaders
{
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.geom.Rectangle;
	import robotlegs.bender.bundles.palidor.PalidorBundle;
	import robotlegs.bender.extensions.contextView.ContextView;
	import robotlegs.bender.framework.api.IContext;
	import robotlegs.bender.framework.impl.Context;
	import setzer.space.invaders.setup.SpaceInvadersConfig;
	import setzer.space.invaders.setup.StarlingContextView;
	import setzer.utils.ScreenSize;
	import starling.core.Starling;
	
	[SWF(width="480", height="752", frameRate="60", backgroundColor="#000000")]
	public class SpaceInvaders extends Sprite 
	{
		public function SpaceInvaders() 
		{
			
			trace("space invaders");
			stage.align = StageAlign.TOP_LEFT;
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.frameRate = 60;
			stage.color = 0x000000;

			addEventListener( Event.ADDED_TO_STAGE, onAddedToStageHandler );
		}

		private function onAddedToStageHandler( e:Event ):void
		{
			
			trace("stage");
			ScreenSize.init( stage );
			
			var starling:Starling = new Starling( StarlingContextView, stage, new Rectangle( 0, 0, ScreenSize.STAGE_WIDTH, ScreenSize.STAGE_HEIGHT ) );
			starling.nativeStage.frameRate = 60;
			starling.start();

			const robotlegsContext:IContext = new Context()
					.install( PalidorBundle )
					.configure( SpaceInvadersConfig, new ContextView( this ), starling );

		}
	}
}
