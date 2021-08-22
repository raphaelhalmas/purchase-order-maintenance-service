CLASS zcl_generate_ekpo_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS ZCL_GENERATE_EKPO_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_ekpo TYPE TABLE OF zdt_ekpo.

    lt_ekpo = VALUE #(
      ( ebeln = `4500000837` ebelp = `00010` txz01 = `BA Shop Drawing, Permit and Bond` menge = `1.000` meins = `AU` netpr = `11180.00` )
    ).

    DELETE FROM zdt_ekpo.
    INSERT zdt_ekpo FROM TABLE @lt_ekpo.

    out->write( |{ sy-dbcnt } EKPO entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
