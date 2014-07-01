package objects;

import flixel.FlxG;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import flixel.math.FlxAngle;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.math.FlxVelocity;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import objects.GameObject.GameObjectType;
import effects.Trail;

class Ball extends GameObject
{
	private var desiredAngle:Float = 0;
	private var angleTween:FlxTween;
	private var extraScale:Float = 0;
	public var trail:Trail;
	
	public function new(X:Float, Y:Float)
	{
		super(X, Y, Settings.BALL_SIZE, Settings.BALL_SIZE);
		
		immovable = false;
		objectType = GameObjectType.BALL;
		
		velocity.copyFrom(FlxAngle.getCartesianCoords(300, FlxRandom.float(0, 360)));
		
		trail = new Trail(this);
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
		
		if (Effects.ballStretch)
		{
			if (!Effects.ballStretchAnimated)
			{
				scale.x = 1 + (FlxMath.vectorLength(velocity.x, velocity.y) - Settings.BALL_MIN_VELOCITY) / (Settings.BALL_MAX_VELOCITY - Settings.BALL_MIN_VELOCITY) * 0.3;
				scale.y = 1 - (FlxMath.vectorLength(velocity.x, velocity.y) - Settings.BALL_MIN_VELOCITY) / (Settings.BALL_MAX_VELOCITY - Settings.BALL_MIN_VELOCITY) * 0.2;
			}
			else
			{
				var relative:Float = 1 + FlxMath.vectorLength(velocity.x, velocity.y) / ( 2 * Settings.BALL_MAX_VELOCITY);
				relative = FlxMath.bound(relative, 1.0, 2.5);
				
				scale.x = 1 * relative;
				scale.y = 1 / relative;
				
				scale.x = FlxMath.bound(scale.x, 0.85, 1.35);
				scale.y = FlxMath.bound(scale.y, 0.85, 1.35);
			}
		}
		
		if (Effects.ballExtraScale)
		{
			scale.x += extraScale;
			scale.y += extraScale;
			
			if (extraScale > 0.01)
			{
				extraScale *= 0.35;
			}
		}
		
		if (!Effects.ballExtraScale && !Effects.ballStretch)
		{
			scale.set(1, 1);
		}
		
		super.update();
	}
	
	public function bounce():Void
	{
		if (Effects.ballGlow)
		{
			FlxTween.color(this, 0.7, FlxColor.WHITE, color, { ease: FlxEase.backOut, type: FlxTween.BACKWARD } );
		}
		
		if (Effects.ballExtraScale)
		{
			extraScale += 1.5;
		}
	}
	
	private inline function angleFromVelocity(Velocity:FlxPoint):Float
	{
		return FlxAngle.wrapAngle(Math.atan2(Velocity.y, Velocity.x) / Math.PI * 180);
	}
}