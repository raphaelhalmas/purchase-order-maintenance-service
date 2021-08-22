CLASS zcl_generate_t161_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_T161_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_t161 TYPE TABLE OF zdt_t161.

    lt_t161 = VALUE #(
      ( bstyp = `F` bsart = `ZPPD` )
    ).

    DELETE FROM zdt_t161.
    INSERT zdt_t161 FROM TABLE @lt_t161.

    out->write( |{ sy-dbcnt } T161 entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
