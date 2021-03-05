{% macro remove_braces(str) %}
{% set str=  str | replace("(","") | replace(")","")  %}
{% set str1 =  str | replace(",,",",") %}
{{str1}}
{%- endmacro %}