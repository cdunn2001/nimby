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
      vArray: seq[Value]
    of kNil:
      nil

proc `$`(v: Value): string =
  case v.kind:
  of kNil:
    "kNil"
  of kString:
    "kString"
  of kHash:
    "kHash"
  of kArray:
    "kArray"
var x = Value(v: nil)
echo($x)
