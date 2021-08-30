CLASS lhc_purchasingdocument DEFINITION INHERITING FROM cl_abap_behavior_handler.

  PRIVATE SECTION.

    METHODS setDocumentNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocument~setDocumentNumber.

    METHODS setItemNumber FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocumentItem~setItemNumber.

    METHODS setDocumentCurrency FOR DETERMINE ON SAVE
      IMPORTING keys FOR PurchasingDocument~setDocumentCurrency.

    METHODS calculateTotalPrice FOR DETERMINE ON MODIFY
      IMPORTING keys FOR PurchasingDocumentItem~calculateTotalPrice.
    METHODS recalculateTotalPrice FOR MODIFY
      IMPORTING keys FOR ACTION PurchasingDocument~recalculateTotalPrice.

ENDCLASS.

CLASS lhc_purchasingdocument IMPLEMENTATION.

  METHOD setDocumentNumber.
    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
      ALL FIELDS WITH CORRESPONDING #( keys )
      RESULT DATA(purchasing_documents).

    SELECT SINGLE FROM zdt_ekko FIELDS MAX( ebeln ) INTO @DATA(document_number).

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
        UPDATE FIELDS ( PurchasingDocument )
        WITH VALUE #( FOR purchasing_document IN purchasing_documents INDEX INTO table_index (
          %key = purchasing_document-%key
          PurchasingDocument = document_number + table_index )
        )
        REPORTED DATA(reported_data).
  ENDMETHOD.

  METHOD setItemNumber.
    DATA entities_to_be_updated TYPE TABLE FOR UPDATE ZI_PurchasingDocument\\PurchasingDocumentItem.

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

  METHOD setDocumentCurrency.
    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
        FIELDS ( DocumentCurrency )
        WITH CORRESPONDING #( keys )
        RESULT DATA(purchasing_documents).

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
        UPDATE FIELDS ( DocumentCurrency )
        WITH VALUE #( FOR purchasing_document IN purchasing_documents (
          %key = purchasing_document-%key
          DocumentCurrency = 'USD' )
        )
        REPORTED DATA(reported_data).
  ENDMETHOD.

  METHOD calculateTotalPrice.
    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocumentItem BY \_PurchasingDocument
      FIELDS ( PurchasingDocumentId )
      WITH CORRESPONDING #( keys )
      RESULT DATA(purchasing_documents)
      FAILED DATA(read_failed).

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
      EXECUTE recalculateTotalPrice
      FROM CORRESPONDING #( purchasing_documents )
      REPORTED DATA(execute_reported).

    reported = CORRESPONDING #( DEEP execute_reported ).
  ENDMETHOD.

  METHOD recalculateTotalPrice.
    DATA: total_price TYPE p DECIMALS 2 LENGTH 15.

    READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
      ALL FIELDS
      WITH CORRESPONDING #( keys )
      RESULT DATA(purchasing_documents).

    LOOP AT purchasing_documents ASSIGNING FIELD-SYMBOL(<purchasing_document>).
      READ ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
        ENTITY PurchasingDocument BY \_PurchasingDocumentItem
        ALL FIELDS
        WITH VALUE #( ( %tky = <purchasing_document>-%tky ) )
        RESULT DATA(purchasing_document_items).

      LOOP AT purchasing_document_items ASSIGNING FIELD-SYMBOL(<purchasing_document_item>).
        total_price += <purchasing_document_item>-OrderQuantity * <purchasing_document_item>-NetPriceAmount.
      ENDLOOP.

      <purchasing_document>-PurchasingDocumentNetAmount = total_price.
    ENDLOOP.

*   MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
*     ENTITY PurchasingDocument
*     UPDATE FIELDS ( PurchasingDocumentNetAmount )
*     WITH CORRESPONDING #( purchasing_documents ).

    MODIFY ENTITIES OF ZI_PurchasingDocument IN LOCAL MODE
      ENTITY PurchasingDocument
      UPDATE FROM VALUE #( FOR purchasing_document IN purchasing_documents (
        PurchasingDocumentId = purchasing_document-PurchasingDocumentId
        PurchasingDocumentNetAmount = purchasing_document-PurchasingDocumentNetAmount
        %control-PurchasingDocumentNetAmount = if_abap_behv=>mk-on ) ) .
  ENDMETHOD.

ENDCLASS.
