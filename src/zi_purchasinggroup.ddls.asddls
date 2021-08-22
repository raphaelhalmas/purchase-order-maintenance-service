@AbapCatalog.sqlViewName: 'ZIMMPURCHGROUP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Group'
define view ZI_PurchasingGroup 
  as select from zdt_t024 {
  
  @ObjectModel.text.element: ['PurchasingGroupName']
  @EndUserText.label: 'Purchasing Group'
  key ekgrp as PurchasingGroup,
    
  @EndUserText.label: 'Purchasing Group'
  eknam as PurchasingGroupName  
}
