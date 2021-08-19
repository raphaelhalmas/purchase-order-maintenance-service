@AbapCatalog.sqlViewName: 'ZIPURGDOCTYP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Type'
define view ZI_PurchasingDocumentType 
  as select from zdt_t161
   
  association [0..1] to ZI_PurchasingDocumentTypeText as _Text 
    on $projection.PurchasingDocumentCategory = _Text.PurchasingDocumentCategory 
   and $projection.PurchasingDocumentType = _Text.PurchasingDocumentType
{
  key bstyp as PurchasingDocumentCategory,
  
  @ObjectModel.text.association: '_Text'
  key bsart as PurchasingDocumentType,
  
  _Text
  
}
