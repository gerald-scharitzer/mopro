# Mojo Programming

the safe, efficent, and ergonomic way

Install Magic based on https://docs.modular.com/magic/.

# Project

Create Mojo projects with `magic init <project> --format mojoproject` where `<project>` is the project name.
The first time you do this in your environment takes longer, because Mojo depends on MAX, which will be downloaded first.

Store source files in the `src/` subtree.

Name the main module (the primary module with a `main()` function) `main.mojo`.

Add direct dependencies with `magic add <package>`.
For packages from other channels, add these channels to `mojoproject.toml/project.channels` first.
Mojo packages are installed as `.mojopkg` files in `.magic/envs/<env>/lib/mojo/` where `<env>` is the environment name.

The Mojo VS Code extension does not search this for packages and thus does not find these dependencies by default.
Running `magic run mojo ...` does and works fine.
Add `.magic/envs/<env>/lib/mojo` to the Mojo extension setting "Mojo > Lsp: Include Dirs" and restart,
such that VS Code finds the dependencies as well.

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
