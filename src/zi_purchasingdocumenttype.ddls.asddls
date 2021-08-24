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
  @EndUserText.label: 'Category'
  key bstyp as PurchasingDocumentCategory,
  
  @EndUserText.label: 'Order Type'
  @ObjectModel.text.element: ['PurchasingDocumentTypeName']
  key bsart as PurchasingDocumentType,
  
  @EndUserText.label: 'Order Type Description'
  @Consumption.filter.hidden: true
  _Text.PurchasingDocumentTypeName as PurchasingDocumentTypeName,
  
  _Text  
}
