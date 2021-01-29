{{ config(materialized='view') }}

 {{ generate_lkp_query( ref('seq_hme_detail')  , ref('odbc_time_day_dim') , 'I', '=', 'BUSINESS_DATE',  'BUSIDAYDT',  
    dbtvault.stage(include_source_columns=var('include_source_columns', none),source_model=var('source_model', none),hashed_columns=var('hashed_columns', none) ,derived_columns=var('derived_columns', none)
 )     
 )  }}