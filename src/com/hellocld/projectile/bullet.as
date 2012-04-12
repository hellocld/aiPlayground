package com.hellocld.projectile 
{
	import org.flixel.FlxPoint;
	import org.flixel.FlxSprite;
	
	/**
	 * A simple bullet. Use it with bullet manager for radical bullet flying madness
	 * @author cld
	 */
	public class Bullet extends FlxSprite 
	{
		public function Bullet() 
		{
			super(0, 0);
			makeGraphic(1, 1, 0xffffffff);
			width = 1;
			height = 1;
			
			//learn some trig and figure out the x & y velocities by using the provided Angle and Speed
			//trig stuffs here
			
			exists = false;
		}
		
		public function fire(x:int, y:int, speed:Number):void
		{
			this.x = x;
			this.y = y;
			velocity.x = speed;
			exists = true;
		}
		
		override public function update():void 
		{
			super.update();
			
			//if collided with ANYTHING, die
			if (isTouching(ANY) && exists) exists = false;
			//if outside camera view, die
			if (!this.onScreen() && exists) exists = false;
		}
		
		
		
	}

}