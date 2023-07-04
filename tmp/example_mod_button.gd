class_name ExampleModButton extends Button


func _init() -> void:
	# Initialize the button with the ModSystem to allow it to be moddable
	ModSystem.initialize(self)
