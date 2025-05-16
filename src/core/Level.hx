package core;

typedef Position = {
    x:Int,
    y:Int
};

typedef Atom = {
    type:String,
    positions:Array<Position>,
    color:String
};



typedef LevelData ={
    id:String,
    name:String,
    description:String, 
    bestTime:Int,
    map:Array<Array<Bool>>,
    solution:Array<Atom>,
    initial:Array<Atom>
};



class Level {
    public var data:LevelData;


    public function new(LevelData:LevelData) {
        this.data = LevelData;
    }
}