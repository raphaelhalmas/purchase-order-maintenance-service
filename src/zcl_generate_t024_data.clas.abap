CLASS zcl_generate_t024_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.

CLASS zcl_generate_t024_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_t024 TYPE TABLE OF zdt_t024.

    lt_t024 = VALUE #(
      ( ekgrp = `PCT` eknam = `Construction` )
    ).

    DELETE FROM zdt_t024.
    INSERT zdt_t024 FROM TABLE @lt_t024.

    out->write( |{ sy-dbcnt } T024 entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
