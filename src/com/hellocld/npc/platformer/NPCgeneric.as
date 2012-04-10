package com.hellocld.npc.platformer 
{
	/**
	 * A super-generic platformer npc object
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class NPCgeneric extends FlxSprite
	{
		protected var speed:Number;
		
		public function NPCgeneric():void 
		{
			//dimensions
			width = 16;
			height = 32;
			//gravity
			acceleration.y = Registry.gravity;
			//speed
			speed = 50;
			drag.x = speed * 8;
			
			maxVelocity.x = speed;
			
			//set the facing direction
			facing = LEFT;
			
			//tangerine tango square!
			makeGraphic(16, 32, 0xffe2492f, false);
		}
		
		override public function update():void
		{
			super.update();
		}
		
	}

}