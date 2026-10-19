extends TimingObject
class_name Note

enum NoteType {
    HIT,
    LEFT,
    RIGHT,
    SPIKE,
    TRACE,
    FX,
    STATIC # maybe huh
}

var type: NoteType
var timing: int
var length: int = 0
var animation: CharacterAnimation