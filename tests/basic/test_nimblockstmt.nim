discard """
  joinable: false
"""
import ../../src/nimja
import ../../src/nimja/nimjautils
import strutils
import unittest

import std/with

# var xx = "0"
# with xx:
#   add $10
#   add $1
# assert xx == "0101"


type User = object
  name*: string
  age*: int


proc baa(user: User, ii: int, ss: auto): string =
  result &= "BEFORE"
  ss
  result &= "AFTER"

proc ttt(user: User): string =
  user.baa(10):
    result &=
        `$`:
      user.name
    result &=
        `$`:
      user.age

proc test(user: User): string =
  compileTemplateStr("{% user.baa(10): %}{{user.name}}{{user.age}}{% end %}")

proc testA(): string =
  compileTemplateStr("""
    {% proc input(name: string, value="", ttype="text"): string = %}
        <input type="{{ ttype }}" value="{{ value }}" name="{{ name }}">
    {% end %}
    {% input("name", "value"): %}
    {% ttype="text" %}
    {% end %}
  """)

echo testA()
# let user = User(name: "foo", age: 1337)
# echo test(user) # == "foo1337"
# echo ttt(user) # == "foo1337"



# proc test2(user: User): string =
#   # with user:
#   echo user.name
#   echo user.age
# echo test2(user)