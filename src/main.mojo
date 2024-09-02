fn main() -> None:
	# var values_literal = [1, 2, 3]
	# var value = values_literal[0] # error: 'ListLiteral[Int, Int, Int]' is not subscriptable, it does not implement the `__getitem__`/`__setitem__` or `__refitem__` methods
	# for value in values_literal: # error: 'ListLiteral[Int, Int, Int]' does not implement the '__iter__' method
	var values = List(1, 2, 3)
	for value_ref in values:
		var value = value_ref[]
		print(value)
