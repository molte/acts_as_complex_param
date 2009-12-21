ActsAsComplexParam
==================

Generates the `to_param` method a long with a `find_by_param!` method to convert back and forth from URL param to database attributes.

Usage
-----

To setup the methods write the following in you model:

  `acts_as_param(:id, :title)`

Assuming you want to construct the param from the `id` and `title` attributes. By default a hyphen (-) is inserted between the attributes as a separator.

Options
-------

You can specify another separator in an options hash when defining the param:

  `acts_as_param(:number, :name, :separator => '_')`


Copyright (c) 2009 Molte Emil Strange Andersen, released under the MIT license