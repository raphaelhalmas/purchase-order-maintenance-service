@AbapCatalog.sqlViewName: 'ZIMMPURGDOCITEM'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document Item'
define view ZI_PurchasingDocumentItem 
  as select from zdt_ekpo
  association to parent ZI_PurchasingDocument as _PurchasingDocument 
  on $projection.PurchasingDocumentId = _PurchasingDocument.PurchasingDocumentId
  association [0..1] to ZI_MaterialGroup as _MaterialGroup on $projection.MaterialGroup = _MaterialGroup.MaterialGroup 
{
  key purg_doc_item_id as PurchasingDocumentItemId,
  purg_doc_id as PurchasingDocumentId, 

  ebeln as PurchasingDocument,
  ebelp as PurchasingDocumentItem,
  
  matnr as Material,
  
  @Consumption.valueHelpDefinition: [{ entity: { name: 'ZI_MaterialGroup', element: 'MaterialGroup' } }]
  //@ObjectModel.text.association: '_MaterialGroup'  
  matkl as MaterialGroup,
  concat(concat(concat(_MaterialGroup.MaterialGroupText, ' ('), matkl), ')') as MaterialGroupText,
  //_MaterialGroup.MaterialGroupText as MaterialGroupText, 
  
  @Semantics.text: true
  txz01 as PurchasingDocumentItemText,
  
  @Semantics.quantity.unitOfMeasure: 'OrderQuantityUnit'
  menge as OrderQuantity,
  
  @Consumption.valueHelpDefinition: [{ entity: { name:'I_UnitOfMeasure', element: 'UnitOfMeasure' } }]
  meins as OrderQuantityUnit,
  
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  cast(netpr as abap.dec(11,2)) as NetPriceAmount,
  
  _PurchasingDocument.DocumentCurrency as DocumentCurrency,
    
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
    
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
    
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
    
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
    
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt,    
    
  _PurchasingDocument,
  _MaterialGroup
}
