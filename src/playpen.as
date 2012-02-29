package  
{
	/**
	 * The playpen is the basic room. It's just an empty sandbox the size of the screen, where the very beginning tests will take place
	 * 
	 * @author cld
	 */
	
	import org.flixel.*;
	import flash.utils.getQualifiedClassName;
	
	public class playpen extends FlxState
	{
		//the wall group
		private var walls:FlxGroup;
		
		//the wall tiles
		private var wWall:FlxTileblock;
		private var eWall:FlxTileblock;
		private var nWall:FlxTileblock;
		private var sWall:FlxTileblock;
		
		//the skittish spawner
		private var skitSpawn:Spawner;
		
		public function playpen():void
		{
			
		}
		
		override public function create():void
		{
			//init the walls
			walls = new FlxGroup();
			
			nWall = new FlxTileblock(0, 0, 304, 16);
			nWall.makeGraphic(304, 16, 0xffffbf00, false, null);
			
			eWall = new FlxTileblock(304, 0, 16, 224);
			eWall.makeGraphic(16, 224, 0xffffbf00, false, null);
			
			sWall = new FlxTileblock(16, 224, 304, 16);
			sWall.makeGraphic(304, 16, 0xffffbf00, false, null);
			
			wWall = new FlxTileblock(0, 16, 16, 224);
			wWall.makeGraphic(16, 224, 0xffffbf00, false, null);
			
			walls.add(nWall);
			walls.add(eWall);
			walls.add(sWall);
			walls.add(wWall);
			
			//add the wall group
			add(walls);
			
			//add the skittish
			skitSpawn = new Spawner();
			skitSpawn.spawnEnemy();
			add(skitSpawn);
			
			//show how many skittish are currently alive
			FlxG.watch(skitSpawn, "length");
		}
		
		override public function update():void
		{
			super.update();
			
			//let the 'r' key reset the state
			if (FlxG.keys.R) FlxG.resetState();
			
			//make the wall and skittish collision-aware
			FlxG.collide(walls, skitSpawn, skitCollide);
			
			//check for collisions between the skittish
			FlxG.collide(skitSpawn, skitSpawn, skitSelf);
			
			if (FlxG.keys.justPressed("SPACE"))
			{
				//clean up the dead enemies before spawning any new baddies
				skitSpawn.cleanup();
				skitSpawn.spawnEnemy();
			}
		}
		
		public function skitCollide(w:FlxTileblock, s:skittish):void
		{
			s.hitWall();
		}
		
		public function skitSelf(s1:skittish, s2:skittish):void
		{
			//only apply damage if the skittish isn't flickering
			if(!s1.flickering) s1.damage();
			if (!s2.flickering) s2.damage();
		}
	}

}