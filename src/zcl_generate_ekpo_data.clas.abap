CLASS ZCL_Generate_EKPO_Data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS ZCL_GENERATE_EKPO_DATA IMPLEMENTATION.


  METHOD if_oo_adt_classrun~main.
    DATA lt_ekpo TYPE TABLE OF zdt_ekpo.

    TRY.
      DATA(purg_doc_item_id) = cl_system_uuid=>create_uuid_x16_static( ).

      INSERT VALUE #(
        purg_doc_item_id = purg_doc_item_id
        purg_doc_id = `121C7BA40F231EEC83D3EBBAF1CA97D4`
        ebeln = `4500000837`
        ebelp = `00010`
        matkl = `P001`
        txz01 = `BA Shop Drawing, Permit and Bond`
        menge = `1.000`
        meins = `AU`
        netpr = `11180.00`
      )
      INTO TABLE lt_ekpo.

      purg_doc_item_id = cl_system_uuid=>create_uuid_x16_static( ).

      INSERT VALUE #(
        purg_doc_item_id = purg_doc_item_id
        purg_doc_id = `1208CCFBEA871EDC83D3F154E3DFC37A`
        ebeln = `4500002025`
        ebelp = `00010`
        matkl = `P001`
        txz01 = `BE Sprinkler Rough`
        menge = `1.000`
        meins = `AU`
        netpr = `450.00`
      )
      INTO TABLE lt_ekpo.

      purg_doc_item_id = cl_system_uuid=>create_uuid_x16_static( ).

      INSERT VALUE #(
        purg_doc_item_id = purg_doc_item_id
        purg_doc_id = `1208CCFBEA871EDC83D3F154E3DFC37A`
        ebeln = `4500002025`
        ebelp = `00020`
        matkl = `P001`
        txz01 = `BE Shopdrawing, Permit and Bond`
        menge = `1.000`
        meins = `AU`
        netpr = `3000.00`
      )
      INTO TABLE lt_ekpo.

      purg_doc_item_id = cl_system_uuid=>create_uuid_x16_static( ).

      INSERT VALUE #(
        purg_doc_item_id = purg_doc_item_id
        purg_doc_id = `1208CCFBEA871EDC83D3F154E3DFC37A`
        ebeln = `4500002025`
        ebelp = `00030`
        matkl = `P001`
        txz01 = `BE 4" Underground Fire Service Line`
        menge = `1.000`
        meins = `AU`
        netpr = `6000.00`
      )
      INTO TABLE lt_ekpo.

    CATCH cx_uuid_error.
    ENDTRY.

    DELETE FROM zdt_ekpo.
    INSERT zdt_ekpo FROM TABLE @lt_ekpo.

    out->write( |{ sy-dbcnt } EKPO entries inserted successfully!| ).
  ENDMETHOD.
ENDCLASS.
