@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order'
@Metadata.allowExtensions: true
define root view entity ZC_PurchasingDocument 
  provider contract transactional_query
  as projection on ZI_PurchasingDocument   
{  
  key PurchasingDocumentId,
  
  PurchasingDocument,
  
  @ObjectModel: { text.element: [ 'PurchasingDocumentTypeName' ] }
  PurchasingDocumentType,
  PurchasingDocumentTypeName,
  
  @ObjectModel: { text.element: [ 'SupplierName' ] }
  Supplier,
  SupplierName,
  
  @ObjectModel: { text.element: [ 'CompanyCodeName' ] }
  CompanyCode,
  CompanyCodeName,
  
  @ObjectModel: { text.element: [ 'PurchasingGroupName' ] }
  PurchasingGroup,
  PurchasingGroupName,  
  
  @ObjectModel: { text.element: [ 'PurchasingOrganizationName' ] }
  PurchasingOrganization,
  PurchasingOrganizationName,
  
  DocumentCurrency,
  PurchasingDocumentOrderDate,
  
  _Supplier,
  
  _PurchasingDocumentItem : redirected to composition child ZC_PurchasingDocumentItem   
}
