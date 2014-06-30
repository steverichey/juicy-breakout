package objects;

import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.math.FlxRandom;

class Ball extends GameObject
{
	public function new(X:Float, Y:Float)
	{
		super(X, Y, Settings.BALL_SIZE, Settings.BALL_SIZE);
		
		immovable = false;
		
		velocity.copyFrom(FlxAngle.getCartesianCoords(300, FlxRandom.float(0, 360)));
	}
	
	override public function update():Void
	{
		updateColor(Settings.COLOR_BALL);
		
		super.update();
	}
}