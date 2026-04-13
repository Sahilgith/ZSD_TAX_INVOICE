@AccessControl.authorizationCheck: #NOT_REQUIRED
@EndUserText.label: 'Consumption for prints'
@Metadata.ignorePropagatedAnnotations: true
@ObjectModel.resultSet.sizeCategory: #XS
define root view entity ZC_PRINT_NAMES
 provider contract transactional_query
 as projection on ZI_PRINT_NAMES
{

@ObjectModel.text.element: ['name']
  @UI.textArrangement: #TEXT_ONLY
    key id,
    
    
     @Semantics.text: true
    name
}
