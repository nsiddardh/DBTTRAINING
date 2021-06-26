{% set yaml_metadata %}
derived_columns:
    DW_MINUTE: "odbc_time_minute_det.DW_MINUTE"
    DW_BUSI_DAY: "odbc_time_day_dim.DW_DAY"
{% endset %}
{% set metadata_dict = fromyaml(yaml_metadata) %}
{% set columns = metadata_dict['derived_columns'] %}
{{ columns }}
{% do columns.update({'DW_MINUTE': 'DW_MINUTEssdfddfdfdfasdfasdfasdfa'}) %}
{{ columns }}