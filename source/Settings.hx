package;

import flixel.util.FlxColor;

class Settings
{
	public static inline var STAGE_WIDTH:Int = 800;
	public static inline var STAGE_HEIGHT:Int = 600;
	
	public static inline var BLOCK_WIDTH:Int = 50;
	public static inline var BLOCK_HEIGHT:Int = 20;
	
	public static inline var PADDLE_WIDTH:Int = 100;
	public static inline var PADDLE_HEIGHT:Int = 30;
	
	public static inline var BOUNCY_LINES_DISTANCE_FROM_WALL:Int = 5;
	public static inline var BOUNCY_LINES_WIDTH:Int = 20;
	
	public static inline var BALL_MAX_VELOCITY:Float = 5;
	public static inline var BALL_MIN_VELOCITY:Float = 4;
	public static inline var BALL_SIZE:Int = 15;
	public static inline var NUM_BALLS:Int = 1;
	
	public static inline var MOUSE_GRAVITY_POWER:Float = .001;
	public static inline var MOUSE_GRAVITY_MAX:Float = .05;
	public static inline var BALL_VELOCITY_LOSS:Float = .01;
	
	public static inline var COLOR_BACKGROUND:FlxColor = 0xF8F2B3;
	public static inline var COLOR_BLOCK:FlxColor = 0x62bd84;
	public static inline var COLOR_BALL:FlxColor = 0xd26635;
	public static inline var COLOR_PADDLE:FlxColor = 0xCF3746;
	public static inline var COLOR_TRAIL:FlxColor = 0xf7d37a;
	public static inline var COLOR_SPARK:FlxColor = 0xeba17f;
	public static inline var COLOR_BOUNCY_LINES:FlxColor = 0x88D1A3;
}