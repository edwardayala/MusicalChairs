extends RigidBody2D

var should_die = false

func _ready():
    set_fixed_process(true)

func reset():
    should_reset = false
    set_global_pos(Vector2(0,0))

func _fixed_process(delta):
    if should_reset:
        # CORRECT
        # Will always work
        reset()

        # WRONG
        # Might not work
        # same goes if called from _process or input signal/_input callback
        call_deferred("reset") 