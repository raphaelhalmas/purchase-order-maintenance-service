CLASS zcl_generate_ekko_data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.


CLASS zcl_generate_ekko_data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_ekko TYPE TABLE OF zdt_ekko.

    lt_ekko = VALUE #(
      ( ebeln = `4500000837` bukrs = `AH02` bstyp = `F` bsart = `ZPPD` lifnr = `0000100026` bedat = `20201201` )
    ).

    DELETE FROM zdt_ekko.
    INSERT zdt_ekko FROM TABLE @lt_ekko.

    out->write( |{ sy-dbcnt } EKKO entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
