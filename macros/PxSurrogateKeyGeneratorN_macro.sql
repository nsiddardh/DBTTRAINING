{%- macro PxSurrogateKeyGeneratorN_macro(metadata_dict=none) -%}

{% set source_model = metadata_dict['source_model'] %}

{% set derived_columns = metadata_dict['derived_columns'] %}

{% set state_file_used = metadata_dict['state_file_used'] %}


SELECT {{ create_alias(source_model=source_model,  derived_columns=derived_columns) }} ,
row_number() over (partition by 1 order by 1 ) + SKEY_VALUE as SKEY_VALUE
FROM {{ source_model }} , 
{%- if state_file_used == 'YES' -%} 
    (select max(SKEY_VALUE) as SKEY_VALUE from )t
{%- else -%}
       {{ source_query_override }}
    (select 0 as SKEY_VALUE )t
{%- endif -%}
{% endmacro %}