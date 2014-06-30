package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class Block extends GameObject
{
	public function new(X:Float, Y:Float, Width:Int = Settings.BLOCK_WIDTH, Height:Int = Settings.BLOCK_HEIGHT)
	{
		super(X, Y, Width, Height);
	}
	
	override public function update():Void
	{
		updateColor(Settings.COLOR_BLOCK);
		
		super.update();
	}
}