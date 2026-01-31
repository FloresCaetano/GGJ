extends Control
@export var l_dialog: Label
@export var l_name: Label

var tween : Tween
var chars_per_second : int = 20
var index : int = 0

#FLAGS
var force_skip_dialog : bool = false

signal skip_dialog


func _ready() -> void:
	start()

@export var dialogs : Array[DialogData]

func start():
	if index + 1 > dialogs.size():
		end_dialog()
		return
	
	var dialog : DialogData = dialogs[index]
	write_dialog(dialog)
	index += 1
	
	if not force_skip_dialog:
		await tween.finished
		await skip_dialog
	force_skip_dialog = false
	
	if dialog.trigger_mask_selection:
		PATHS.mask_inventory.open()
		await GAMEMANAGER.mask_selected
	
	start()

func write_dialog(dialog):
	if dialog.mask_selected != -1 and GAMEMANAGER.selected_mask:
		if dialog.mask_selected != GAMEMANAGER.selected_mask.index:
			force_skip_dialog = true
			return
	
	var line : String = dialog.dialog
	var char_ammount : float = line.length()
	var time : float = char_ammount / chars_per_second
	
	l_dialog.visible_ratio = 0
	l_dialog.text = line
	l_name.text = dialog.character
	
	tween = get_tree().create_tween().set_trans(Tween.TRANS_LINEAR)
	tween.tween_property(l_dialog, "visible_ratio", 1.0, time)

func end_dialog():
	self.visible = false

func _input(event: InputEvent) -> void:
	if event.is_action_released("skip_dialog"):
		skip_dialog.emit()
