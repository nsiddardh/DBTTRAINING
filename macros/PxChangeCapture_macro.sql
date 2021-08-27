{%- macro PxChangeCapture_macro(metadata_dict=none) -%}

{%- set before_model = metadata_dict['before_model'] -%}
{%- set after_model = metadata_dict['after_model'] -%}

{%- set before_columns = metadata_dict['before_columns'] -%}
{%- set after_columns = metadata_dict['after_columns'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}

{%- set key_columns = metadata_dict['key_columns'] -%}
{%- set change_columns = metadata_dict['change_columns'] -%}

{%- set key_col_list = key_columns|join('||') -%}
{%- set change_col_list = change_columns|join('||') -%}

SELECT {{ create_alias(source_model=after_model,  derived_columns=derived_columns) }} , 0 AS CHNAGE_CODE
FROM   {{after_model}} where    {{key_col_list}}||{{change_col_list}}     in     (
                        select {{key_col_list}}||{{change_col_list}}
                            from {{ before_model }} as {{ before_model }} 
                        
                    )

UNION ALL

SELECT {{ create_alias(source_model=after_model,  derived_columns=derived_columns) }} , 1 AS CHNAGE_CODE
FROM   {{after_model}} where    {{key_col_list}} not  in     (
                        select {{key_col_list}}
                            from {{ before_model }} as {{ before_model }} 
                        
                    )

UNION ALL

SELECT {{ create_alias(source_model=after_model,  derived_columns=derived_columns) }} , 2 AS CHNAGE_CODE
FROM   {{before_model}} where    {{key_col_list}} not  in     (
                        select {{key_col_list}}
                            from {{ after_model }} as {{ after_model }} 
                        
                    )

UNION ALL

SELECT {{ create_alias(source_model=after_model,  derived_columns=derived_columns) }} , 3 AS CHNAGE_CODE
FROM   {{after_model}} 
where    MD5({{key_col_list}}) in   (select   after_key_col from 
(select MD5({{key_col_list}}) as after_key_col, MD5({{change_col_list}}) as after_change_col_list from {{after_model}} )a,
(select MD5({{key_col_list}}) as before_key_col, MD5({{change_col_list}}) as before_change_col_list from {{before_model}})b
 where a.after_key_col = b.before_key_col and a.after_change_col_list != b.before_change_col_list)                        


{% endmacro %}