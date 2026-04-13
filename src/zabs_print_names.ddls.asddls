@EndUserText.label: 'abs'
define abstract entity ZABS_PRINT_NAMES
{
     @Consumption.valueHelpDefinition: [{
     entity: { name: 'ZC_PRINT_NAMES', element: 'id' }
  }]
  @UI.textArrangement: #TEXT_ONLY
    @EndUserText.label: 'printype'
   printype : abap.char( 30 );
  
    
}
