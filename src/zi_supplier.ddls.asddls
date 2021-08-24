@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AbapCatalog.sqlViewName: 'ZI_SUPPLIER_CDS'
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
define view ZI_Supplier 
  as select from zdt_lfa1 {
  
  @EndUserText.label: 'Supplier'
  @ObjectModel.text.element: ['SupplierName']  
  key lifnr as Supplier,
    
  @EndUserText.label: 'Name of Supplier'
  name1 as SupplierName
}
