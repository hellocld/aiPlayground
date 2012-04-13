package com.hellocld.projectile 
{
	import org.flixel.FlxGroup;
	import org.flixel.FlxG;
	
	/**
	 * A basic bullet manager. Every entity that can fire bullets gets one
	 * @author cld
	 */
	public class BulletManager extends FlxGroup 
	{
		
		public function BulletManager() 
		{
			//max number of bullets
			maxSize = 10;
			for (var i:int = 0; i < maxSize; i++)
			{
				add(new Bullet);
			}
		}
		
		public function fire(x:Number, y:Number, vel:Number):void
		{
			if (getFirstAvailable()) 
			{
				FlxG.log("FIRE");
				Bullet(getFirstAvailable()).fire(x, y, vel);
			}
		}
		
	}

}