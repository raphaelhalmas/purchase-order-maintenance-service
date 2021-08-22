CLASS zcl_generate_lfa1_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_LFA1_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_lfa1 TYPE TABLE OF zdt_lfa1.

    lt_lfa1 = VALUE #(
      ( lifnr = `0000100026` name1 = `Aurora Plumbing Corp.` )
    ).

    DELETE FROM zdt_lfa1.
    INSERT zdt_lfa1 FROM TABLE @lt_lfa1.

    out->write( |{ sy-dbcnt } LFA1 entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
