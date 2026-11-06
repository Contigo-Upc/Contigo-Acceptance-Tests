Feature: US-20 - Historial de documentos escaneados
  Como usuario
  Deseo ver los recibos que ya escaneé anteriormente
  Para reutilizarlos sin volver a fotografiarlos

#-------------------------------------------------------------------------------------------
Scenario: Visualización del historial

    Given el usuario escaneó un recibo previamente
    When busca en "Mis documentos"
    Then el sistema muestra la lista de documentos escaneados con fecha


#-------------------------------------------------------------------------------------------
Scenario: Historial vacío

    Given el usuario nunca escaneó un documento
    When ingresa a "Mis documentos"
    Then el sistema muestra un mensaje indicando que aún no hay documentos guardados


#-------------------------------------------------------------------------------------------
Scenario: Eliminar un documento

    Given el usuario ya no necesita un documento guardado
    When lo selecciona y presiona "Eliminar"
    Then el sistema lo retira del historial
