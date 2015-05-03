echo "Hello World"

import macros
import tables

type
  ValueKind = enum
    kString, kHash, kArray, kNil
  Value = ref ValueObj
  ValueObj = object
    case kind: ValueKind
    of kString:
      v: string
    of kHash:
      vHash: Table[string, Value]
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
    var s = "kHash"
    for k, vsub in v.vHash:
        s = s & "," & $k & "=" & $vsub
    s
  of kArray:
    "kArray"
var x = Value(kind: kHash, vHash: initTable[string, Value]())
echo($x)
