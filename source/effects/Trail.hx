package effects;

import flash.display.BitmapData;
import flixel.FlxG;
import flixel.FlxSprite;
import flixel.math.FlxPoint;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import flixel.util.FlxSpriteUtil;
import openfl.display.Graphics;

class Trail extends FlxSprite
{
	private var points:Array<FlxPoint>;
	private var drawTimer:Float = 3;
	private var graphics:Graphics;
	private var target:FlxSprite;
	
	public function new(Target:FlxSprite)
	{
		super(0, 0);
		
		makeGraphic(FlxG.width, FlxG.height, FlxColor.WHITE);
		
		points = [];
		
		//graphics = new Graphics();
		
		target = Target;
	}
	
	override public function update():Void
	{
		visible = Effects.ballTrail;
		
		if (!Effects.ballTrail)
		{
			return;
		}
		
		if (drawTimer < 0)
		{
			addPoint(target.x + target.width / 2, target.y + target.height / 2);
			redraw();
			drawTimer = 3;
		}
		else
		{
			drawTimer -= FlxG.elapsed;
		}
		
		super.update();
	}
	
	public function addPoint(X:Float, Y:Float):Void
	{
		points.push(FlxPoint.get(X, Y));
		
		while (points.length > Effects.ballTrailLength) points.splice(0, 1)[0].put();
	}
	
	private function redraw():Void
	{
		if (points.length < 8)
		{
			return;
		}
		
		trace("yep " + FlxRandom.int(10, 30));
		
		for (i in 0...points.length - 2)
		{
			FlxSpriteUtil.drawLine(this, points[i].x, points[i].y, points[i + 1].x, points[i + 1].y, { thickness: 2, color: FlxColor.BLACK } );
		}
	}
}