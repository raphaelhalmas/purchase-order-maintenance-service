@AbapCatalog.sqlViewName: 'ZI_SUPPLIER_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
define view ZI_Supplier 
  as select from zdt_lfa1 {
  
  @ObjectModel.text.element: ['SupplierName']
  @EndUserText.label: 'Vendor'
  key lifnr as Supplier,
    
  @Semantics.text: true
  @EndUserText.label: 'Name of Supplier'
  name1 as SupplierName
  
}
