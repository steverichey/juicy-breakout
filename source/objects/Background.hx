package objects;
import flixel.FlxG;
import flixel.math.FlxRandom;
import flixel.util.FlxColor;
import objects.GameObject.GameObjectType;

class Background extends GameObject
{
	public var glitchForce:Float = 0;
	
	public function new()
	{
		super(FlxG.width / 2, FlxG.height / 2, FlxG.width, FlxG.height);
		
		defaultColor = FlxColor.BLACK.to24Bit();
		objectType = GameObjectType.BACKGROUND;
	}
	
	override public function update():Void
	{
		if (Effects.screenColorGlitch && glitchForce > 0.01)
		{
			color = FlxRandom.color(Settings.COLOR_BACKGROUND, Settings.COLOR_BACKGROUND * 3);
			glitchForce *= 0.8;
		}
		else
		{
			updateColor(Settings.COLOR_BACKGROUND);
		}
		
		super.update();
	}
}