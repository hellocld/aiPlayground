package  
{
	import org.flixel.*;
	
	/**
	 * This playpen is for testing out 2D platformer AI types
	 * 
	 * @author cld
	 */
	public class PlaypenPlatformer extends FlxState
	{
		
		public function PlaypenPlatformer():void 
		{
			
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.Q) FlxG.switchState(new MainMenu);
		}
		
	}

}