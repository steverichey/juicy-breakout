package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;

class Paddle extends FlxSprite
{
	public function new()
	{
		super(0, Settings.STAGE_HEIGHT - 50);
		
		makeGraphic(Settings.PADDLE_WIDTH, Settings.PADDLE_HEIGHT);
		
		elasticity = 1;
		immovable = true;
		
		FlxSpriteUtil.screenCenter(this, true, false);
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
		
		if (Effects.screenColors && color == FlxColor.WHITE)
		{
			color = Settings.COLOR_PADDLE;
		}
		else if (!Effects.screenColors && color != FlxColor.WHITE)
		{
			color = FlxColor.WHITE;
		}
		
		super.update();
	}
}