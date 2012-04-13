package  
{
	import org.flixel.*;
	import com.hellocld.player.*;
	import com.hellocld.projectile.*;
	/**
	 * Testing bed for other shenanigans
	 * @author cld
	 */
	public class OtherState extends FlxState 
	{
		
		public function OtherState() 
		{
			
		}
		override public function create():void
		{
			FlxG.worldBounds.make(0, 0, 320, 240);
			
			//set global gravity in the Registry
			Registry.gravity = 1600;
			
			//huge bit of code here to create the room from the tilemap in the registry
			Registry.tilemap = new FlxTilemap();
			Registry.tilemap.loadMap(new Registry.platformerCSV, Registry.tilesPNG, 16, 16, 0, 0, 1, 1);
			
			add(Registry.tilemap);
			
			//make a little player dude
			Registry.player = new ShootingPlayer();
			Registry.player.x = 64;
			Registry.player.y = 64;
			add(Registry.player);
			
			Registry.playerBullets = new BulletManager();
			add(Registry.playerBullets);
		}
		
		override public function update():void
		{
			super.update();
			
			if (FlxG.keys.justPressed("Q")) FlxG.switchState(new MainMenu);
			if (FlxG.keys.justPressed("R")) FlxG.resetState();
			FlxG.collide(Registry.player, Registry.tilemap);
			FlxG.collide(Registry.playerBullets, Registry.tilemap);
		}
	}

}