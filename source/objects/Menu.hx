package objects;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.group.FlxSpriteGroup;
import flixel.tweens.FlxEase;
import flixel.tweens.FlxTween;

class Menu extends FlxSpriteGroup
{
	private var _bg:FlxSprite;
	
	public function new()
	{
		super();
		
		_bg = new FlxSprite();
		_bg.makeGraphic(100, FlxG.height);
		add(_bg);
		
		var option:Option = new Option(0, 0, Std.int(width), 20, "This is an option");
		add(option);
		
		visible = false;
		x = -width;
	}
	
	public function toggle():Void
	{
		if (!visible)
		{
			visible = true;
			FlxTween.tween(this, { x: 0 }, 0.25, { ease: FlxEase.cubeInOut } );
		}
		else
		{
			FlxTween.tween(this, { x: -width }, 0.25, { ease: FlxEase.cubeInOut, complete: endHide } );
		}
	}
	
	private function endHide(?f:FlxTween):Void
	{
		visible = false;
	}
}