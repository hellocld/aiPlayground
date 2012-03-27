package npc.platformer 
{
	/**
	 * A super-generic platformer npc object
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class NPCHeightFright extends NPCgeneric
	{
		public var cornerCheck:FlxPoint;
		
		public function NPCHeightFright():void 
		{
			super();
			cornerCheck = new FlxPoint(x, y + height + 6);
		}
		
		override public function update():void
		{
			super.update();
			
			
			//update the cornerCheck point accordingly
			cornerCheck.y = y + height + 6;
			if (facing == LEFT)
			{
				cornerCheck.x = x - 1;
			} else {
				cornerCheck.x = x + width + 1;
			}
			
			//things to check while on the floor
			if (isTouching(FLOOR))
			{
				//apply force so you walk!
				if (facing == LEFT)
				{
					acceleration.x -= drag.x;
				} else {
					acceleration.x += drag.x;
				}
				//check to see if that little cornerCheck point is colliding with the floor or not
				//if not, turn around because THERE IS NO FLOOR ONLY ZUUL
				if (!Registry.tilemap.overlapsPoint(cornerCheck))
				{
					facing = (facing == LEFT) ? RIGHT : LEFT;
					acceleration.x = 0;
					FlxG.log("FOUND THE EDGE!!!");
				}
			}
			FlxG.watch(cornerCheck, "x");
			FlxG.watch(cornerCheck, "y");
		}
		
	}

}