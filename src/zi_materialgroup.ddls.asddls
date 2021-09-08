@AbapCatalog.sqlViewName: 'ZIMATERIALGROUP'
@AbapCatalog.compiler.compareFilter: true
@AbapCatalog.preserveKey: true
@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Material Group'
/*+[hideWarning] { "IDS" : ["KEY_CHECK"] }*/
define view ZI_MaterialGroup as select from DDCDS_CUSTOMER_DOMAIN_VALUE_T(p_domain_name: 'ZMATKL') {
  @EndUserText.label: 'Material Group'
  @ObjectModel.text.element: ['MaterialGroupText']
  key value_low as MaterialGroup,
  
  @EndUserText.label: 'Material Group Text'
  text as MaterialGroupText
}
