extends Control

onready var videoplayer = $VideoPlayer
var video_length = 0

func _input(event):
	if event.is_action_pressed("hide"):
		$VBoxContainer.visible = !$VBoxContainer.visible

func _ready():
	$VBoxContainer/BrightnessSlider/Brightness.value = videoplayer.material.get_shader_param("brightness")
	$VBoxContainer/CellSizeSlider/CellSize.value = videoplayer.material.get_shader_param("cell_size")
	$VBoxContainer/CornerSizeSlider/CornerSize.value = videoplayer.material.get_shader_param("corner_size")
	$VBoxContainer/Colored.pressed = videoplayer.material.get_shader_param("colored")

func _on_Brightness_value_changed(value):
	videoplayer.material.set_shader_param("brightness",value)

func _on_CellSize_value_changed(value):
	videoplayer.material.set_shader_param("cell_size",value)

func _on_CornerSize_value_changed(value):
	videoplayer.material.set_shader_param("corner_size",value)

func _on_Colored_toggled(button_pressed):
	videoplayer.material.set_shader_param("colored",button_pressed)

func _on_CornerColor_color_changed(color):
	videoplayer.material.set_shader_param("corner_color",color)

func _on_Texture_pressed():
	$FileDialog.popup()

func _on_FileDialog_file_selected(path):
	var image = Image.new()
	image.load(path)
	var texture = ImageTexture.new()
	texture.create_from_image(image,0)
	$VBoxContainer/TexturePicker/TexturePreview.texture = texture
	videoplayer.material.set_shader_param("cell_texture", texture)

func _on_VideoPlayer_finished():
	videoplayer.play()

func _on_Paused_toggled(button_pressed):
	videoplayer.paused = button_pressed

func _on_Back_pressed():
	videoplayer.stream_position -= 10

func _on_Video_pressed():
	$FileDialog2.popup()

func _on_FileDialog2_file_selected(path):
	var stream = VideoStreamTheora.new()
	stream.set_file(path)
	videoplayer.stream = stream
	videoplayer.play()

func _on_VideoColor_color_changed(color):
	videoplayer.modulate = color
