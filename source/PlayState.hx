package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;

import emitters.ConfettiEmitter;
import emitters.ImpactEmitter;
import emitters.ShatterEmitter;
import objects.Ball;
import objects.Block;
import objects.Paddle;
import objects.Walls;

class PlayState extends FlxState
{
	private var _balls:FlxTypedGroup<Ball>;
	private var _blocks:FlxTypedGroup<Block>;
	private var _paddle:Paddle;
	private var _walls:Walls;
	private var _confetti:ConfettiEmitter;
	private var _impact:ImpactEmitter;
	private var _shatter:ShatterEmitter;
	private var _menu:Menu;
	
	override public function create():Void
	{
		super.create();
		
		_paddle = new Paddle();
		
		add(_paddle);
	}

	override public function update():Void
	{
		super.update();
	}	
}