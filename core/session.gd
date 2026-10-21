class_name Session

var current_time: int = -3000
var current_rail: Rail
var chart: Chart
var chartset: Chartset:
    set(value):
        if chartset != null:
            chartset = value
            chart = chartset.primary_chart
var audio: AudioStream
var skin: CharacterSkin
var body: ChartBody