extends RefCounted
class_name Editor

var session: Session
var inspecting_object: GameObject

signal note_selected(note: Note)
signal rail_selected(rail: Rail)

func select_note(note: Note) -> void:
    inspecting_object = note
    emit_signal("note_selected", note)

func add_new_note(note: Note, rail: Rail = session.current_rail, select: bool = false) -> Note:
    if rail:
        if note.timing > rail.points[-1].timing or note.timing < rail.points[0].timing:
            # alert("cant place note outside of rail")
            return null
        rail.notes.append(note)
        session.chart_body.notes.append(note)
        if select:
            select_note(note)
    return note

func add_new_rail(rail: Rail, select: bool = false) -> Rail:
    session.chart_body.rails.append(rail)
    if select:
        current_rail = rail
        emit_signal("rail_selected", rail)
    return rail

func add_new_point(point: RailPoint, rail: Rail = session.current_rail, select: bool = false) -> RailPoint:
    if rail:
        session.chart_body.points.append(point)
        if select:
            current_rail = rail
            emit_signal("rail_selected", rail)
    return point