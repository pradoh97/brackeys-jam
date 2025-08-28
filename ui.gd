extends CanvasLayer
class_name UI

func get_stomach():
	return %Stomach

func update_nutrients(nutrients : int):
	%Nutrients.text = str(nutrients)
