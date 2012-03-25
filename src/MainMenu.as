package  
{
	import org.flixel.*;
	/**
	 * ...
	 * @author ...
	 */
	public class MainMenu extends FlxState
	{
		private var topdownButton:FlxButton;
		private var platformButton:FlxButton;
		private var text:FlxText;
		
		public function MainMenu():void 
		{
			
		}
		
		override public function create():void
		{
			FlxG.worldBounds.make(0, 0, 320, 240);
			
			topdownButton = new FlxButton(20, 180, "Top Down", startTopDown);
			platformButton = new FlxButton(20, 200, "Platformer", startPlatformer);
			
			text = new FlxText(20, 20, 280, "aiPlayground\n\nA bunch of stuff where I make things do things.\nAnd stuff.");
			
			add(text);
			add(topdownButton);
			add(platformButton);
		}
		
		public function startTopDown():void
		{
			FlxG.switchState(new PlaypenTopDown);
		}
		
		public function startPlatformer():void
		{
			FlxG.switchState(new PlaypenPlatformer);
		}
	}

}