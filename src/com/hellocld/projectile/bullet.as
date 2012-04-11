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
		protected var vel:FlxPoint;
		public function Bullet(X:Number = 0, Y:Number = 0, Angle:Number = 0, Speed:Number = 5, Power:Number, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			width = 1;
			height = 1;
			speed = Speed;
			
			//learn some trig and figure out the x & y velocities by using the provided Angle and Speed
			//trig stuffs here
			vel.x = 1; //change to the maths
			vel.y = 0; //   "    "  "    "
		}
		
		override public function update():void 
		{
			super.update();
			velocity = vel;
			
			//if collided with ANYTHING, die
			if (isTouching(ANY)) kill();
			//if outside camera view, die
			if (!onScreen) kill();
		}
		
		
		
	}

}