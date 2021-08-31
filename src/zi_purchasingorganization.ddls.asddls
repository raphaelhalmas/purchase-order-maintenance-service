@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.sqlViewName: 'ZIMMPURGORG'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Organization'
@ObjectModel.resultSet.sizeCategory: #XS -- drop down menu for value help
@Search.searchable: true
define view ZI_PurchasingOrganization 
  as select from zdt_t024e {
    
  @EndUserText.label: 'Purchasing Organization'
  @ObjectModel.text.element: ['PurchasingOrganizationName']
  key ekorg as PurchasingOrganization,

  @EndUserText.label: 'Purchasing Organization'
  @Search.defaultSearchElement: true
  ekotx as PurchasingOrganizationName  
}
