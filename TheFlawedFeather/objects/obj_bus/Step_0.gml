
#region Movement
move_speed += acceleration;
move_speed = clamp(move_speed, 0, clamp_speed);

x += move_speed * -1; // Moves left when spawning.
#endregion

#region Timer Till It Deletes

if (timer < 0) instance_destroy();
else timer--;

#endregion