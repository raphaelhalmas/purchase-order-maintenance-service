@AbapCatalog.sqlViewName: 'ZIMMPURGDOCITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Item'
define view ZI_PurchasingDocumentItem 
  as select from zdt_ekpo
  association to parent ZI_PurchasingDocument as _PurchasingDocument on $projection.PurchasingDocument = _PurchasingDocument.PurchasingDocument  
{
  key ebeln as PurchasingDocument,
  key ebelp as PurchasingDocumentItem,
  
  matnr as Material,
  
  @Semantics.text: true
  txz01 as PurchasingDocumentItemText,
  
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  menge as OrderQuantity,
  
  meins as OrderQuantityUnit,
  
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  cast(netpr as abap.dec(13,2)) as NetPriceAmount,
  
  _PurchasingDocument.DocumentCurrency,
    
  _PurchasingDocument
}
