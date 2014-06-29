package objects;

import flixel.FlxSprite;
import flixel.text.FlxText;
import flixel.util.FlxColor;

class Option extends FlxSprite
{
	private var label:FlxText;
	
	public function new(X:Float, Y:Float, Width:Int, Height:Int, Text:String):Void
	{
		super(X, Y);
		
		makeGraphic(Width, Height);
		
		label = new FlxText(X, Y, Width, Text);
		label.color = FlxColor.BLACK;
	}
	
	override public function draw():Void
	{
		super.draw();
		label.draw();
	}
}