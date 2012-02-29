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
			maxSize = 30;
		}
		
		//call this to spawn any number of enemies; by default it generates only one each time it's called
		public function spawnEnemy(num:int = 1):void
		{
			add(recycle(skittish) as skittish);
		}
		
		//call this to clear up the the group, removing all dead enemies
		public function cleanup():void
		{
			//read through all the existing objects in the group
			for (var i:int = 0; i < length; i++)
			{
				if (!members[i].alive)		//check if the current member is dead, and remove it if so
				{
					remove(members[i], true);
				}
			}
		}
	}

}