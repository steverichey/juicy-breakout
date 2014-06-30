package objects;

import flixel.FlxSprite;

class Line extends GameObject
{
	public function new(X:Float, Y:Float, Width:Int, Height:Int)
	{
		super(X, Y, Width, Height);
	}
	
	override public function update():Void
	{
		updateColor(Settings.COLOR_BOUNCY_LINES);
		
		super.update();
	}
}