extends VideoPlayer

func _ready() -> void:
	var flags : = Texture.FLAG_VIDEO_SURFACE
	flags += Texture.FLAG_MIPMAPS
	flags += Texture.FLAG_FILTER
	get_video_texture().set_flags(flags)
	connect("resized", self, "on_resize")
	resized()
	play()

func resized() -> void:
	material.set_shader_param("rect_size", rect_size)
