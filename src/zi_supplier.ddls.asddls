@AbapCatalog.sqlViewName: 'ZI_SUPPLIER_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
define view ZI_Supplier 
  as select from zdt_lfa1 {
  
  @ObjectModel.text.element: ['SupplierName']
  @EndUserText.label: 'Supplier'
  key lifnr as Supplier,
    
  @EndUserText.label: 'Name of Supplier'
  name1 as SupplierName
}
