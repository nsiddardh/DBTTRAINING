





--create below set variables based on no of sources





 
 
    
    
    
    SELECT Funnel_12_ln_out_tx_first.SAME_NAME AS SAME_NAME,
    Funnel_12_ln_out_tx_first.NEW_NAME AS NEW_NAME 
    FROM Funnel_12_ln_out_tx_first 
    union all
 
 
    
    
    
    

    SELECT Funnel_12_ln_out_tx_second.NEW_NAME AS NEW_NAME,
    Funnel_12_ln_out_tx_second.SAME_NAME AS SAME_NAME 
    FROM Funnel_12_ln_out_tx_second


