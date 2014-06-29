package objects;

import flixel.FlxSprite;

class Line extends FlxSprite
{
	public function new(X:Float, Y:Float, Width:Int, Height:Int)
	{
		super(X, Y);
		
		makeGraphic(Width, Height);
		
		immovable = true;
		elasticity = 1;
	}
}