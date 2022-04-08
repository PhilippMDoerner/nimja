discard """
  joinable: false
"""
import ../../src/nimja
import unittest

suite "proc_import":

  test "basic":
    proc test(): string =
      compileTemplateStr("""{% importnwt "procs.html" %}{{foo()}}""")
    check test() == "foo"

  test "import on child (in block)":
    proc test(): string =
      compileTemplateStr("""
        {%- extends "procsMaster.html" -%}
        {%- block "content" -%}
          {%- importnwt "procs.html" -%}
          {{- foo() -}}
        {%- endblock -%}
      """)
    check test() == "foo"

## This cannot work?
#   test "import on child (no block)":
#     proc test(): string =
#       compileTemplateStr("""
#         {%- extends "procsMaster.html" -%}
#         {%- importnwt "procs.html" -%}
#         {%- block "content" -%}
#           {{- foo() -}}
#         {%- endblock -%}
#       """)
#     check test() == "foo"
