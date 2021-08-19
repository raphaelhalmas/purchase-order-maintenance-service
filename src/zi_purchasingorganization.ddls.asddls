@AbapCatalog.sqlViewName: 'ZIMMPURGORG'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Organization'
define view ZI_PurchasingOrganization 
  as select from zdt_t024e {
  
  @ObjectModel.text.element: ['PurchasingOrganizationName']
  @EndUserText.label: 'Purchasing Organization'
  key ekorg as PurchasingOrganization,
    
  @Semantics.text: true
  @EndUserText.label: 'Purchasing Organization'
  ekotx as PurchasingOrganizationName
  
}
