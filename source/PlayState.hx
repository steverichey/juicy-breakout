package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.group.FlxGroup;
import flixel.group.FlxGroup.FlxTypedGroup;
import flixel.math.FlxRandom;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.math.FlxMath;
import flixel.util.FlxColor;
import objects.GameObject;

import emitters.ConfettiEmitter;
import emitters.ImpactEmitter;
import emitters.ShatterEmitter;
import objects.Ball;
import objects.Block;
import objects.Paddle;
import objects.Walls;
import objects.Menu;
import objects.Background;
import objects.Line;
import effects.Trail;

class PlayState extends FlxState
{
	private var _bg:Background;
	private var _balls:FlxTypedGroup<Ball>;
	private var _blocks:FlxTypedGroup<Block>;
	private var _trails:FlxTypedGroup<Trail>;
	private var _paddle:Paddle;
	private var _walls:Walls;
	private var _confetti:ConfettiEmitter;
	private var _impact:ImpactEmitter;
	private var _shatter:ShatterEmitter;
	private var _menu:Menu;
	private var _collidables:FlxGroup;
	private var _info:FlxText;
	private var _toggle:Bool = false;
	private var _paused:Bool = false;
	
	override public function create():Void
	{
		super.create();
		
		FlxG.autoPause = false;
		
		_bg = new Background();
		
		_paddle = new Paddle();
		
		_balls = new FlxTypedGroup<Ball>();
		_trails = new FlxTypedGroup<Trail>();
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
		_collidables.add(_blocks);
		
		_info = new FlxText(20, FlxG.height - 32, FlxG.width - 40, "[TAB] Menu   [Enter] Toggle All   [Space] Reset   [B] Ball   [P] Pause", 16);
		_info.alignment = "right";
		_info.alpha = 0.5;
		
		_menu = new Menu();
		
		add(_bg);
		add(_trails);
		add(_walls);
		add(_paddle);
		add(_balls);
		add(_blocks);
		add(_info);
		add(_menu);
	}

	override public function update():Void
	{
		#if !FLX_NO_KEYBOARD
		if (FlxG.keys.justPressed.SPACE)
		{
			FlxG.resetGame();
		}
		
		if (FlxG.keys.justPressed.TAB)
		{
			_menu.toggle();
		}
		
		if (FlxG.keys.justPressed.ENTER)
		{
			toggleAll();
		}
		
		if (FlxG.keys.justPressed.B)
		{
			addBall();
		}
		
		if (FlxG.keys.justPressed.P)
		{
			_paused = !_paused;
		}
		#end
		
		if (_paused)
		{
			return;
		}
		
		FlxG.collide(_balls, _collidables, ballBounce);
		
		_info.color = Effects.screenColors ? FlxColor.BLACK : FlxColor.WHITE;
		
		super.update();
	}
	
	private function ballBounce(ball:Ball, hit:GameObject):Void
	{
		ball.bounce();
		
		if (hit.objectType == GameObjectType.BLOCK)
		{
			hit.kill();
			_bg.glitchForce = 0.05;
			
			if (Effects.soundBlock)
			{
				FlxG.sound.play("assets/sounds/pling1" + Settings.EXT);
			}
		}
		
		if (hit.objectType == GameObjectType.PADDLE && Effects.soundPaddle)
		{
			FlxG.sound.play("assets/sounds/ball-paddle" + Settings.EXT);
		}
		
		if (hit.objectType == GameObjectType.LINE && Effects.soundWall)
		{
			FlxG.sound.play("assets/sounds/ball-wall" + Settings.EXT);
		}
		
		if (Effects.screenShake)
		{
			FlxG.camera.shake(Effects.screenShakePower, Effects.screenShakeDuration);
		}
	}
	
	private function addBall():Void
	{
		var ball:Ball = _balls.add(new Ball(FlxG.width / 2, FlxG.height / 2 + 100));
		_trails.add(ball.trail);
	}
	
	private function toggleAll():Void
	{
		_toggle = !_toggle;
		
		// Screen FX
		
		Effects.screenColors = _toggle;
		Effects.screenColorGlitch = _toggle;
		Effects.screenShake = _toggle;
		
		// Tweens, etc
		
		Effects.paddleStretch = _toggle;
		Effects.tweenInEnabled = _toggle;
		Effects.tweenInPropertyY = _toggle;
		Effects.tweenInPropertyScale = _toggle;
		Effects.tweenInPropertyRotation = _toggle;
		
		// Balls
		
		Effects.ballExtraScale = _toggle;
		Effects.ballGlow = _toggle;
		Effects.ballRotate = _toggle;
		Effects.ballRotateAnimated = _toggle;
		Effects.ballStretch = _toggle;
		Effects.ballStretchAnimated = _toggle;
		Effects.ballTrail = _toggle;
		
		// Sound FX
		
		Effects.soundBlock = _toggle;
		Effects.soundMusic = _toggle;
		Effects.soundPaddle = _toggle;
		Effects.soundWall = _toggle;
	}
}