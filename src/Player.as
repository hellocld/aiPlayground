package  
{
	import org.flixel.*;
	/**
	 * Your standard basic player FlxSprite
	 * @author cld
	 */
	public class Player extends FlxSprite
	{
		protected var jumpPower:int;
		protected var speed:int;
		
		public function Player() 
		{
			jumpPower = -500;
			speed = 60;
			maxVelocity.x = speed * 4;
			drag.x = speed * 32;
			drag.y = jumpPower * 32;
			width = 16;
			height = 32;
			acceleration.y = Registry.gravity;
			makeGraphic(16, 32, 0xff7777ff);
			
		}
		
		override public function update():void
		{
			super.update();
			
			//player input stuffs
			if (FlxG.keys.LEFT)
			{
				velocity.x -= speed;
				facing = LEFT;
			}
			if (FlxG.keys.RIGHT)
			{
				velocity.x += speed;
				facing = RIGHT;
			}
			if (isTouching(FLOOR))
			{
				if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("C"))
				{
					velocity.y += jumpPower;
				}
			}
		}
		
	}

}