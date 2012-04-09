package npc.platformer 
{
	/**
	 * A hopper. Who hops. Hop hop hop.
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class NPCHopper extends NPCgeneric 
	{
		private var jumpPower:int;
		
		public function NPCHopper() 
		{
			super();
			jumpPower = -200;
			drag.y = jumpPower * 8;
		}
		
		override public function update():void
		{
			super.update();
			
			//if he hits the ground he just hops up again
			if (isTouching(FLOOR)) velocity.y = jumpPower;
			
			//apply horizontal movement
			acceleration.x += (facing == LEFT) ? ( -speed) : (speed);
			
			//if he touches the wall, he turns around and goes the other way
			if (isTouching(WALL))
			{
				acceleration.x = 0;
				FlxG.log("TOUCHED THE WALL");
				if (facing == LEFT)
				{
					facing == RIGHT;
				} else {
					facing == LEFT;
				}
			}
			
			FlxG.watch(this, "facing");
			FlxG.watch(this.acceleration, "x");
		}
		
	}

}