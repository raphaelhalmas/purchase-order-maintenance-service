@AbapCatalog.sqlViewName: 'ZIPURGDOCTYPTXT'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Type Text'
define view ZI_PurchasingDocumentTypeText as select from zdt_t161t {
  key bsart as PurchasingDocumentType,
  key bstyp as PurchasingDocumentCategory,   
  batxt as PurchasingDocumentTypeName
}
