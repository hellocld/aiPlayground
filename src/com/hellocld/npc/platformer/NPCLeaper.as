package com.hellocld.npc.platformer 
{
	import org.flixel.*;
	/**
	 * Leaps to platforms (kinda dumb though, just jumps into high walls at the moment
	 * @author cld
	 */
	public class NPCLeaper extends NPCWalker 
	{
		//a FlxPoint to check for a platform within jumping distance
		protected var leapPoint:FlxPoint;
		
		protected var jumpPower:int;
		public function NPCLeaper() 
		{
			super();
			
			//set up the leapPoint
			leapPoint = new FlxPoint(x - 16, y - 64);
			
			jumpPower = -500;
			drag.y = jumpPower * 32;
		}
		
		override public function update():void
		{
			super.update();
			if (isTouching(FLOOR) && Registry.tilemap.overlapsPoint(leapPoint))
			{
				FlxG.log("LEAP");
				velocity.y += jumpPower;
			}
		}
		
		override public function updateBumpers():void
		{
			super.updateBumpers();
			leapPoint.y = y - 64;
			leapPoint.x = (facing == LEFT) ? (x - 16): (x + width + 16);
		}
		
	}

}