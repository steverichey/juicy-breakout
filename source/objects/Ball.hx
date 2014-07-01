package objects;

import flixel.FlxG;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.math.FlxVelocity;
import flixel.tweens.FlxTween;
import objects.GameObject.GameObjectType;

class Ball extends GameObject
{
	private var desiredAngle:Float = 0;
	private var angleTween:FlxTween;
	
	public function new(X:Float, Y:Float)
	{
		super(X, Y, Settings.BALL_SIZE, Settings.BALL_SIZE);
		
		immovable = false;
		objectType = GameObjectType.BALL;
		
		velocity.copyFrom(FlxAngle.getCartesianCoords(300, FlxRandom.float(0, 360)));
	}
	
	override public function update():Void
	{
		updateColor(Settings.COLOR_BALL);
		
		if (Effects.ballRotate)
		{
			if (!Effects.ballRotateAnimated)
			{
				angle = angleFromVelocity(velocity);
			}
			else
			{
				angle += (angleFromVelocity(velocity) - angle) / 4;
			}
		}
		else
		{
			angle = 0;
		}
		
		super.update();
	}
	
	public function bounce():Void
	{
		if (Effects.ballExtraScale)
		{
			
		}
	}
	
	private inline function angleFromVelocity(Velocity:FlxPoint):Float
	{
		return FlxAngle.wrapAngle(Math.atan2(Velocity.y, Velocity.x) / Math.PI * 180);
	}
}