class_name ChartMeta

var id: int = 0
var title: String = ""
var artist: String = ""
var creator: String = ""
var source: String = ""
var tags: String = ""

var min_bpm: float
var max_bpm: float

func set_bpm(value: Array[Timings]) -> void:
    var lowest_bpm = INF
    var highest_bpm = -INF

    for timing in value:
        if timing.bpm < lowest_bpm:
            lowest_bpm = timing.bpm
        if timing.bpm > highest_bpm:
            highest_bpm = timing.bpm
    min_bpm = lowest_bpm
    max_bpm = highest_bpm
