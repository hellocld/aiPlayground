package com.hellocld.player 
{
	import com.hellocld.projectile.*;
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class ShootingPlayer extends Player 
	{
		
		public function ShootingPlayer() 
		{
			super();
		}
		
		override public function update():void
		{
			super.update();
			if (FlxG.keys.justPressed("SPACE"))
			{
				Registry.playerBullets.fire(this.x + width / 2, this.y + height / 2, 400);
			}
		}
		
	}

}