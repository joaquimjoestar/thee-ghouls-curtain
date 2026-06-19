extends HScrollBar

@export var bus_name: String = "Master"

var bus_index: int

func _ready() -> void:
	bus_index = AudioServer.get_bus_index(bus_name)
	#value_changed gets signaled when the value of the slider is changed
	#with .connect() we call the fuction _on_value_changed every time its signaled
	value_changed.connect(_on_value_changed)
	#value is already a defined variable in slider nodes
	value = db_to_linear(AudioServer.get_bus_volume_db(bus_index))

func _on_value_changed(valuelocal: float) -> void:
	#inside the function we have a valuelocal parameter variable
	#to make it distinc to the value variable that already exists in the slider node
	AudioServer.set_bus_volume_db(bus_index,linear_to_db(valuelocal))
