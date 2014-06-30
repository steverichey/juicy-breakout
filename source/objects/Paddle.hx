package objects;

import flixel.FlxG;

class Paddle extends GameObject
{
	private var mouseX:Float = 0;
	
	public function new()
	{
		super(FlxG.width / 2, Settings.STAGE_HEIGHT - 50, Settings.PADDLE_WIDTH, Settings.PADDLE_HEIGHT);
		
		centerOffsets();
		
		#if !FLX_NO_MOUSE
		x = FlxG.mouse.x - width / 2;
		#end
	}
	
	override public function update():Void
	{
		#if !FLX_NO_MOUSE
		mouseX = FlxG.mouse.x;
		#end
		
		if (Effects.paddleStretch)
		{
			scale.x = 1 + Math.abs((x + width / 2) - mouseX) / 100;
			scale.y = 1.5 - scale.x * .5;
			//updateHitbox();
		}
		else if (!(scale.x == 1 && scale.y == 1))
		{
			scale.set(1, 1);
			//updateHitbox();
		}
		
		x = mouseX - width / 2;
		
		updateColor(Settings.COLOR_PADDLE);
		
		super.update();
	}
}