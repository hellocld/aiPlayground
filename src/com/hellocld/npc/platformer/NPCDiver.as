package com.hellocld.npc.platformer 
{
	import org.flixel.FlxPoint;
	/**
	 * ...
	 * @author ...
	 */
	public class NPCDiver extends NPCWalker 
	{
		protected var cornerCheck:FlxPoint;
		private var jumpPower:int;
		
		public function NPCDiver() 
		{
			super();
			cornerCheck = new FlxPoint(x - 1, y + height + 1);
			jumpPower = -180;
			drag.y = jumpPower * 8;
		}
		
		override public function update():void
		{
			super.update();
			
			if (isTouching(FLOOR) && !Registry.tilemap.overlapsPoint(cornerCheck)) velocity.y += jumpPower;
			
		}
		
		override public function updateBumpers():void
		{
			super.updateBumpers();
			
			cornerCheck.y = y + height +1;
			cornerCheck.x = (facing == LEFT) ? (x - 1):(x + width + 1);
		}
		
	}

}