extends RigidBody

var picked_up
var holder


func pick_up(player):
	holder = player

	if picked_up:
		leave()
	else:
		carry()

func _process(delta):
	if picked_up:
		#var target = holder.find_node("pickup_pos").global_transform.origin
		#var dir = (holder.find_node("pickup_pos").get_transform().origin - get_transform().origin).normalized()
		var target = holder.find_node("pickup_pos").get_global_transform()
		set_global_transform(target)
		if holder.find_node("grasp_ray").is_colliding():
			translation = holder.find_node("grasp_ray").get_collision_point()
			#set_global_transform( holder.find_node("InteractionRay").get_collision_point() )
		#set_global_transform( holder.find_node("pickup_pos").global_transform.origin )
		#holder.find_node("InteractionRay").cast_to )

		#look_at(target, Vector3(0,1,0))

		#translate(Vector3(0,0,-0.1)) #todo: times distance
		#apply_impulse(Vector3(0,0,1), Vector3(0,1,0))
		#set_axis_velocity( Vector3(0,0,1).rotated(rotation,) )

#func _integrate_forces():

func carry():
	#$CollisionShape.set_disabled(true)
	holder.carried_object = self
	holder.find_node("grasp_ray").add_exception(self)
	#self.set_mode(1)
	picked_up = true
	#gravity_scale = 0
	#linear_velocity = Vector3(0,10,0)

func leave():
	#$CollisionShape.set_disabled(false)
	holder.carried_object = null
	holder.find_node("grasp_ray").clear_exceptions()
	#self.set_mode(0)
	picked_up = false
	#gravity_scale = 1



func throw(power):
	leave()
	#apply_impulse(Vector3(), holder.look_vector * Vector3(power, power, power))
