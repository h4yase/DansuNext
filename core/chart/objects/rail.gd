class_name Rail

var notes: Array[Note]
var points: Array[RailPoint]

func sort_notes() -> void:
	notes.sort_custom(func(a, b) -> bool: return a.timing < b.timing)

func get_position_at_timing(timing: int) -> float:
	if points.is_empty():
		return 0.0
	if points.size() == 1:
		return float(points[0].position)
	if timing <= int(points[0].timing):
		return float(points[0].position)

	var last_index := points.size() - 1
	if timing >= int(points[last_index].timing):
		return float(points[last_index].position)

	for i in range(points.size() - 1):
		var a = points[i]
		var b = points[i + 1]
		var t0 := int(a.timing)
		var t1 := int(b.timing)
		if timing < t0 or timing > t1:
			continue

		var x0 := float(a.position)
		var x1 := float(b.position)
		if t1 == t0:
			return x1

		var alpha := float(timing - t0) / float(t1 - t0)
		alpha = clamp(alpha, 0.0, 1.0)
		alpha = _apply_curve(alpha, float(a.curve))
		return lerp(x0, x1, alpha)

	return 0.0