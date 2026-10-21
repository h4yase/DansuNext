extends GameObject
class_name Note

func _init(note_type: NoteType = NoteType.HIT, note_timing: int = 0, note_length: int = 0, note_animation: CharacterAnimation = CharacterAnimation.NONE) -> void:
    type = note_type
    timing = note_timing
    length = note_length
    animation = note_animation

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