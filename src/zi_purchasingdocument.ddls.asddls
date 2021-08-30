@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Purchasing Document'
define root view entity ZI_PurchasingDocument 
  as select from zdt_ekko

  composition[0..*] of ZI_PurchasingDocumentItem as _PurchasingDocumentItem

  association [0..1] to ZI_PurchasingDocumentType as _PurchaseOrderType
    on _PurchaseOrderType.PurchasingDocumentCategory = 'F'
   and _PurchaseOrderType.PurchasingDocumentType = $projection.PurchasingDocumentType

  association [0..1] to ZI_PurchasingDocumentTypeText as _PurchaseOrderTypeText   
    on _PurchaseOrderTypeText.PurchasingDocumentType = $projection.PurchasingDocumentType
   and _PurchaseOrderTypeText.PurchasingDocumentCategory = 'F'

  association [0..1] to ZI_CompanyCode as _CompanyCode on $projection.CompanyCode = _CompanyCode.CompanyCode
  association [0..1] to ZI_Supplier as _Supplier on $projection.Supplier = _Supplier.Supplier
  association [0..1] to ZI_PurchasingOrganization as _PurchasingOrganization on $projection.PurchasingOrganization = _PurchasingOrganization.PurchasingOrganization
  association [0..1] to ZI_PurchasingGroup as _PurchasingGroup on $projection.PurchasingGroup = _PurchasingGroup.PurchasingGroup
{  
  key purg_doc_id as PurchasingDocumentId,
  ebeln as PurchasingDocument,
  
  bukrs as CompanyCode,
  _CompanyCode.CompanyCodeName as CompanyCodeName,
  
  bstyp as PurchasingDocumentCategory,
    
  bsart as PurchasingDocumentType,
  _PurchaseOrderTypeText.PurchasingDocumentTypeName as PurchasingDocumentTypeName,
    
  lifnr as Supplier,
  _Supplier.SupplierName as SupplierName, 

  ekorg as PurchasingOrganization,
  _PurchasingOrganization.PurchasingOrganizationName as PurchasingOrganizationName,
  
  ekgrp as PurchasingGroup,
  _PurchasingGroup.PurchasingGroupName as PurchasingGroupName,
  
  waers as DocumentCurrency,
  
  bedat as PurchasingDocumentDate,
  
  @Semantics.amount.currencyCode: 'DocumentCurrency'
  netwr as PurchasingDocumentNetAmount,
    
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
    
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
    
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
    
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
    
  _PurchasingDocumentItem,
  _PurchaseOrderType,
  _PurchaseOrderTypeText,
  _CompanyCode,
  _Supplier,
  _PurchasingOrganization,
  _PurchasingGroup
}
