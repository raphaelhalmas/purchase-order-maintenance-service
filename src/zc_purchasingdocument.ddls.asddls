@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['PurchasingDocument']
@Search.searchable: true
define root view entity ZC_PurchasingDocument 
  provider contract transactional_query
  as projection on ZI_PurchasingDocument   
{  
  key PurchasingDocumentId,
  
  PurchasingDocument,
  
  @Consumption.filter.defaultValue: 'ZPPD'
  PurchasingDocumentType,
  
  Supplier,
  SupplierName,

  @Consumption.filter.defaultValue: 'AH02'  
  CompanyCode,
  CompanyCodeName,
  
  PurchasingGroup,  
  PurchasingOrganization,  
  DocumentCurrency,
  PurchasingDocumentDate,
  PurchasingDocumentNetAmount,
  
  _PurchasingDocumentItem : redirected to composition child ZC_PurchasingDocumentItem   
}
