package  
{
	/**
	 * A basic enemy spawner class - this on it's own spawns skittishes, but it can be edited to spawn any number of creatures
	 * @author cld
	 */
	
	import org.flixel.*;
	
	public class Spawner extends FlxGroup
	{
		
		public function Spawner() 
		{
			//just to be on the safe side, set a max size for the spawner
			maxSize = 5;
		}
		
		/**
		 * call this to spawn an enemy; by default it generates one in the center of the screen
		 */
		public function spawnEnemy(xPos:int = (320 - 8) / 2, yPos:int = (240 - 8) / 2):void
		{
			var tempSkit:skittish = recycle(skittish) as skittish;
			tempSkit.reset(xPos, yPos);
		}
		
	}

}