@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Item'
@Metadata.allowExtensions: true
@ObjectModel.semanticKey: ['PurchasingDocumentItem']
define view entity ZC_PurchasingDocumentItem
  as projection on ZI_PurchasingDocumentItem   
{
  key PurchasingDocumentItemId,
  PurchasingDocumentId,
  
  PurchasingDocument,
  PurchasingDocumentItem,

  Material,
  PurchasingDocumentItemText,    
  OrderQuantity,
  OrderQuantityUnit,
  
  MaterialGroup,
  MaterialGroupText,
  
  NetPriceAmount,
  DocumentCurrency,
  
  _PurchasingDocument : redirected to parent ZC_PurchasingDocument
  //_MaterialGroup
}
