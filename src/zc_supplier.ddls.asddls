@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['Supplier']
@Search.searchable: true
define root view entity ZC_Supplier 
  provider contract transactional_query
  as projection on ZI_Supplier
{  
  key Supplier,
  SupplierName
  
}
