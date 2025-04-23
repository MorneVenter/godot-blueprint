class_name PrettyNumbers
extends Node


static func format(number_to_format: float) -> String:
	var number: float = abs(number_to_format)
	var modifier: float = 1.0 if number_to_format >= 0 else -1.0
	if number < 999.0:
		return str(number * modifier)
	if number >= 1000.0 and number < 1000000.0:
		var formatted_number: String = str(snapped(number / 1000.0, 0.1) * modifier) + "K"
		return formatted_number
	if number >= 1000000.0:
		var formatted_number: String = str(snapped(number / 1000000.0, 0.1) * modifier) + "M"
		return formatted_number
	return str(number * modifier)
