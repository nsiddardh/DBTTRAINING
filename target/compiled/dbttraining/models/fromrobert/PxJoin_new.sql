














select jn_srcs_lnk_src_addr.APP_PKG_ID AS APP_PKG_ID,
    jn_srcs_lnk_src_addr.PARTY_PD_ID AS PARTY_PD_ID,
    jn_srcs_lnk_src_addr.DEP_CUST_RSK_SCR_SVC_FAIL_CD AS DEP_CUST_RSK_SCR_SVC_FAIL_CD,
    jn_srcs_lnk_src_addr.DEP_UW_MBR_NR_RESC_CD AS DEP_UW_MBR_NR_RESC_CD,
    jn_srcs_lnk_src_addr.MBR_RLTN_VAR_FAIL_CD AS MBR_RLTN_VAR_FAIL_CD 
from jn_srcs_lnk_src_addr  


left outer join jn_srcs_Lnk_src_nas  on 
 
    
    
        jn_srcs_lnk_src_addr.APP_PKG_ID = jn_srcs_Lnk_src_nas.APP_PKG_ID and
    
    
        jn_srcs_lnk_src_addr.PARTY_PD_ID = jn_srcs_Lnk_src_nas.PARTY_PD_ID
    
 
left outer join jn_srcs_Lnk_src_appl  on 
 
    
    
        jn_srcs_lnk_src_addr.APP_PKG_ID = jn_srcs_Lnk_src_appl.APP_PKG_ID and
    
    
        jn_srcs_lnk_src_addr.PARTY_PD_ID = jn_srcs_Lnk_src_appl.PARTY_PD_ID
    
 
left outer join jn_srcs_Lnk_pvt_seg  on 
 
    
    
        jn_srcs_lnk_src_addr.APP_PKG_ID = jn_srcs_Lnk_pvt_seg.APP_PKG_ID and
    
    
        jn_srcs_lnk_src_addr.PARTY_PD_ID = jn_srcs_Lnk_pvt_seg.PARTY_PD_ID
    
 
  

