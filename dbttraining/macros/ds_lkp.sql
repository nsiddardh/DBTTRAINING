{% macro generate_lkp_query(src_tbl,lkp_tbl,jointype,joinoperator,srcfield,tgtfield,src_field_names,lkp_field_names) %}

--{% set jointype=  join_type | replace("[", "") | replace("]", "") | replace("'","")  %}
{% set joinoperator=  joinoperator | replace("[", "") | replace("]", "") | replace("'","") %}
{% set srcfield=  srcfield | replace("[", "") | replace("]", "") | replace("'","") %}
{% set tgtfield=  tgtfield | replace("[", "") | replace("]", "") | replace("'","") %}
{% set src_field_names=  src_field_names | replace("[", "") | replace("]", "") | replace("'","") %}
{% set lkp_field_names=  lkp_field_names | replace("[", "") | replace("]", "") | replace("'","") %}

    {%- if jointype == 'I' -%}
   (SELECT {{src_field_names}} , {{lkp_field_names}} from ({{src_tbl}}) as src_tbl INNER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}})
        

    {%- elif jointype == 'L' -%}
   (SELECT {{src_field_names}} , {{lkp_field_names}}  from ({{src_tbl}}) as src_tbl LEFT OUTER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}} )
        

    {%- elif jointype == 'R' -%}
   (SELECT {{src_field_names}} , {{lkp_field_names}}  from ({{src_tbl}}) as src_tbl RIGHT OUTER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}} )
        

    {%- elif jointype == 'F' -%}
   (SELECT {{src_field_names}} , {{lkp_field_names}}  from ({{src_tbl}}) as src_tbl FULL OUTER JOIN ({{lkp_tbl}}) as lkp_tbl on {{srcfield}}  {{joinoperator}} {{tgtfield}} )


    {%- else -%}
    (SELECT {{src_field_names}} , {{lkp_field_names}}  from ({{src_tbl}}) as src_tbl , ({{lkp_tbl}}) as lkp_tbl where {{srcfield}}  {{joinoperator}} {{tgtfield}})
    {%- endif -%}

{%- endmacro %}