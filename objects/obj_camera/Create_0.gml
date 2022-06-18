// 16:9 res
size_w = 480;
size_h = 270;

upscale_f = 3;

cam = view_camera[0];

camera_set_view_size(cam, size_w, size_h);
window_set_size(size_w * upscale_f, size_h * upscale_f);
display_reset(1, true);
to_follow = obj_dino;

surface_resize(application_surface, size_w, size_h);