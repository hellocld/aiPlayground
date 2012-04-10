package npc.platformer 
{
	/**
	 * Ever so slightly less basic NPC; walks back and forth, turning around when he walks into a wall
	 * @author cld
	 */
	import org.flixel.*;
	
	public class NPCWalker extends NPCgeneric 
	{
		//a FlxRect to simulate touch for a very nearsighted bot
		protected var frontBumper:FlxObject;
		
		public function NPCWalker() 
		{
			super();
			frontBumper = new FlxObject(x - 1, y, 1, height);
		}
		
		override public function update():void
		{
			super.update();
			acceleration.x += (facing == LEFT) ? ( -speed) : (speed);
			
			//make sure the front bumper is actually in front of the bot
			updateBumpers();
			
			if (frontBumper.overlaps(Registry.tilemap))
			{
				FlxG.log("OVERLAP");
				facing = (facing == LEFT) ? RIGHT : LEFT;
				acceleration.x = 0;
				updateBumpers();
			}
			
		}
		
		//updates the position of the bumpers accordingly
		public function updateBumpers():void
		{
			frontBumper.x = (facing == LEFT) ? (x - 1) : (x + width);
			frontBumper.y = y;
		}
		
	}

}