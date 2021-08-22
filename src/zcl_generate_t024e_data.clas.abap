CLASS zcl_generate_t024e_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_T024E_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_t024e TYPE TABLE OF zdt_t024e.

    lt_t024e = VALUE #(
      ( ekorg = `AHSF` ekotx = `AHS Florida` )
    ).

    DELETE FROM zdt_t024e.
    INSERT zdt_t024e FROM TABLE @lt_t024e.

    out->write( |{ sy-dbcnt } T024E entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
