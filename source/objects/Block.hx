package objects;

import flixel.FlxSprite;

class Block extends FlxSprite
{
	public function new(X:Float, Y:Float)
	{
		super();
		
		makeGraphic(Settings.BLOCK_WIDTH, Settings.BLOCK_HEIGHT);
		
		x = X - width / 2;
		y = Y - height / 2;
		
		immovable = true;
	}
}