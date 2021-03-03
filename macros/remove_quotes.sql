{% macro remove_quotes(str) %}


{% set str=  str | replace("'","") %}

{{str}}

{%- endmacro %}