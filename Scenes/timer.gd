extends Label

var time = 0.0
var stopped = false
const scoreSavePath := "user://saveScore.tres"
var data = topscoredata
var topscore = 0.0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if ResourceLoader.exists(scoreSavePath):
		data = ResourceLoader.load(scoreSavePath) as topscoredata
	else:
		data = topscoredata.new()
	topscore = data.topscoreF
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if stopped:
		if time > data.topscoreF:
			data.topscoreF = time
			ResourceSaver.save(data,scoreSavePath)
		return
	time += delta
	time = snapped(time,0.01)
	text = str(time)
	$topScore.text = "top score: " + str(topscore)
