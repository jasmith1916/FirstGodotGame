extends KinematicBody2D

var motion = Vector2()
const UP = Vector2(0,-1)
const GRAVITY = 20
var direction = 1
var check = 0
var speed = 50



func _process(delta):
	motion.x = speed * direction
	motion.y += GRAVITY
	
	
	$Sprite.play("Walk")
	
	var areas = $Area2D.get_overlapping_areas()
	for area in areas:
		if area.name == "Lightning":
			queue_free()
			
	if check == 1:
		direction = direction * -1
		if direction == 1:
			$Sprite.flip_h = false
			$LineOfSight/CollisionPolygon2D.rotation_degrees = 0
		else:
			$Sprite.flip_h = true
			$LineOfSight/CollisionPolygon2D.rotation_degrees = 180
		check = 0
	pass
	
	var sights = $LineOfSight.get_overlapping_areas()
	if sights.empty():
		speed = 50
		$Sprite.speed_scale = 1
	for sight in sights:
		if sight.name == "playercollision":
			speed = 100
			$Sprite.speed_scale = 2.5
		
		
	pass
	
	if is_on_wall():
		check = 1
		
		
	
	
	
	
	
	
	
	
	motion = move_and_slide(motion, UP)
	pass
