{{ config(materialized='view') }}



{% set my_json_str = '{"abc": 123}' %}
{% set my_dict = fromjson(my_json_str) %}

{% do log(my_dict['abc']) %}