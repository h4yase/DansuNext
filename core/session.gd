class_name Session

static var chart: Chart
static var chartset: Chartset:
    set(value):
        if chartset != null:
            chartset = value
            chart = chartset.primary_chart
static var audio: AudioStream
static var skin: CharacterSkin
static var body: ChartBody