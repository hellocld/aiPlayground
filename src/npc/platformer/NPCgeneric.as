package npc.platformer 
{
	/**
	 * ...
	 * @author ...
	 */
	
	import org.flixel.*;
	
	public class NPCgeneric extends FlxSprite
	{
		private var speed:Number;
		
		public function NPCgeneric():void 
		{
			width = 16;
			height = 32;
			
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}