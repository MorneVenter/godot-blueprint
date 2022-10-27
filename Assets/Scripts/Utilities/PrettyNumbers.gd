extends Node

func Format(number_to_format: float) -> String:
	var number: float = abs(number_to_format)
	var modifier: float = 1.0 if number_to_format >= 0 else -1.0
	if number < 999.0:
		return str(number * modifier)
	elif number >= 1000.0 and number < 1000000.0:
		var formatted_number: String = str(snapped(number/1000.0, 0.1) * modifier)+'K'
		return formatted_number
	elif number >= 1000000.0:
		var formatted_number: String = str(snapped(number/1000000.0, 0.1) * modifier)+'M'
		return formatted_number
	else:
		return str(number * modifier)

func _init() -> void:
	_TEST()

func _TEST() -> void:
	assert(Format(-100) == "-100", "Negative numbers (e.g -100) should be formatted correcltly.")
	assert(Format(100) == "100", "Positive numbers (e.g 100) should be formatted correcltly.")
	assert(Format(1200) == "1.2K", "Numbers greater than 1,000 should be formatted correcltly.")
	assert(Format(-1200) == "-1.2K", "Numbers lesser than 1,000 should be formatted correcltly.")
	assert(Format(150000) == "150K", "Numbers greater than 1,000 should be formatted correcltly.")
	assert(Format(1600000) == "1.6M", "Numbers greater than 1,000,000 should be formatted correcltly.")
	assert(Format(-1600000) == "-1.6M", "Numbers lesser than 1,000,000 should be formatted correcltly.")
