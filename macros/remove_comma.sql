{% macro remove_comma(str) %}


{% set str=  str | replace(",","") %}

{{str}}

{%- endmacro %}