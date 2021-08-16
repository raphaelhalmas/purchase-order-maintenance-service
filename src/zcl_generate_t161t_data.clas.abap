
CLASS zcl_generate_t161t_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_t161t_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_t161t TYPE TABLE OF zdt_t161t.

    lt_t161t = VALUE #(
      ( bstyp = `F` bsart = `ZPPD` batxt = `Proj. w/o agreement` )
    ).

    DELETE FROM zdt_t161t.
    INSERT zdt_t161t FROM TABLE @lt_t161t.

    out->write( |{ sy-dbcnt } T161T entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
