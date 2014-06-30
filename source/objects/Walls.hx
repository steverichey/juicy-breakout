package objects;

import flixel.FlxG;
import flixel.group.FlxGroup.FlxTypedGroup;

class Walls extends FlxTypedGroup<Line>
{
	public function new()
	{
		super();
		
		// typing these over and over looks ridiculous
		var dis:Int = Settings.BOUNCY_LINES_DISTANCE_FROM_WALL;
		var wid:Int = Settings.BOUNCY_LINES_WIDTH;
		
		// left line
		add(new Line(0, FlxG.height / 2, wid, FlxG.height));
		// top line
		add(new Line(FlxG.width / 2, 0, FlxG.width, wid));
		// right line
		add(new Line(FlxG.width, FlxG.height / 2, wid, FlxG.height));
	}
}