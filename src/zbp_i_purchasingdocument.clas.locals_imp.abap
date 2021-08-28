CLASS LHC_PurchasingDocument DEFINITION INHERITING FROM cl_abap_behavior_handler.
  PRIVATE SECTION.

    METHODS setPurchasingDocument FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocument~setPurchasingDocument.

    METHODS setPurchasingDocumentItem FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocumentItem~setPurchasingDocumentItem.

ENDCLASS.

CLASS LHC_PurchasingDocument IMPLEMENTATION.

  METHOD setPurchasingDocument.
    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(purchasing_documents).

    SELECT SINGLE FROM zdt_ekko FIELDS MAX( ebeln ) INTO @DATA(document_number).

*   LOOP AT purchasing_documents ASSIGNING FIELD-SYMBOL(<purchasing_document>).
*     purchasing_document_number = purchasing_document_number + 1.
*     <purchasing_document>-PurchasingDocument = CONDENSE( purchasing_document_number ).
*   ENDLOOP.
*
*   MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE ENTITY PurchasingDocument
*     UPDATE FIELDS ( PurchasingDocument DocumentCurrency )
*     WITH CORRESPONDING #( purchasing_documents )
*     MAPPED DATA(mapped_data)
*     FAILED DATA(failed_data)
*     REPORTED DATA(reported_data).

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
        UPDATE FIELDS ( PurchasingDocument )
        WITH VALUE #( FOR purchasing_document IN purchasing_documents INDEX INTO table_index (
          %key = purchasing_document-%key
          PurchasingDocument = document_number + table_index )
        )
        REPORTED DATA(reported_data).
  ENDMETHOD.

  METHOD setPurchasingDocumentItem.
    DATA entities_to_be_updated TYPE TABLE FOR UPDATE ZI_PurchasingDocument\\PurchasingDocumentItem.

*   READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
*     ENTITY PurchasingDocumentItem
*       FIELDS ( PurchasingDocumentItem )
*       WITH CORRESPONDING #( keys )
*       RESULT DATA(purchasing_document_items).
*
*   MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
*     ENTITY PurchasingDocumentItem
*       UPDATE FIELDS ( PurchasingDocumentItem )
*       WITH VALUE #( FOR purchasing_document_item IN purchasing_document_items INDEX INTO table_index (
*         %key = purchasing_document_item-%key
*         PurchasingDocumentItem = table_index * 10 )
*       )
*       REPORTED DATA(reported_data).

    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocumentItem BY \_PurchasingDocument
        FIELDS ( PurchasingDocument )
        WITH CORRESPONDING #( keys )
        RESULT DATA(purchasing_documents).

    LOOP AT purchasing_documents INTO DATA(purchasing_document).
      SELECT SINGLE FROM zdt_ekpo FIELDS MAX( ebelp )
        WHERE ebeln = @purchasing_document-PurchasingDocument
        INTO @DATA(item_number).

      READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
        ENTITY PurchasingDocument BY \_PurchasingDocumentItem
        FIELDS ( PurchasingDocumentItemId PurchasingDocumentItem )
        WITH VALUE #( ( %tky = purchasing_document-%tky ) )
        RESULT DATA(purchasing_document_items).

      LOOP AT purchasing_document_items INTO DATA(purchasing_document_item)
        WHERE PurchasingDocumentItem IS INITIAL.

        APPEND VALUE #(
          %tky = purchasing_document_item-%tky
          PurchasingDocument = purchasing_document-PurchasingDocument
          PurchasingDocumentItem = sy-index * 10 + item_number ) TO entities_to_be_updated.
      ENDLOOP.
    ENDLOOP.

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocumentItem
      UPDATE FIELDS ( PurchasingDocument PurchasingDocumentItem ) WITH entities_to_be_updated
      REPORTED DATA(reported_data).

    reported = CORRESPONDING #( DEEP reported_data ).
  ENDMETHOD.

ENDCLASS.
