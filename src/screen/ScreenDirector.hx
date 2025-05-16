package screen;


interface ScreenDirector {
	function pushScreen(screen:Screen):Void;
	function popScreen():Void;
	function replaceScreen(screen:Screen):Void;
	function getCurrentScreen():Screen;
}