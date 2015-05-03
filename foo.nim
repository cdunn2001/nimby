echo "Hello World"

import macros

type
  ValueKind = enum
    kString, kHash, kArray, kNil
  Value = ref ValueObj
  ValueObj = object
    case kind: ValueKind
    of kString:
      v: string
    of kHash:
      vHash: string
    of kArray:
      vArray: string
    of kNil:
      nil

proc `$`(v: Value): string =
  "foo"
var x = Value(v: nil)
echo($x)
