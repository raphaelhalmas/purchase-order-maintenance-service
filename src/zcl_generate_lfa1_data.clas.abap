CLASS ZCL_Generate_LFA1_Data DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.

CLASS ZCL_Generate_LFA1_Data IMPLEMENTATION.

  METHOD if_oo_adt_classrun~main.
    DATA lt_lfa1 TYPE TABLE OF zdt_lfa1.

    TRY.
      DATA(supplier_id) = cl_system_uuid=>create_uuid_x16_static( ).

      INSERT VALUE #(
        supplier_id = supplier_id
        lifnr = `0000100026`
        name1 = `Aurora Plumbing Corp.`
      )
      INTO TABLE lt_lfa1.

      supplier_id = cl_system_uuid=>create_uuid_x16_static( ).

      INSERT VALUE #(
        supplier_id = supplier_id
        lifnr = `0000100281`
        name1 = `Xtreme Fire Protection, Inc.`
      )
      INTO TABLE lt_lfa1.

    CATCH cx_uuid_error.
    ENDTRY.

    DELETE FROM zdt_lfa1.
    INSERT zdt_lfa1 FROM TABLE @lt_lfa1.

    out->write( |{ sy-dbcnt } LFA1 entries inserted successfully!| ).
  ENDMETHOD.

ENDCLASS.
