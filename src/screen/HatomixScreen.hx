package screen;

import h2d.RenderContext;
import hxd.Math;
import dn.Col;
import hxsl.Types.Vec;
import h2d.Object;
import h2d.Scene;

class HatomixScreen extends Scene implements Screen {
	var screenDirector:ScreenDirector;
    var background:Background;

	public function new(director:ScreenDirector) {
		super();
		this.scaleMode = h2d.ScaleMode.LetterBox(1280, 720);
		this.screenDirector = director;
        
	}

	function onEvent(e:hxd.Event):Void {
		switch (e.kind) {
			case EKeyUp:
				switch (e.keyCode) {
					case 27: // Escape
						this.screenDirector.popScreen();
					case 13: // Enter
						this.screenDirector.pushScreen(new GameScreen(this.screenDirector));
					default:
				}
			case _:
		}
	}

    public function init():Void {
		this.background = new Background(this);
        this.background.setPosition(0, 0);
        this.background.init();
		this.addEventListener(onEvent);
		this.background.init();
	}
	
	public function update(dt:Float):Void {
		this.background.update(dt);
	}
}

class Ball extends Object {
	public var speed:Vec;
	public var color:Col;

	public function new(speed:Vec, color:Col,size:Int) {
		super();
		this.speed = speed;
		this.color = color;
		var g = new h2d.Graphics();
    
		g.beginFill(this.color);
		g.drawCircle(size / 2, size/2, size/ 2);
		g.setColor(this.color.adjustBrightness(0.2));
		g.drawCircle(size / 2, size/2, size/ 2*0.80);
		g.endFill();
		this.addChild(g);
	}

	public function update(dt:Float):Void {
		this.move(this.speed.x * dt, this.speed.y * dt);
	}
}

class Background extends Object {

    var balls:Array<Ball>;

	public function new(?parent:h2d.Object) {
		super(parent);
		this.balls = [];
		
	}

    public function init() {
		
		
        for (i in 0...100) {
            var size = Std.int(Math.random() * 20 + 50);
            var color = Col.randomRGB();
            var ball = new Ball(new Vec(Math.random() * 100 - 50, Math.random() * 100 - 50), color,size);
            ball.setPosition(640, 360);
			this.addChild(ball);
			this.balls.push(ball);
        }
    }

	override function draw(ctx:RenderContext) {
		

		super.draw(ctx);
	}

    public function update(dt:Float):Void {
        for (ball in this.balls) {
            ball.update(dt);
        }
    }
}
