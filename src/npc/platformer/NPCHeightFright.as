package npc.platformer 
{
	/**
	 * A super-generic platformer npc object
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class NPCHeightFright extends NPCgeneric
	{
		//this point checks below the front of the character to see if there's a floor to step on or not
		public var cornerCheck:FlxPoint;
		//this point checks to make sure there's nothing right in front of it
		public var frontCheck:FlxPoint;
		
		public function NPCHeightFright():void 
		{
			super();
			cornerCheck = new FlxPoint(x, y + height + 6);
			frontCheck = new FlxPoint(x, y + (height / 2));
		}
		
		override public function update():void
		{
			super.update();
			
			
			//update the cornerCheck and frontCheck points accordingly
			cornerCheck.y = y + height + 6;
			frontCheck.y = y + (height / 2);
			if (facing == LEFT)
			{
				cornerCheck.x = x - 1;
				frontCheck.x = x - 1;
			} else {
				cornerCheck.x = x + width + 1;
				frontCheck.x = x + width + 1;
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
				//do the same basic check for walls in front of the npc
				if (Registry.tilemap.overlapsPoint(frontCheck))
				{
					facing = (facing == LEFT) ? RIGHT : LEFT;
					acceleration.x = 0;
					FlxG.log("FOUND A WALL");
				}
			}
		}
		
	}

}