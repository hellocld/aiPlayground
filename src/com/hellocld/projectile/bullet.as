package com.hellocld.projectile 
{
	import org.flixel.FlxSprite;
	
	/**
	 * A simple bullet. Use it with bullet manager for radical bullet flying madness
	 * @author cld
	 */
	public class bullet extends FlxSprite 
	{
		
		public function bullet(X:Number = 0, Y:Number = 0, Angle:Number = 0, Speed:Number = 5, Power:Number, SimpleGraphic:Class = null) 
		{
			super(X, Y, SimpleGraphic);
			width = 1;
			height = 1;
			speed = Speed;
			
			//learn some trig and figure out the x & y velocities by using the provided Angle and Speed
			//trig stuffs here
		}
		
		
	}

}