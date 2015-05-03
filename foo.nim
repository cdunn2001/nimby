# vim: set et sw=2 ts=2 sts=2:

echo "Hello World"

import macros
import tables

type
  ValueKind = enum
    kString, kInt, kFloat, kHash, kArray, kNil
  Value = ref ValueObj
  ValueObj = object
    case kind: ValueKind
    of kString:
      vString: string
    of kInt:
      vInt: int
    of kFloat:
      vFloat: float
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
  of kInt:
    indent & $v.vInt & "\n"
  of kFloat:
    indent & $v.vFloat & "\n"
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
hash["verions-major"] = Value(kind: kInt, vInt: 0)
hash["verions-minor"] = Value(kind: kInt, vInt: 1)
hash["verions-sub"] = Value(kind: kInt, vInt: 2)
hash["pi"] = Value(kind: kFloat, vFloat: 3.1415926)
hash["values"] = Value(kind: kArray, vArray: list)
var x = Value(kind: kHash, vHash: hash)
echo($x)

type
  SliceObj = object

type
  ParserObj = object
    

proc parse_json(s: string): Value =
    Value(kind: kNil)

let json_text = readFile("example.json")

var json = parse_json(json_text)

echo($json)
