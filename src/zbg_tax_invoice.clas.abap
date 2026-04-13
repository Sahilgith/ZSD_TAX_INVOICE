
CLASS zbg_tax_invoice DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_bgmc_operation .
    INTERFACES if_bgmc_op_single_tx_uncontr .
    INTERFACES if_serializable_object .
    data im_text type string.
    DATA : N(1) TYPE N.
    METHODS constructor
      IMPORTING
        iv_bill  TYPE zsd_char
        iv_printname tYPE zsd_yes_no-id
*        iv_bukrs TYPE bukrs
*        iv_gjahr TYPE gjahr
        iv_m_ind TYPE abap_boolean.


  PROTECTED SECTION.
    DATA : im_bill TYPE zsd_char,
           im_printtype type  zsd_yes_no-id ,
           im_ind  TYPE abap_boolean.
*           im_bukrs TYPE bukrs,
*           im_gjahr TYPE gjahr.

    METHODS modify
      RAISING
        cx_bgmc_operation.
  PRIVATE SECTION.
ENDCLASS.



CLASS zbg_tax_invoice IMPLEMENTATION.


  METHOD constructor.
    im_bill = iv_bill.
    im_printtype = iv_printname.
    im_ind  = iv_m_ind.
*    im_bukrs = iv_bukrs.
*    im_gjahr = iv_gjahr.
  ENDMETHOD.


  METHOD if_bgmc_op_single_tx_uncontr~execute.
    modify( ).
  ENDMETHOD.


  METHOD modify.
    DATA : wa_data TYPE ztb_tax_new.  "<-write your table name
    DATA :lv_pdftest TYPE string.
    DATA lo_pfd TYPE REF TO zcl_tax_invoice.  "<-write your logic class
    DATA : wa_sign TYPE ztd_sign_b64.


    CREATE OBJECT lo_pfd
    exporTING
    iv_printname = im_printtype.
    CLEAR N.

      lo_pfd->get_pdf_64(
      EXPORTING
         io_billingdocument = im_bill
         iv_copy_text       = im_text
      RECEIVING
         pdf_64 = DATA(pdf_64)
  ).

*
    wa_sign-billingdocument = im_bill.
    wa_sign-base64_3        = pdf_64.
    wa_sign-m_ind           = im_ind.

      wa_data-billingdocument = im_bill.
    wa_data-base64_3        = pdf_64.
    wa_data-m_ind           = im_ind.




MODIFY ztb_tax_new FROM @wa_data.
MODIFY ztd_sign_b64 FROM @wa_sign.


  ENDMETHOD.
ENDCLASS.
