package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
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
import objects.Menu;

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
	private var _collidables:FlxGroup;
	private var _info:FlxText;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.autoPause = false;
		
		_paddle = new Paddle();
		
		_balls = new FlxTypedGroup<Ball>();
		addBall();
		
		_blocks = new FlxTypedGroup<Block>();
		
		for (i in 0...80)
		{
			var block:Block = new Block( 120 + (i % 10) * (Settings.BLOCK_WIDTH + 10), 30 + 47.5 + Std.int(i / 10) * (Settings.BLOCK_HEIGHT + 10));
			_blocks.add(block);
		}
		
		_walls = new Walls();
		
		_collidables = new FlxGroup();
		_collidables.add(_paddle);
		_collidables.add(_walls);
		
		_info = new FlxText(20, FlxG.height - 32, FlxG.width - 40, "[2] Reset    [TAB] Menu", 16);
		_info.alignment = "right";
		_info.alpha = 0.5;
		
		_menu = new Menu();
		
		add(_walls);
		add(_paddle);
		add(_balls);
		add(_blocks);
		add(_info);
		add(_menu);
	}

	override public function update():Void
	{
		FlxG.collide(_balls, _collidables);
		FlxG.collide(_balls, _blocks, ballHitBlock);
		
		#if !FLX_NO_KEYBOARD
		if (FlxG.keys.justPressed.TWO)
		{
			FlxG.resetGame();
		}
		
		if (FlxG.keys.justPressed.TAB)
		{
			_menu.toggle();
		}
		#end
		
		super.update();
	}
	
	private function ballHitBlock(ball:Ball, block:Block):Void
	{
		block.kill();
	}
	
	private function addBall():Void
	{
		_balls.add(new Ball(FlxG.width / 2, FlxG.height / 2 + 100));
	}
}