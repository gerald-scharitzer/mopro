# Mojo Programming

the safe, efficent, and ergonomic way

Install Magic based on https://docs.modular.com/magic/.

# Project

Create Mojo projects with `magic init <project> --format mojoproject` where `<project>` is the project name.

Store source files in the `src/` subtree.

Name the main module (the primary module with a `main()` function) `main.mojo`.

# Collections

List literals do not implement the `__getitem__`/`__setitem__` or `__refitem__` methods,
and thus cannot be subscripted with brackets `[]`.

	var values = [1, 2, 3]
	var value = values[0] # error in subscript

results in

    error: 'ListLiteral[Int, Int, Int]' is not subscriptable, it does not implement the `__getitem__`/`__setitem__` or `__refitem__` methods
            var value = values[0]
                        ~~~~~~^

List literals do not implement the `__iter__` method and thus cannot be iterated over directly with the `for` statement.

	var values = [1, 2, 3]
	for value in values: # error in values
		print(value[])

results in

    error: 'ListLiteral[Int, Int, Int]' does not implement the '__iter__' method
            for value in values:
                         ^

One way to iterate over this is to create list objects instead of list literals and then interate over the objects.
[Iterating over Mojo collections](https://docs.modular.com/mojo/manual/control-flow#iterating-over-mojo-collections) does so.
You can skip the type parameter, if the compiler can infer it.

	var values = List(1, 2, 3)
	for value in values:
		print(value[])

Loop variables in `for` statements are references.
You can dereference them with brackets `[]`.
This may change.

	var values = List(1, 2, 3)
	for value_ref in values:
		var value = value_ref[]
		print(value)
