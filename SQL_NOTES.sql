
SELECT *
 FROM PS_IN_DEMAND PS
 WHERE LOAD_ID = 'CRG0453720'
 AND BUSINESS_UNIT = 'DIMED'
 
 --EIP_CTL_ID: DIMED00000000000002868666
 
 SELECT * FROM ps_ck_ship_cf_log A WHERE a.business_unit = 'DIMED' and A.load_id = 'CRG0453720';
 
SELECT * FROM ps_bct_ctl a where a.business_unit = 'DIMED' and a.eip_ctl_id = 'DIMED00000000000002868648';
 
SELECT * FROM ps_bct_dtl a where a.business_unit = 'DIMED' and a.eip_ctl_id = 'DIMED00000000000002868648';
 
SELECT * FROM ps_inv_ful_grp_ec a WHERE a.business_unit = 'DIMED' and a.eip_ctl_id = 'DIMED00000000000002868648';
 
SELECT * FROM ps_inv_ful_dtl_ec a WHERE a.business_unit = 'DIMED' and a.eip_ctl_id = 'DIMED00000000000002868648';
 
SELECT * FROM ps_inv_ful_lls_ec a WHERE a.business_unit = 'DIMED' and a.eip_ctl_id = 'DIMED00000000000002868648';


--

SELECT LOAD_ID, CK_DG_SHIPMENT_ID , CK_ORDER_NO_MA , SOURCE_BUS_UNIT, ORDER_NO 
FROM PS_CK_IN_DMD_CTL
WHERE LOAD_ID = 'CRG0453393'


--

SELECT a.cust_id,
        a.ship_dttm,
        a.order_no,
        a.inv_item_id,
        a.order_int_line_no,
        a.CARRIER_ID,
        a.LOAD_ID
   FROM ps_in_demand @ ckpru a
  WHERE a.business_unit = 'DIMED'
-- AND a.in_fulfill_state = '70' 
    AND a.demand_date > TO_DATE('2026-08-01', 'YYYY-MM-DD')
    AND a.demand_source = 'IN'
    AND a.IN_FULFILL_STATE = '40'
    and a.EXT_REF_NBR = 0
    and a.LOAD_ID = ' '
    and carrier_id <> '0000000001'
  ORDER BY a.demand_date DESC
  
  
  ---
  
  
  SELECT * FROM PS_CK_MOV_DEVOL A
WHERE A.BUSINESS_UNIT = 'DIMED' 
AND A.INV_ITEM_ID  = '7500435196093'
ORDER BY DATETIME_SENT DESC; 

--

SELECT * FROM PS_BCT_CTL
WHERE BUSINESS_UNIT = 'DIMED'
ORDER BY DEVICE_DTTIME DESC
