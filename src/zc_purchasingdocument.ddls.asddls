@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order'
@Metadata.allowExtensions: true
define root view entity ZC_PurchasingDocument 
  provider contract transactional_query
  as projection on ZI_PurchasingDocument   
{
  
  @ObjectModel: { text.element: [ 'PurchaseOrderTypeName' ] }
  key PurchasingDocument,
  PurchaseOrderTypeName,
  
  @ObjectModel: { text.element: [ 'SupplierName' ] }
  Supplier,  
  SupplierName,
  
  @ObjectModel: { text.element: [ 'CompanyCodeName' ] }
  CompanyCode,
  CompanyCodeName,
  
  _PurchasingDocumentItem : redirected to composition child ZC_PurchasingDocumentItem
    
}
