fn main() -> None:
	# var values_literal = [1, 2, 3]
	# for value in values_literal: # error: 'ListLiteral[Int, Int, Int]' does not implement the '__iter__' method
	var values = List(1, 2, 3)
	for value_ref in values:
		var value = value_ref[]
		print(value)
