CLASS lhc_supplier DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS setAccountNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR Supplier~setAccountNumber.

ENDCLASS.

CLASS lhc_supplier IMPLEMENTATION.

  METHOD setAccountNumber.
    READ ENTITIES OF ZI_Supplier IN LOCAL MODE
      ENTITY Supplier
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(suppliers).

    SELECT SINGLE FROM zdt_lfa1 FIELDS MAX( lifnr ) INTO @DATA(account_number).

    MODIFY ENTITIES OF ZI_Supplier IN LOCAL MODE
      ENTITY Supplier
        UPDATE FIELDS ( Supplier )
        WITH VALUE #( FOR supplier IN suppliers INDEX INTO table_index (
          %key = supplier-%key
          Supplier = account_number + table_index )
        )
        REPORTED DATA(reported_data).
  ENDMETHOD.

ENDCLASS.
