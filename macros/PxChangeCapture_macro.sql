{%- macro PxChangeCapture_macro(metadata_dict=none) -%}

{%- set source_model = metadata_dict['source_model'] -%}
{%- set change_model = metadata_dict['change_model'] -%}

{%- set source_columns = metadata_dict['source_columns'] -%}
{%- set change_columns = metadata_dict['change_columns'] -%}

{%- set key_columns = metadata_dict['key_columns'] -%}

{%- set col_list = key_columns|join('||') -%}

SELECT *, 0 AS CHNAGE_CODE
FROM                (
                        select {{ create_alias(source_model=change_model,  derived_columns=change_columns) }} 
                            from {{ change_model }} as {{ change_model }} 
                        INTERSECT
                        select {{ create_alias(source_model=source_model,  derived_columns=source_columns) }} 
                            from {{ source_model }} as {{ source_model }} 
                    )

UNION ALL

SELECT {{ create_alias(source_model=change_model,  derived_columns=change_columns) }} , 1 AS CHNAGE_CODE
  FROM {{ change_model }} as {{ change_model }} 
 WHERE MD5({{col_list}}) IN
                        (SELECT MD5({{col_list}}) AS UNIQUE_KEY
                           FROM {{ change_model }} as {{ change_model }} 
                         MINUS
                         SELECT MD5({{col_list}}) AS UNIQUE_KEY
                           FROM {{ source_model }} as {{ source_model }}
                        )
                       
UNION ALL

SELECT {{ create_alias(source_model=change_model,  derived_columns=change_columns) }} , 2 AS CHNAGE_CODE
  FROM {{ source_model }} as {{ source_model }} 
 WHERE MD5({{col_list}}) IN
                        (SELECT MD5({{col_list}}) AS UNIQUE_KEY
                           FROM {{ source_model }} as {{ source_model }} 
                         MINUS
                         SELECT MD5({{col_list}}) AS UNIQUE_KEY
                           FROM {{ change_model }} as {{ change_model }}
                        )



UNION ALL

SELECT  * , 3 AS CHNAGE_CODE
  FROM                 (SELECT {{ create_alias(source_model=change_model,  derived_columns=change_columns) }}
                           FROM {{ change_model }} as {{ change_model }}
                        MINUS
                        SELECT {{ create_alias(source_model=change_model,  derived_columns=change_columns) }}
                           FROM {{ source_model }} as {{ source_model }} 
                       )


{% endmacro %}