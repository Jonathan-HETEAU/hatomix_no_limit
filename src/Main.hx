import screen.HatomixScreen;
import screen.Screen;
import screen.ScreenDirector;
import h2d.Scene;


class Main extends hxd.App implements ScreenDirector {

    private var screens:Array<Screen>;
    private var currentScreen:Screen;

	override function init() {
        this.currentScreen = new HatomixScreen(this);
        this.setScene(this.currentScreen.getScene());
        this.currentScreen.init();
        this.screens = [];
	}

	static function main() {
		new Main();
	}

	override function update(dt:Float) {
		super.update(dt);
        if (this.currentScreen != null) {
            this.currentScreen.update(dt);
        }
	}

    public function pushScreen(screen:Screen):Void {
        if (this.currentScreen != null) {
            this.screens.push(this.currentScreen);
        }
        this.currentScreen = screen;
        this.setScene(this.currentScreen.getScene());
    }

    public function popScreen():Void {
        if (this.screens.length > 0) {
            this.currentScreen = this.screens.pop();
            this.setScene(this.currentScreen.getScene());
        }
    }

    public function replaceScreen(screen:Screen):Void {
        if (this.currentScreen != null) {
            this.screens.pop();
        }
        this.pushScreen(screen);
    }

    public function getCurrentScreen():Screen {
        return this.currentScreen;
    }
}










