@AbapCatalog.sqlViewName: 'ZIMMPURGDOCITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Item'
define view ZI_PurchasingDocumentItem 
  as select from zdt_ekpo
  association to parent ZI_PurchasingDocument as _PurchasingDocument 
  on $projection.PurchasingDocumentId = _PurchasingDocument.PurchasingDocumentId 
{
  key purg_doc_item_id as PurchasingDocumentItemId,
  purg_doc_id as PurchasingDocumentId, 

  ebeln as PurchasingDocument,
  ebelp as PurchasingDocumentItem,
  
  matnr as Material,
  
  @Semantics.text: true
  txz01 as PurchasingDocumentItemText,
  
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  menge as OrderQuantity,
  
  meins as OrderQuantityUnit,
  
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  cast(netpr as abap.dec(11,2)) as NetPriceAmount,
  
  _PurchasingDocument.DocumentCurrency as DocumentCurrency,
    
  _PurchasingDocument
}
