package objects;

import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.math.FlxRandom;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

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
	
	private function tweenIn(X:Float, Y:Float):Void
	{
		if (Effects.tweenInEnabled)
		{
			if (Effects.tweenInPropertyY)
			{
				y = -height * 2;
				FlxTween.tween(this, { y:Y }, Effects.tweenInDuration + FlxRandom.float(-0.2, 0.2), { ease:FlxEase.elasticOut } );
			}
			
			if (Effects.tweenInPropertyScale)
			{
				angle = FlxRandom.float( -45, 45);
				FlxTween.tween(this, { angle:0 }, Effects.tweenInDuration + FlxRandom.float(-0.2, 0.2), { ease:FlxEase.cubeOut } );
			}
			
			if (Effects.tweenInPropertyScale)
			{
				var initialScale:Float = FlxRandom.float(0.1, 0.3);
				scale.set(initialScale, initialScale);
				FlxTween.tween(this.scale, { x:1, y:1 }, Effects.tweenInDuration + FlxRandom.float(-0.2, 0.2), { ease:FlxEase.bounceOut } );
			}
		}
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