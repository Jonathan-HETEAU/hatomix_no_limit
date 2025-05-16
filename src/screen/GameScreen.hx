package screen;


import h2d.Scene;

class GameScreen extends Scene implements Screen {

    var ScreenDirector:ScreenDirector;

    public function new(director:ScreenDirector) {
        super();
        this.ScreenDirector = director;
        
    }

    function onEvent(e:hxd.Event):Void {
        switch (e.kind) {
            case EKeyUp:
                switch (e.keyCode) {
                    case 27: // Escape
                        this.ScreenDirector.popScreen();
                    case 13: // Enter
                        this.ScreenDirector.pushScreen(new HatomixScreen(this.ScreenDirector));
                    default:
                }
            case _:
        }
    }

    public function init() {
        var tf = new h2d.Text(hxd.res.DefaultFont.get(), this);
        tf.text = "Hello Game !";
        this.addEventListener(onEvent);
    }

    public function update(dt:Float):Void {
        // Update logic for the game scene
    }
   
}