CLASS ZCL_Generate_EKKO_Data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_GENERATE_EKKO_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_ekko TYPE TABLE OF zdt_ekko.

    INSERT VALUE #(
      purg_doc_id = `121C7BA40F231EEC83D3EBBAF1CA97D4`
      ebeln = `4500000837`
      bukrs = `AH02`
      bstyp = `F`
      bsart = `ZPPD`
      lifnr = `0000100026`
      ekorg = `AHSF`
      ekgrp = `PCT`
      waers = `USD`
      bedat = `20201201`
      netwr = `11180.00`
    )
    INTO TABLE lt_ekko.

    INSERT VALUE #(
      purg_doc_id = `1208CCFBEA871EDC83D3F154E3DFC37A`
      ebeln = `4500002025`
      bukrs = `AH02`
      bstyp = `F`
      bsart = `ZPPD`
      lifnr = `0000100281`
      ekorg = `AHSF`
      ekgrp = `PCT`
      waers = `USD`
      bedat = `20210829`
      netwr = `9450.00`
    )
    INTO TABLE lt_ekko.

    DELETE FROM zdt_ekko.
    INSERT zdt_ekko FROM TABLE @lt_ekko.

    out->write( |{ sy-dbcnt } EKKO entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
