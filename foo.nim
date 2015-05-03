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
      vString: string
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
    v.vString
  of kHash:
    var s = "kHash"
    for k, vsub in v.vHash:
        s = s & "," & $k & "=" & $vsub
    s
  of kArray:
    "kArray"
var h = initTable[string, Value]()
h["foo"] = Value(vString: "bar")
h["lang"] = Value(vString: "nim")
var x = Value(kind: kHash, vHash: h)
echo($x)
