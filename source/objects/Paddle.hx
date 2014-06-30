package objects;

import flixel.FlxG;

class Paddle extends GameObject
{
	public function new()
	{
		super(FlxG.width / 2, Settings.STAGE_HEIGHT - 50, Settings.PADDLE_WIDTH, Settings.PADDLE_HEIGHT);
	}
	
	override public function update():Void
	{
		#if !FLX_NO_MOUSE
		x = FlxG.mouse.x - width / 2;
		#elseif !FLX_NO_TOUCH
		if (FlxG.touches.getFirst() != null)
		{
			x = FlxG.touches.getFirst().x;
		}
		#end
		
		updateColor(Settings.COLOR_PADDLE);
		
		super.update();
	}
}