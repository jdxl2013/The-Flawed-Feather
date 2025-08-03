x += move_speed;
x = clamp(x, 0, 512);

if (gonna_delete) {
	image_alpha -= 0.01;
	if (image_alpha <= 0) {
		//instance_destroy();
	}
}