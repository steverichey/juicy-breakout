package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.util.FlxSpriteUtil;

class Paddle extends FlxSprite
{
	public function new()
	{
		super(Settings.STAGE_HEIGHT + Settings.PADDLE_HEIGHT / 2 - 50, 0);
		
		makeGraphic(Settings.PADDLE_WIDTH, Settings.PADDLE_HEIGHT, Settings.COLOR_PADDLE);
		
		FlxSpriteUtil.screenCenter(this, true, false);
	}
}