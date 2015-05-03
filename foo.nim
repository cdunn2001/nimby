# vim: set et sw=2 ts=2:

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

proc toStr(v: Value, indent: string = ""): string =
  case v.kind:
  of kNil:
    indent & "kNil"
  of kString:
    indent & v.vString & "\n"
  of kHash:
    var s = indent & "kHash\n"
    for k, vsub in v.vHash:
      s = s & indent & " " & k & ":" & "\n" & toStr(vsub, indent & "  ")
    s
  of kArray:
    var s = indent & "kArray\n"
    for vsub in v.vArray:
      s = s & toStr(vsub, indent & " ")
    s

proc `$`(v: Value): string =
  toStr(v, "")

var list = @[Value(vString: "value1"), Value(vString: "value2")]
var hash = initTable[string, Value]()
hash["foo"] = Value(vString: "bar")
hash["lang"] = Value(vString: "nim")
hash["values"] = Value(kind: kArray, vArray: list)
var x = Value(kind: kHash, vHash: hash)
echo($x)
