package objects;

import flixel.FlxSprite;

class Line extends GameObject
{
	private var neverBounce:Bool = false;
	
	public function new(X:Float, Y:Float, Width:Int, Height:Int, NeverBounce:Bool = false)
	{
		super(X, Y, Width, Height);
		
		neverBounce = NeverBounce;
	}
	
	override public function update():Void
	{
		updateColor(Settings.COLOR_BOUNCY_LINES);
		
		super.update();
	}
}