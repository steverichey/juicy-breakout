package objects;

import flixel.FlxSprite;
import flixel.math.FlxRandom;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;
import flixel.util.FlxColor;
import objects.GameObject.GameObjectType;

class Block extends GameObject
{
	public function new(X:Float, Y:Float, Width:Int = Settings.BLOCK_WIDTH, Height:Int = Settings.BLOCK_HEIGHT)
	{
		super(X, Y, Width, Height);
		
		objectType = GameObjectType.BLOCK;
		
		if (Effects.tweenInEnabled)
		{
			if (Effects.tweenInPropertyY)
			{
				y = -height * 2;
				FlxTween.tween(this, { y:Y }, Effects.tweenInDuration, { ease:FlxEase.elasticOut } );
			}
			
			if (Effects.tweenInPropertyScale)
			{
				angle = FlxRandom.float( -45, 45);
				FlxTween.tween(this, { angle:0 }, Effects.tweenInDuration, { ease:FlxEase.cubeOut } );
			}
			
			if (Effects.tweenInPropertyScale)
			{
				scale.set(0.2, 0.2);
				FlxTween.tween(this.scale, { x:1, y:1 }, Effects.tweenInDuration, { ease:FlxEase.bounceOut } );
			}
		}
	}
	
	override public function update():Void
	{
		updateColor(Settings.COLOR_BLOCK);
		
		super.update();
	}
}