package  
{
	import org.flixel.*;
	import npc.platformer.*;
	
	/**
	 * This playpen is for testing out 2D platformer AI types
	 * 
	 * @author cld
	 */
	public class PlaypenPlatformer extends FlxState
	{
		
		public function PlaypenPlatformer():void 
		{
			
		}
		override public function create():void
		{
			//set global gravity in the Registry
			Registry.gravity = 800;
			
			//huge bit of code here to create the room from the tilemap in the registry
			Registry.tilemap = new FlxTilemap();
			Registry.tilemap.loadMap(new Registry.platformerCSV, Registry.tilesPNG, 16, 16, 0, 0, 1, 1);
			
			add(Registry.tilemap);
			
			//do a little setup on our NPC and add it
			Registry.npc = new NPCLeaper();
			Registry.npc.x = 152;
			Registry.npc.y = 32;
			add(Registry.npc);
			
			//set up our player sprite
			Registry.player = new Player();
			Registry.player.x = 32;
			Registry.player.y = 32;
			add(Registry.player);
		}
		
		override public function update():void
		{
			super.update();
			//quit and reset keys
			if (FlxG.keys.Q) FlxG.switchState(new MainMenu);
			if (FlxG.keys.R) FlxG.resetState();
			
			//set collision stuff so the NPC has some boundaries
			FlxG.collide(Registry.npc, Registry.tilemap);
			FlxG.collide(Registry.player, Registry.tilemap);
			FlxG.collide(Registry.player, Registry.npc);
			
		}
		
	}

}