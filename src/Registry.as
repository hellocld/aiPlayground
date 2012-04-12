package  
{
	/**
	 * Any major variables that need to be accessed by multiple objects go in here
	 * @author cld
	 */
	import com.hellocld.npc.platformer.*;
	import com.hellocld.npc.topdown.*;
	import com.hellocld.projectile.*;
	import com.hellocld.player.*;
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
		
		//the player
		public static var player:Player;
		
		//a FlxGroup for the level, so all the other objects in the registry can "see" it (soon to be replaced by tilemap:FlxTilemap)
		public static var level:FlxGroup;
		
		
		//le camera
		public static var camera:FlxCamera;
		
		//a bullet handler
		public static var bullets:BulletManager;
		
		public function Registry() 
		{
		}
		
	}

}