extends RefCounted
class_name Editor

var session: Session
var inspecting_object: EditorObject
var clipboard: EditorClipboard
var selected_objects: Array[EditorObject]

# for inspector.
signal selected(objs: Array[EditorObject])
signal updated(obj: EditorObject)

func select(objs: Array[EditorObject]) -> void:
    inspecting_object = objs[0]
    emit_signal("selected", objs)

func update(objs: Array[EditorObject]):
    for obj in objs:
        obj.update()
        emit_signal("updated",obj)

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
        session.current_rail = rail
        emit_signal("selected", rail)
    return rail

func add_new_point(point: RailPoint, rail: Rail = session.current_rail, select: bool = false) -> RailPoint:
    if rail:
        session.chart_body.points.append(point)
        if select:
            session.current_rail = rail
            emit_signal("selected", point)
    return point