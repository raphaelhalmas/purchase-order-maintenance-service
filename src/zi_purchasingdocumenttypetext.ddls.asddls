@AbapCatalog.sqlViewName: 'ZIPURGDOCTYPTXT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Type Text'
define view ZI_PurchasingDocumentTypeText 
  as select from zdt_t161t {
  
  @Consumption.filter.hidden: true
  key bsart as PurchasingDocumentType,
  
  @Consumption.filter.hidden: true
  key bstyp as PurchasingDocumentCategory,
  
  @EndUserText.label: 'Order Type Description'
  batxt as PurchasingDocumentTypeName  
}
