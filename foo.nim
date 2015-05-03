echo "Hello World"

import macros

type
  Value = ref ValueObj
  ValueObj = object
    v: Value

proc `$`(v: Value): string =
  "foo"
var x = Value(v: nil)
echo($x)
