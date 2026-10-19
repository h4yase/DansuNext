class_name CharacterAnimation

var fps: float = 12.0

# for idle animation it will loop back to the first frame
# for other animations it will return to idle animation
var return_to_idle: bool = true
var frames: Array[Texture2D] = []