package  
{
	/**
	 * The playpen is the basic room. It's just an empty sandbox the size of the screen, where the very beginning tests will take place
	 * This particular playpen is for top-down/birds eye view type testing
	 * 
	 * @author cld
	 */
	
	import org.flixel.*;
	import flash.utils.getQualifiedClassName;
	
	public class PlaypenTopDown extends FlxState
	{
		//the wall group
		private var walls:FlxGroup;
		
		//the wall tiles
		private var wWall:FlxTileblock;
		private var eWall:FlxTileblock;
		private var nWall:FlxTileblock;
		private var sWall:FlxTileblock;
		
		//a group for some obstacles
		private var obstacles:FlxGroup;
		
		//the skittish spawner group
		private var skitSpawn:FlxGroup;
		
		public function playpen():void
		{
			
		}
		
		override public function create():void
		{
			//set the world bounds
			FlxG.worldBounds.make(0, 0, 320, 240);
			
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
			
			//create a few random obstacles
			obstacles = new FlxGroup();
			for (var i:int = 0; i < 5; i++)
			{
				var obs:FlxSprite;
				obs = obstacles.recycle(FlxSprite) as FlxSprite;
				obs.reset(Math.random() * 288 +16, Math.random() * 208 + 16);
				obs.makeGraphic(16, 16, 0xffffff00, false, null);
				obs.immovable = true;
			}
			add(obstacles);
			
			//make the skitSpawn
			skitSpawn = new FlxGroup();
			skitSpawn.maxSize = 5;
			add(skitSpawn);
		}
		
		override public function update():void
		{
			super.update();
			
			//let the 'r' key reset the state
			if (FlxG.keys.R) FlxG.resetState();
			
			//return to the menu with Q
			if (FlxG.keys.Q) FlxG.switchState(new MainMenu);
			
			if (FlxG.keys.justPressed("SPACE") && skitSpawn.countLiving() < skitSpawn.maxSize)
			{
				var skit:skittish;
				skit = skitSpawn.recycle(skittish) as skittish;
				skit.reset((320 - 8) / 2, (240 - 8) / 2);
			}
			
			//check for collisions between the skittish
			FlxG.collide(skitSpawn, skitSpawn, skitCollide);
			
			//make the wall and skittish collision-aware
			FlxG.collide(walls, skitSpawn);
			FlxG.collide(obstacles, skitSpawn);
			
			//show how many skittish are currently alive
			FlxG.watch(skitSpawn, "length");
			
			for (var i:int = 0; i < skitSpawn.length; i++)
			{
				FlxG.watch(skitSpawn.members[i], "health");	
			}
		}
		
		public function skitCollide(s1:skittish, s2:skittish):void
		{
			s1.velocity.x = 0;
			s1.velocity.y = 0;
			s1.acceleration.x = 0;
			s1.acceleration.y = 0;
			s2.velocity.x = 0;
			s2.velocity.y = 0;
			s2.acceleration.x = 0;
			s2.acceleration.y = 0;
			
		}
		
	}

}