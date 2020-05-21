extends Node

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


func _ready():
	$CanvasLayer/CenterContainer/VBoxContainer/Start.grab_focus()
	pass # Replace with function body.


func _process(delta):
	if $CanvasLayer/CenterContainer/VBoxContainer/Start.is_hovered():
		$CanvasLayer/CenterContainer/VBoxContainer/Start.grab_focus()
	if $CanvasLayer/CenterContainer/VBoxContainer/TextureButton2.is_hovered():
		$CanvasLayer/CenterContainer/VBoxContainer/TextureButton2.grab_focus()
	pass


func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")
	pass # Replace with function body.
