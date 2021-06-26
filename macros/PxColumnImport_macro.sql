{%- macro PxColumnImport_macro(metadata_dict=none) -%}


{%- set derived_columns = metadata_dict['derived_columns'] -%}
{%- set source_model = metadata_dict['source_model'] -%}
{%- set import_column = metadata_dict['import_column'] -%}
{%- set column_method = metadata_dict['column_method'] -%}
{%- set delimiter = metadata_dict['delimiter'] -%}
{%- set derived_columns = metadata_dict['derived_columns'] -%}

SELECT 
{% for col in derived_columns -%}

    {% if col ==  import_column %}
    {{col}} as {{col}}
    {% endif %}

    {%- if col !=  import_column and loop.index == 1 -%}
    SUBSTRING(0,POSITION('{{delimiter}}',{{import_column}} , {{loop.index}})) as {{col}},
    {% endif %}

    {%- if col !=  import_column and loop.index > 1 and loop.index != derived_columns|length -%}
    SUBSTRING(POSITION('{{delimiter}}',{{import_column}} , {{loop.index-1}}),POSITION('{{delimiter}}',{{import_column}} , {{loop.index}})) as {{col}} ,
    {% endif %}

    {%- if col !=  import_column and loop.index == derived_columns|length -%}
    SUBSTRING(POSITION('{{delimiter}}',{{import_column}} , {{loop.index-1}}),POSITION('{{delimiter}}',{{import_column}} , {{loop.index}})) as {{col}} 
    {% endif %}
{%- endfor -%}

FROM {{source_model}}


{% endmacro %}