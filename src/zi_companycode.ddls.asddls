@AbapCatalog.sqlViewName: 'ZIFICOMPANYCODE'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Company Code'
@ObjectModel.resultSet.sizeCategory: #XS -- drop down menu for value help
define view ZI_CompanyCode 
  as select from zdt_t001 {
  
  @ObjectModel.text.element: ['CompanyCodeName']
  @EndUserText.label: 'Company Code'
  key bukrs as CompanyCode,
  
  @EndUserText.label: 'Company Name'
  butxt as CompanyCodeName  
}
