@AbapCatalog.sqlViewName: 'ZIFICOMPANYCODE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Company Code'
define view ZI_CompanyCode as select from zdt_t001 {
  key bukrs as CompanyCode,
  butxt as CompanyCodeName
}
