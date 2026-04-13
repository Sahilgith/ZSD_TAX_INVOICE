@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Interface for print names'
@Metadata.ignorePropagatedAnnotations: true
define root view entity ZI_PRINT_NAMES 
as select from zsd_yes_no

{
    key id,
    name  // Make association public
}
