package  
{
	import org.flixel.*;
	
	/**
	 * This playpen is for testing out 2D platformer AI types
	 * 
	 * @author cld
	 */
	public class PlaypenPlatformer extends FlxState
	{
		private var walls:FlxGroup;
		private var Lwall:FlxTileblock;
		private var Rwall:FlxTileblock;
		private var Twall:FlxTileblock;
		private var Bwall:FlxTileblock;
		private var plat:FlxTileblock;
		
		public function PlaypenPlatformer():void 
		{
			
		}
		override public function create():void
		{
			//huge bit of code here to add four walls and a platform, thus making a room
			walls = new FlxGroup();
			Twall = new FlxTileblock(0, 0, 304, 16);
			Twall.makeGraphic(304, 16, 0xffffffff, false);
			Rwall = new FlxTileblock(304, 0, 16, 224);
			Rwall.makeGraphic(16, 224, 0xffffffff, false);
			Bwall = new FlxTileblock(16, 224, 304, 16);
			Bwall.makeGraphic(304, 16, 0xffffffff, false);
			Lwall = new FlxTileblock(0, 16, 16, 224);
			Lwall.makeGraphic(16, 224, 0xffffffff, false);
			
			plat = new FlxTileblock(128, 112, 64, 16);
			plat.makeGraphic(64, 16, 0xff777777, false);
			
			walls.add(Twall);
			walls.add(Rwall);
			walls.add(Bwall);
			walls.add(Lwall);
			walls.add(plat);
			
			add(walls);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.Q) FlxG.switchState(new MainMenu);
		}
		
	}

}