{% macro remove_brackets(str) %}
{% set str=  str | replace("[","") | replace("]","")  %}
{{str}}
{%- endmacro %}