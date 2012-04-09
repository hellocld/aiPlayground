package npc.platformer 
{
	/**
	 * A hopper. Who hops. Hop hop hop.
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class NPCHopper extends NPCWalker
	{
		private var jumpPower:int;
		
		public function NPCHopper() 
		{
			super();
			jumpPower = -180;
			drag.y = jumpPower * 8;
		}
		
		override public function update():void
		{
			super.update();
			
			//if he hits the ground he just hops up again
			if (isTouching(FLOOR)) velocity.y = jumpPower;
			
		}
		
	}

}