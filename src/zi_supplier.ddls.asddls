@AbapCatalog.sqlViewName: 'ZI_SUPPLIER_CDS'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Supplier'
define view ZI_Supplier as select from zdt_lfa1 {
  key lifnr as Supplier,
  name1 as SupplierName
}
