


/* -------STAGE VARIABLES SECTION--------This section repeats for all output links in transformation stage-----*/


   /*  Replace Here with <component_name>_<link_name> run pre-cypher */



   /*  Replace Here with <component_name>_<link_name> run pre-cypher */

/* -------EXPRESSIONS AND TARGET COLUMNS ALIASING SECTION--------*/











SELECT tx_poc_ln_in_tx.SAME_NAME AS SAME_NAME,
     CASE WHEN IsNotNull(Left( CASE WHEN IsNotNull(tx_poc_ln_in_tx.ORIG_NAME) Then tx_poc_ln_in_tx.ORIG_NAME Else  Trim(tx_poc_ln_in_tx.ORIG_NAME) END,25)) Then Left( CASE WHEN IsNotNull(tx_poc_ln_in_tx.ORIG_NAME) Then tx_poc_ln_in_tx.ORIG_NAME Else  Trim(tx_poc_ln_in_tx.ORIG_NAME) END,25) Else tx_poc_ln_in_tx.ORIG_NAME END AS ORIG_NAME 
FROM tx_poc_ln_in_tx
