CLASS zcl_generate_t001_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_t001_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_t001 TYPE TABLE OF zdt_t001.

    lt_t001 = VALUE #(
      ( bukrs = `AH02` butxt = `AHS Multif Construction` )
    ).

    DELETE FROM zdt_t001.
    INSERT zdt_t001 FROM TABLE @lt_t001.

    out->write( |{ sy-dbcnt } T001 entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
