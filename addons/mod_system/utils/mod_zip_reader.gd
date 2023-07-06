class_name ModZipReader extends ZIPReader


## Opens a ZIP file and handles the file contents.
## [br][code]callback[/code] parameter should be a function that accepts two parameters:
## [br]1. [code]reader[/code] ([ZIPReader]) - the currently opened reader
## [br]2. [code]paths[/code] ([PackedStringArray]) - file paths inside ZIP
static func read(path: String, callback: Callable):
	var reader := ModZipReader.new()
	if reader.open(path) != OK:
		return
	var result = callback.call(reader, reader.get_files())
	reader.close()
	return result


func exists(path: String) -> bool:
	return read_file(path).size() > 0


func read_string(path: String) -> String:
	var bytes := read_file(path)
	return bytes.get_string_from_utf8()


func read_resource(path: String) -> Resource:
	var bytes := read_file(path)
	return bytes.decode_var(0, true)


func read_script(path: String) -> GDScript:
	var source = read_string(path)
	var script := GDScript.new()
	script.source_code = source
	script.take_over_path(path)
	script.reload()
	return script


func read_json(path: String) -> Dictionary:
	return JSON.parse_string(read_string(path))


func read_image(path: String) -> ImageTexture:
	var bytes := read_file(path)
	var img := Image.new()
	match path.get_extension().to_lower():
		"png": img.load_png_from_buffer(bytes)
		"jpg", "jpeg": img.load_jpg_from_buffer(bytes)
	return ImageTexture.create_from_image(img)
