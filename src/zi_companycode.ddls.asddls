@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.sqlViewName: 'ZIFICOMPANYCODE'
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Company Code'
@ObjectModel.resultSet.sizeCategory: #XS -- drop down menu for value help
@Search.searchable: true
define view ZI_CompanyCode 
  as select from zdt_t001 {
  
  @EndUserText.label: 'Company Code'
  @ObjectModel.text.element: ['CompanyCodeName']  
  key bukrs as CompanyCode,  
  
  @EndUserText.label: 'Company Name'
  @Search.defaultSearchElement: true
  butxt as CompanyCodeName  
}
