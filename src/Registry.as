package  
{
	/**
	 * Any major variables that need to be accessed by multiple objects go in here
	 * @author cld
	 */
	import npc.platformer.*;
	import npc.topdown.*;
	import org.flixel.*;
	
	
	public class Registry 
	{
		//gfx data embeds
		[Embed(source = "data/gfx/tiles.png")] public static var tilesPNG:Class;
		
		//stage data embeds
		[Embed(source = "data/csv/mapCSV_Group1_Map1.csv", mimeType = "application/octet-stream")] public static var platformerCSV:Class;
		
		//the tilemap
		public static var tilemap:FlxTilemap;
		
		//universal gravity
		public static var gravity:Number;
		
		//npc for the Platformer playpen
		public static var npc:NPCgeneric;
		
		//a FlxGroup for the level, so all the other objects in the registry can "see" it (soon to be replaced by tilemap:FlxTilemap)
		public static var level:FlxGroup;
		
		public function Registry() 
		{
		}
		
	}

}