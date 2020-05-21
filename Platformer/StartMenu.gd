# StartMenu.gd
extends Control

func _ready():
	$CenterContainer/VBoxContainer/VBoxContainer/Start.grab_focus()


func _physics_process(delta):
	if $CenterContainer/VBoxContainer/VBoxContainer/Start.is_hovered() == true:
		$CenterContainer/VBoxContainer/VBoxContainer/Start.grab_focus()
	if $CenterContainer/VBoxContainer/VBoxContainer/TextureButton.is_hovered() == true:
		$CenterContainer/VBoxContainer/VBoxContainer/TextureButton.grab_focus()


func _on_Start_pressed():
	get_tree().change_scene("res://World.tscn")
	pass # Replace with function body.
