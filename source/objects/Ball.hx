package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxAngle;
import flixel.math.FlxRandom;

class Ball extends FlxSprite
{
	public function new(X:Float, Y:Float)
	{
		super();
		
		makeGraphic(Settings.BALL_SIZE, Settings.BALL_SIZE);
		
		x = X - width / 2;
		y = Y - height / 2;
		
		elasticity = 1;
		
		velocity.copyFrom(FlxAngle.getCartesianCoords(300, FlxRandom.float(0, 360)));
	}
	
	override public function update():Void
	{
		if (y > FlxG.height - height)
		{
			y = FlxG.height - height;
			velocity.y *= -1;
		}
		
		super.update();
	}
}