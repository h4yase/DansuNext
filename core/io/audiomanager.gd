extends Node
class_name AudioManager

const FADE_DURATION := 1.0

var current_audio_stream_player: AudioStreamPlayer
var preview_audio_stream_player: AudioStreamPlayer

var _audio_stream_players: Array[AudioStreamPlayer] = []


func play_audio(stream: AudioStream, is_preview: bool = false) -> AudioStreamPlayer:
    var player := AudioStreamPlayer.new()
    player.stream = stream
    player.volume_linear = 0.0

    add_child(player)
    _audio_stream_players.append(player)

    current_audio_stream_player = player

    if is_preview:
        preview_audio_stream_player = player

    player.play()
    return player


func stop_all() -> void:
    current_audio_stream_player = null
    preview_audio_stream_player = null

    for player in _audio_stream_players:
        if is_instance_valid(player):
            player.stop()
            player.queue_free()

    _audio_stream_players.clear()


func stop_preview() -> void:
    if not is_instance_valid(preview_audio_stream_player):
        return

    if preview_audio_stream_player == current_audio_stream_player:
        current_audio_stream_player = null

    preview_audio_stream_player.stop()
    preview_audio_stream_player = null


func _process(delta: float) -> void:
    for i in range(_audio_stream_players.size() - 1, -1, -1):
        var player := _audio_stream_players[i]

        if not is_instance_valid(player):
            _audio_stream_players.remove_at(i)
            continue

        if not player.playing:
            _remove_player(i)
            continue

        var target_volume := 1.0 if player == current_audio_stream_player else 0.0

        player.volume_linear = move_toward(
            player.volume_linear,
            target_volume,
            delta / FADE_DURATION
        )

        if target_volume == 0.0 and player.volume_linear <= 0.0:
            player.stop()
            _remove_player(i)


func _remove_player(index: int) -> void:
    var player := _audio_stream_players[index]

    if player == current_audio_stream_player:
        current_audio_stream_player = null

    if player == preview_audio_stream_player:
        preview_audio_stream_player = null

    _audio_stream_players.remove_at(index)
    player.queue_free()
