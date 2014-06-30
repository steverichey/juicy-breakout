package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;

class GameObject extends FlxSprite
{
	/**
	 * This allows objectType == GameObjectType.PADDLE or whatever instead of expensive Std.is()
	 */
	public var objectType:GameObjectType = GameObjectType.NONE;
	
	private var defaultColor:FlxColor = FlxColor.WHITE.to24Bit();
	
	public function new(X:Float = 0, Y:Float = 0, Width:Int = Settings.BLOCK_WIDTH, Height:Int = Settings.BLOCK_HEIGHT)
	{
		super();
		
		color = defaultColor;
		
		makeGraphic(Width, Height, color + 0xff000000);
		
		x = X - width / 2;
		y = Y - height / 2;
		
		elasticity = 1;
		immovable = true;
	}
	
	private function updateColor(Color:FlxColor):GameObject
	{
		if (Effects.screenColors && color != Color)
		{
			color = Color;
		}
		else if (!Effects.screenColors && color != defaultColor)
		{
			color = defaultColor;
		}
		
		return this;
	}
}

enum GameObjectType
{
	NONE;
	BACKGROUND;
	BALL;
	BLOCK;
	LINE;
	MENU;
	OPTION;
	PADDLE;
}