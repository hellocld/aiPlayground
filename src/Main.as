package 
{
	import org.flixel.*;
	
	/**
	 * a testing bed for NPC creation, handling, and AI (friendly AND enemy)
	 * @author cld
	 */
	
	[SWF(width = "640", height = "480", backgroundColor = "#000000")]
	[Frame(factoryClass = "Preloader")]
	
	public class Main extends FlxGame 
	{
		function Main():void
		{
			super(320, 240, MainMenu, 2, 60, 60, true);
			forceDebugger = true;		
		}
	}
	
}