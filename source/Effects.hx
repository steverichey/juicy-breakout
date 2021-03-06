package;

import flixel.FlxG;
import flixel.system.FlxSound;

class Effects
{
	public static var screenColors:Bool = false;
	public static var screenColorGlitch:Bool = false;
	public static var screenShake:Bool = false;
	public static var screenShakePower:Float = 0.005;
	public static var screenShakeDuration:Float = 0.1;
	
	public static var tweenInEnabled:Bool = false;
	public static var tweenInPropertyY:Bool = true;
	public static var tweenInPropertyRotation:Bool = false;
	public static var tweenInPropertyScale:Bool = false;
	public static var tweenInDelay:Float = 0;
	public static var tweenInDuration:Float = 0.7;
	public static var tweenInEquation:Int = 0;
	
	public static var ballExtraScale:Bool = false;
	public static var ballRotate:Bool = false;
	public static var ballRotateAnimated:Bool = false;
	public static var ballStretch:Bool = false;
	public static var ballStretchAnimated:Bool = false;
	public static var ballGlow:Bool = false;
	public static var ballGravity:Float = 0;
	public static var ballTrail:Bool = false;
	public static var ballTrailScale:Bool = true;
	public static var ballTrailLength:Int = 30;
	
	public static var blockJelly:Bool = false;
	public static var bouncyLinesEnabled:Bool = false;
	
	public static var soundWall:Bool = false;
	public static var soundBlock:Bool = false;
	public static var soundPaddle:Bool = false;
	public static var soundMusic(default, set):Bool = false;
	
	public static var particleBallCollision:Bool = false;
	public static var particleBlockShatter:Bool = false;
	public static var particlePaddleCollision:Bool = false;
	
	public static var blockDestructionDuration:Float = 2;
	public static var blockScale:Bool = false;
	public static var blockGravity:Bool = false;
	public static var blockPush:Bool = false;
	public static var blockRotate:Bool = false;
	public static var blockDarken:Bool = false;
	public static var blockShatter:Bool = false;
	
	public static var freezeDuration:Int = 0;
	public static var freezeSpeedMultiplier:Float = 0;
	public static var freezeFadeInMS:Int = 0;
	public static var freezeFadeOutMS:Int = 0;
	
	public static var paddleStretch:Bool = false;
	public static var paddleFace:Bool = false;
	public static var paddleLookAtBall:Bool = false;
	public static var paddleSmile:Int = 0;
	public static var paddleEyeSize:Int = 1;
	public static var paddleEyeSeparation:Int = 25;
	
	public static var slicerBall:Bool = false;
	
	public static var blockShatterRotation:Float = 5;
	public static var blockShatterForce:Float = 2;
	
	public static var bouncyLinesStrength:Float = 10;
	
	// Toggling music plays it or pauses it
	private static inline function set_soundMusic(Play:Bool):Bool
	{
		if (Play)
		{
			if (_music != null)
			{
				_music.play();
			}
			else
			{
				_music = FlxG.sound.load("assets/music/juicy_breakout-theme" + Settings.EXT, 1, true).play();
			}
		}
		else
		{
			if (_music != null)
			{
				_music.pause();
			}
		}
		
		return Play;
	}
	
	private static var _music:FlxSound;
}