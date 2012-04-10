package com.hellocld.npc.platformer 
{
	/**
	 * A super-generic platformer npc object
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class NPCHeightFright extends NPCWalker
	{
		//this point checks below the front of the character to see if there's a floor to step on or not
		public var cornerCheck:FlxPoint;
		//this point checks to make sure there's nothing right in front of it
		public var frontCheck:FlxPoint;
		
		public function NPCHeightFright():void 
		{
			super();
			cornerCheck = new FlxPoint(x, y + height + 6);
		}
		
		override public function update():void
		{
			super.update();
			
			//check to see if that little cornerCheck point is colliding with the floor or not
			//if not, turn around because THERE IS NO FLOOR ONLY ZUUL
			if (isTouching(FLOOR) && !Registry.tilemap.overlapsPoint(cornerCheck))
			{
				facing = (facing == LEFT) ? RIGHT : LEFT;
				acceleration.x = 0;
			}
		}
		
		override public function updateBumpers():void
		{
			super.updateBumpers();
			
			//update the cornerCheck and frontCheck points accordingly
			cornerCheck.y = y + height + 6;
			cornerCheck.x = (facing == LEFT) ? (x - 1):(x + width + 1);
		}
		
	}

}