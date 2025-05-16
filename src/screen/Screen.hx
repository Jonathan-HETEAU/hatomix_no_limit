package screen;

interface Screen {
    function init():Void;
    function update(dt:Float):Void;
    function getScene():h2d.Scene;
}