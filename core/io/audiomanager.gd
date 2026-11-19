extends Node
class_name AudioManager

var current_audio_stream_player: AudioStreamPlayer
var _audio_stream_players: Array[AudioStreamPlayer]

func stop_all():
    for player in _audio_stream_players:
        player.stop()

func stop_preview():
    if preview_audio_stream_player.playing:
        preview_audio_stream_player.stop()

func _process(delta: float) -> void:
    for player in _audio_stream_players:
        if not player.playing:
            player.queue_free()
        
        if 
        
        if player is not current_audio_stream_player:
            player.volume_db = lerp(player.volume_db, -100., 1.0 * delta)
        
        if player.volume_db < -99 :
            player.stop()
        