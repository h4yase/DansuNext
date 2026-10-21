class_name Session

static var current_time: int = -3000
static var current_rail: Rail
static var chart: Chart
static var chartset: Chartset:
    set(value):
        if chartset != null:
            chartset = value
            chart = chartset.primary_chart
static var audio: AudioStream
static var skin: CharacterSkin
static var body: ChartBody

static func reset_status() -> void:
    # Reset the session status
    current_time = -3000
    current_rail = null

static func unbind_chartset() -> void:
    audio = null
    chartset = null
    chart = null
    body = null