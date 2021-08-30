@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchase Order Item'
@Metadata.allowExtensions: true
@ObjectModel.representativeKey: 'PurchasingDocumentItemId'
@ObjectModel.semanticKey: ['PurchasingDocumentItemId']
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
  NetPriceAmount,
  DocumentCurrency,
  
  _PurchasingDocument : redirected to parent ZC_PurchasingDocument
}
