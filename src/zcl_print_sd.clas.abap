CLASS zcl_print_sd DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.


  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_print_sd IMPLEMENTATION.

 METHOD if_oo_adt_classrun~main.


 seLECT * "#EC CI_NOWHERE
 from zsd_yes_no
 into table @data(lt_stat).

     IF  sy-subrc = 0.
      DELETE zsd_yes_no FROM TABLE @lt_stat.
    ENDIF.



    CLEAR : lt_stat.

    lt_stat = VALUE #( ( id = '1' name = 'ORIGINAL FOR BUYER' )
                       (  id = '2'  name = 'DUPLICATE FOR TRANSPORTER' )
                        ( id = '3' name = 'TRIPLICATE FOR SUPPLIER' )
                            ( id = '4' name = 'EXTRA COPY' )
                              ).

    IF  lt_stat IS NOT INITIAL.
      INSERT zsd_yes_no FROM TABLE @lt_stat.
      COMMIT WORK.
    ENDIF.



 enDMETHOD.


ENDCLASS.
