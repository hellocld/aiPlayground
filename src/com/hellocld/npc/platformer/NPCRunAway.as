package com.hellocld.npc.platformer 
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class NPCRunAway extends NPCWalker 
	{
		
		public function NPCRunAway() 
		{
			super();
			speed = 120;
			maxVelocity.x = speed * 2;
		}
		
		override public function update():void
		{
			super.update();
			if (getDistance(this.getMidpoint(), Registry.player.getMidpoint()) <= 32)
			{
				FlxG.log("RUN AWAY!!!");
				if (Registry.player.x > x)
				{
					facing = LEFT;
				} else {
					facing = RIGHT;
				}
			}
		}
		
		private function getDistance(pointA:FlxPoint, pointB:FlxPoint):Number
		{
			var dx:int = pointA.x - pointB.x;
			var dy:int = pointA.y - pointB.y;
			return Math.sqrt(dx * dx + dy * dy);
		}
	}

}