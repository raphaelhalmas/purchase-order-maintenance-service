@AbapCatalog.sqlViewName: 'ZCSUPLR_VH'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@ObjectModel.dataCategory: #VALUE_HELP
@Search.searchable: true
@EndUserText.label: 'Value Help for ZI_Supplier'
define view ZC_SupplierValueHelp 
  as select from ZI_Supplier {
  
  @ObjectModel.text.element:  [ 'SupplierName' ]
  @Search: { defaultSearchElement: true, ranking: #HIGH, fuzzinessThreshold: 0.8 }
  key Supplier,

  SupplierName    
}
