extends TimingObject
class_name NoteData

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
var time: int
var length: int = 0