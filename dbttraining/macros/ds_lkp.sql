{% macro generate_lkp_query(src_tbl,lkp_tbl,jointype,joinoperator,srcfield,tgtfield,field_names) %}
    {%- if jointype == 'I' -%}
   (SELECT {{field_names}} from ({{src_tbl}}) as src_tbl INNER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}})
        

    {%- elif jointype == 'L' -%}
   (SELECT {{field_names}} from ({{src_tbl}}) as src_tbl LEFT OUTER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}} )
        

    {%- elif jointype == 'R' -%}
   (SELECT {{field_names}} from ({{src_tbl}}) as src_tbl RIGHT OUTER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}} )
        

    {%- elif jointype == 'F' -%}
   (SELECT {{field_names}} from ({{src_tbl}}) as src_tbl FULL OUTER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}} )


    {%- else -%}
    (SELECT {{field_names}} from ({{src_tbl}}) as src_tbl , ({{lkp_tbl}}) as lkp_tbl where {{srcfield}}  {{joinoperator}} {{tgtfield}})
    {%- endif -%}

{%- endmacro %}