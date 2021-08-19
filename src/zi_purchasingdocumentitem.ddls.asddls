@AbapCatalog.sqlViewName: 'ZIMMPURGDOCITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Item'
define view ZI_PurchasingDocumentItem as select from zdt_ekpo 
  association [1..1] to ZI_PurchasingDocument as _PurchasingDocument on $projection.PurchasingDocument = _PurchasingDocument.PurchasingDocument
{
  key ebeln as PurchasingDocument,
  key ebelp as PurchasingDocumentItem,
  
  matnr as Material,
  
  @Semantics.text: true
  txz01 as PurchasingDocumentItemText,
  
  menge as OrderQuantity,
  
  @Semantics.unitOfMeasure: true
  meins as OrderQuantityUnit,
  
  netpr as NetPriceAmount,
  
  @Semantics.currencyCode: true
  _PurchasingDocument.DocumentCurrency,
  
  _PurchasingDocument
}
