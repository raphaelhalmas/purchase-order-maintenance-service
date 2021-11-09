@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.sqlViewName: 'ZI_SUPPLIER_CDS'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
@Search.searchable: true
define root view ZI_Supplier 
  as select from zdt_lfa1 {
  
  key supplier_id as SupplierId,
  
  @EndUserText.label: 'Supplier'
  @ObjectModel.text.element: ['SupplierName']  
  lifnr as Supplier,    
  
  @EndUserText.label: 'Name of Supplier'
  @Search.defaultSearchElement: true
  name1 as SupplierName,
  
  @Semantics.user.createdBy: true
  created_by as CreatedBy,
    
  @Semantics.systemDateTime.createdAt: true
  created_at as CreatedAt,
    
  @Semantics.user.lastChangedBy: true
  last_changed_by as LastChangedBy,
    
  @Semantics.systemDateTime.lastChangedAt: true
  last_changed_at as LastChangedAt,
    
  @Semantics.systemDateTime.localInstanceLastChangedAt: true
  local_last_changed_at as LocalLastChangedAt
}
