extends Node

var ui : UI

var nutrients : int :
	set(new_amount):
		nutrients = new_amount
		ui.update_nutrients(nutrients)
var stomach = null
