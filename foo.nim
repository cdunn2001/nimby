echo "Hello World"

import macros

type
  Value = ref ValueObj
  ValueObj = object
    v: Value
var x = Value(v: nil)
