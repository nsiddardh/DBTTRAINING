{%- macro create_alias(source_model=none,  derived_columns=none) -%}

{% if (source_model is none) and execute %}

    {%- set error_message -%}
    "Staging error: Missing source_model configuration. A source model name must be provided.
    e.g. 
    [REF STYLE]
    source_model: model_name
    OR
    [SOURCES STYLE]
    source_model:
        source_name: source_table_name"
    {%- endset -%}

    {{- exceptions.raise_compiler_error(error_message) -}}
{%- endif -%}

{#- Check for source format or ref format and create relation object from source_model -#}
{% if source_model is mapping and source_model is not none -%}

    {%- set source_name = source_model | first -%}
    {%- set source_table_name = source_model[source_name] -%}

    {%- set source_relation = source(source_name, source_table_name) -%}
    {%- set all_source_columns = dbtvault.source_columns(source_relation=source_relation) -%}
{%- elif source_model is not mapping and source_model is not none -%}

    {%- set source_relation = ref(source_model) -%}
    {%- set all_source_columns = dbtvault.source_columns(source_relation=source_relation) -%}
{%- else -%}

    {%- set all_source_columns = [] -%}
{%- endif -%}

{%- set derived_column_names = dbtvault.extract_column_names(derived_columns) -%}

{{ dbtvault.derive_columns(source_relation=source_relation, columns=derived_columns) | indent(4) }}

{%- endmacro -%}

