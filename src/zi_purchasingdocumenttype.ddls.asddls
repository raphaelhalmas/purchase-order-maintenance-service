@AbapCatalog.sqlViewName: 'ZIPURGDOCTYP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Type'
@ObjectModel.resultSet.sizeCategory: #XS -- drop down menu for value help
@Search.searchable: true
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
  
  @Consumption.filter.hidden: true
  @EndUserText.label: 'Order Type Description'
  @Search.defaultSearchElement: true
  _Text.PurchasingDocumentTypeName as PurchasingDocumentTypeName,
  
  _Text  
}
