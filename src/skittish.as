package  
{
	/**
	 * The skittish is very similar to the octo guys from TLOZ, except they don't shoot anything.
	 * They randomly shuttle about the stage, and if they hit a wall they pause for a moment before moving again
	 * 
	 * @author cld
	 */
	
	import org.flixel.*
	 
	public class skittish extends FlxSprite
	{
		//the speed variable
		private var speed:Number;
		
		//in order to do all the moving and random stuff, it's gonna need a clock
		public var clock:Number;
		
		//the min and max time the skittish can move for and sit still
		private var maxMoveTime:Number;
		private var minMoveTime:Number;
		private var maxIdleTime:Number;
		private var minIdleTime:Number;
		
		//a boolean to keep track of whether the skittish is active or idle
		private var idle:Boolean;
		
		public function skittish():void 
		{
			//super, set the position of the skittish
			super((320 - 8) / 2, (240 - 8) / 2);
			
			//set the size of the skittish
			width = 16;
			height = 16;
			
			//set the speed
			speed = 200.0;
			
			//initial direction and movement
			setDirection();
			applyVelocity();
			
			//set the max acceleration
			maxVelocity.x = maxVelocity.y = speed;
			
			//draaaaaaag
			drag.x = speed * 10;
			drag.y = speed * 10;
			
			//set the health of the skittish
			health = 3;
			
			//make a little square for the skittish, since there's no art yet
			makeGraphic(16, 16, 0xffff0bff, false, null);
			
			//set the clock minimums and maxes
			maxMoveTime = 0.25;
			minMoveTime = 0.1;
			
			maxIdleTime = 1.0;
			minIdleTime = 0.25;
			
			//start the clock at some random value for initial movement
			clock = (Math.random() * (maxMoveTime - minMoveTime)) + minMoveTime;
			
			//make the skittish active
			idle = false;
			
			//flicker initially, so it can't get hit
			flicker(0.5);
		}
		
		override public function update():void
		{
			super.update();
			//if the skittish is idle, wait
			if (idle)
			{
				//set all velocity to 0 so it doesn't move (hence "idle")
				//drag should handle the stopping of the skittish
				velocity.x = 0;
				velocity.y = 0;
				
				//subtract time from the clock
				clock -= FlxG.elapsed;
				
				//if the clock has run out, set the clock up for move time, pick a new direction, and set idle to 'false'
				if (clock <= 0)
				{
					clock = (Math.random() * (maxMoveTime - minMoveTime)) + minMoveTime;
					setDirection();
					idle = false;
				}
			//if not idle...	
			} else {
				
				//start counting down on the clock again
				clock -= FlxG.elapsed;
				
				//as long as it's not flickering, make it move
				if(!flickering) applyVelocity();
				
				//check the clock; if it's finished, set the idle time and set idle to 'true'
				if (clock <= 0 || isTouching(FlxObject.WALL))
				{
					clock = (Math.random() * (maxIdleTime - minIdleTime)) + minIdleTime;
					idle = true;
				}
			}
		}
		
		private function setDirection():void
		{
			//a little function that generates a random direction
			//make a random number between 0 and 3
			var d:int = Math.random() * 4;
			
			//switch:case to set the direction
			switch(d)
			{
				case 0:
					facing = RIGHT;
					break;
				case 1:
					facing = DOWN;
					break;
				case 2:
					facing = LEFT;
					break;
				case 3:
					facing = UP;
					break;
			}
		}
		
		//this function applies velocity to the skittish depending on which direction it's facing
		private function applyVelocity():void
		{
			//determine the acceleration of the skittish based on the direction it's facing
			//there HAS to be a better way than this stupid switch/case
			switch(facing)
			{
				case UP:
					velocity.x = 0;
					velocity.y -= speed;
					break;
				case DOWN:
					velocity.x = 0;
					velocity.y += speed;
					break;
				case LEFT:
					velocity.x -= speed;
					velocity.y = 0;
					break;
				case RIGHT:
					velocity.x += speed;
					velocity.y = 0;
					break;
			}
		}
		
		//this guy only gets called if the skittish runs into a wall. They're kinda dumb, they just wait and try to move again
		public function hitWall():void
		{
			setDirection();
			clock = (Math.random() * (maxIdleTime - minIdleTime)) + minIdleTime;
			idle = true;
		}
		
		override public function revive():void
		{
			super.revive();
			health = 3;
		}
		
	}

}