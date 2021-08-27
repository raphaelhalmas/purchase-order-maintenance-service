CLASS LHC_PurchasingDocument DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS setPurchasingDocument FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocument~setPurchasingDocument.

    METHODS setPurchasingDocumentItem FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocumentItem~setPurchasingDocumentItem.

ENDCLASS.

CLASS LHC_PurchasingDocument IMPLEMENTATION.

  METHOD setPurchasingDocument.
    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE ENTITY PurchasingDocument
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(lt_purchasing_document).

    SELECT SINGLE FROM zdt_ekko FIELDS MAX( ebeln ) INTO @DATA(lv_purchasing_document).

*   LOOP AT lt_purchasing_document ASSIGNING FIELD-SYMBOL(<lfs_purchasing_document>).
*     lv_purchasing_document = lv_purchasing_document + 1.
*     <lfs_purchasing_document>-PurchasingDocument = CONDENSE( lv_purchasing_document ).
*   ENDLOOP.
*
*   MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE ENTITY PurchasingDocument
*     UPDATE FIELDS ( PurchasingDocument DocumentCurrency )
*     WITH CORRESPONDING #( lt_purchasing_document )
*     MAPPED DATA(lt_mapped)
*     FAILED DATA(lt_failed)
*     REPORTED DATA(lt_reported).

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
        UPDATE FIELDS ( PurchasingDocument )
        WITH VALUE #( FOR ls_purchasing_document IN lt_purchasing_document INDEX INTO i (
          %key = ls_purchasing_document-%key
          PurchasingDocument = lv_purchasing_document + i ) ) REPORTED DATA(lt_reported).
  ENDMETHOD.

  METHOD setPurchasingDocumentItem.
    DATA update TYPE TABLE FOR UPDATE ZI_PurchasingDocument\\PurchasingDocumentItem.

    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocumentItem BY \_PurchasingDocument
        FIELDS ( PurchasingDocumentId )
        WITH CORRESPONDING #( keys )
        RESULT DATA(lt_purchasing_document).

    LOOP AT lt_purchasing_document INTO DATA(ls_purchasing_document).
      READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
        ENTITY PurchasingDocument BY \_PurchasingDocumentItem
        FIELDS ( PurchasingDocumentItemId )
        WITH VALUE #( ( %tky = ls_purchasing_document-%tky ) )
        RESULT DATA(lt_purchasing_document_item).

      LOOP AT lt_purchasing_document_item INTO DATA(ls_purchasing_document_item)
        WHERE PurchasingDocumentItem IS INITIAL.

        APPEND VALUE #(
          %tky = ls_purchasing_document_item-%tky
          PurchasingDocumentItem = 10 ) TO update.
      ENDLOOP.
    ENDLOOP.

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
    ENTITY PurchasingDocumentItem
    UPDATE FIELDS ( PurchasingDocumentItem ) WITH update
    REPORTED DATA(update_reported).

    reported = CORRESPONDING #( DEEP update_reported ).

    IF sy-subrc = 0.

    ENDIF.
  ENDMETHOD.

ENDCLASS.
