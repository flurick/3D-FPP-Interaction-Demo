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
		set_global_transform( holder.find_node("pickup_pos").get_global_transform() )
		if holder.find_node("grasp_ray").is_colliding():
			translation = holder.find_node("grasp_ray").get_collision_point()

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



func throw(power):
	leave()
	#apply_impulse(Vector3(), holder.look_vector * Vector3(power, power, power))
