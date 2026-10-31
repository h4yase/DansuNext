class_name Timing

var _bpm: float
var bpm:
    get:
        return bpm
    set(value):
        if value < 0:
            _bpm = 0
