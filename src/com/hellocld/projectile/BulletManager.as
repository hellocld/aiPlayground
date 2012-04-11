package com.hellocld.projectile 
{
	import org.flixel.FlxGroup;
	
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
		}
		
		public function addBullet(b:Bullet)
		{
			add(b);
		}
		
	}

}