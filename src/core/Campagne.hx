package core;

import format.agal.Data.C;
import core.Level;


typedef CampagneInfo = {
    id: String,
    name: String,
    description: String,
    levels: Array<String>,
} 


interface Campagne {
    function getCampagneInfo(): CampagneInfo;
    function getLevels(): Array<Level>;
    function getLevel(levelId: String): Level;
    function nextLevel(levelId: String): Level;
    function previousLevel(levelId: String): Level;
    function getLevelByIndex(index: Int): Level;
    function getLevelIndex(levelId: String): Int;
    function getLevelCount(): Int;   
}
