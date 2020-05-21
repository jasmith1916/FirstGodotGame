extends KinematicBody2D

const UP = Vector2(0,-1)
const GRAVITY = 20
const ACCELERATION = 20
const MAX_SPEED = 250
const JUMP_HEIGHT = -575
var motion = Vector2()
var punch = 1
var health = 100
var checkhurt = 0
const TIMER = 30
const OFFSET1 = Vector2(-20,0)
const OFFSET2 = Vector2(-130,0)
const OFFSET3 = Vector2(-200,0)



func _physics_process(delta):
	motion.y += GRAVITY
	var friction = false
	$CanvasLayer/TextureProgress.set_value(health)
	var overlappings = $playercollision.get_overlapping_areas()
	for overlapping in overlappings:
		if overlapping.name == "Area2D":
			if checkhurt == 0:
				checkhurt = TIMER
	if checkhurt == TIMER:
		health = health - 20
	if checkhurt > 0:
		checkhurt -= 1
	
	if health <= 0:
		get_tree().change_scene("res://GAMEOVER.tscn")
	
	if Input.is_action_pressed("ui_right"):
		motion.x = min(motion.x + ACCELERATION, MAX_SPEED)
		$Sprite.flip_h = false
		$Sprite.play("Run")
		$Sprite.set_offset(OFFSET1)
		$AnimationPlayer.stop(true)
		$Lightning/LightningHit.disabled = true
	elif Input.is_action_pressed("ui_left"):
		motion.x = max(motion.x-ACCELERATION, -MAX_SPEED)
		$Sprite.flip_h = true
		$Sprite.play("Run")
		$Sprite.set_offset(OFFSET2)
		$AnimationPlayer.stop(true)
		$Lightning/LightningHit.disabled = true
	elif Input.is_action_pressed("ui_down") and punch == 1:
		friction = true
		$Sprite.play("Light")
		if  $Sprite.flip_h == false:
			get_node("AnimationPlayer").play("Lightning")
		else:
			get_node("AnimationPlayer").play("LightningLeft")
		
	elif Input.is_action_just_released("ui_down"):
		$AnimationPlayer.stop(true)
		$Lightning/LightningHit.disabled = true
		
	
		
	else:
		$Sprite.play("idle")
		friction = true
		
	if is_on_floor():
		punch = 1
		if Input.is_action_just_pressed("ui_up"):
			motion.y = JUMP_HEIGHT
			$AnimationPlayer.stop(true)
			$Lightning/LightningHit.disabled = true
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.2)
		
	else:
		if motion.y < 0:
			$Sprite.play("Jump")
		else:
			$Sprite.play("Fall")
		if friction == true:
			motion.x = lerp(motion.x, 0, 0.05)
		punch == 0
		$Lightning/LightningHit.disabled = true
	
	
	motion = move_and_slide(motion, UP)
	pass