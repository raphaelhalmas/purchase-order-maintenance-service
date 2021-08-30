@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order'
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'PurchasingDocumentId'
@ObjectModel.semanticKey: ['PurchasingDocumentId']
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
  PurchasingDocumentDate,
  PurchasingDocumentNetAmount,
  
  _Supplier,
  
  _PurchasingDocumentItem : redirected to composition child ZC_PurchasingDocumentItem   
}
